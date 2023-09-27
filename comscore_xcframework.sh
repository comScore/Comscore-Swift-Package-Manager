#!/bin/bash

execution_dir=`pwd`

xcframework_name="ComScore.xcframework"
xcframework_zip_name="$xcframework_name.zip"

xcframework_path="$execution_dir/$xcframework_name"
package_file_path="$execution_dir/Package.swift"

framework_dir="$1/ComScore/dynamic"
if [ ! -d "$framework_dir" ]; then
    echo "Please provide a correct local path to the ComScore-iOS-watchOS-tvOS (CocoPods) repository!"
    exit 0
fi

version="v$2"
if [ -z "$version" ]; then
    echo "\$Please provide a release version. Example: 6.7.0"
    exit 0
fi

if [ ! -f "$package_file_path" ]; then
    echo "Package.swift file does not exist in the working directory."
    exit 0
fi

# Using xcframework delivery from CocoaPods repo
pushd "$framework_dir" > /dev/null
rm -rf "$xcframework_path"

cp -R ComScore.xcframework "$xcframework_path"

popd > /dev/null
pushd $execution_dir > /dev/null

echo "Creating zip..."
rm -rf "$xcframework_zip_name"
zip -r "$xcframework_zip_name" "$xcframework_name" > /dev/null
rm -rf "$xcframework_name"

# Calculate and replace the hash in the Swift config file
echo "Calculating hash..."
hash=`swift package compute-checksum "$xcframework_zip_name"`

old_hash=$(grep 'checksum: String =' Package.swift)
old_hash="$(echo -e "${old_hash}" | sed -e 's/^[[:space:]]*//')"

new_hash="static let checksum: String = \"$hash\""
sed -i -e "s/$old_hash/$new_hash/g" $package_file_path

# Replace version
old_version=$(grep 'version: String =' Package.swift)
old_version="$(echo -e "${old_version}" | sed -e 's/^[[:space:]]*//')"

new_version="static let version: String = \"$version\""
sed -i -e "s/$old_version/$new_version/g" $package_file_path
rm "$package_file_path-e"

printf "\nCommiting and creating a Tag..."
git add $package_file_path
git add $xcframework_zip_name
git commit -m "New release: $version"
git tag -a $version -m "New release: $version"
git push origin staging
git push origin $version

printf "\nPROCESS COMPLETED SUCCESFULLY!"
popd > /dev/null
