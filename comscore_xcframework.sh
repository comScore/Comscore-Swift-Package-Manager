#!/bin/bash

execution_dir=`pwd`

xcframework_name="ComScore.xcframework"
xcframework_zip_name="$xcframework_name.zip"

xcframework_path="$execution_dir/$xcframework_name"
package_file_path="$execution_dir/Package.swift"

framework_dir="$1/ComScore/dynamic"
if [ ! -d "$framework_dir" ]; then
    echo "Please provide a correct local path to the ComScore-iOS-watchOS-tvOS repository!"
    exit 0
fi

version="v$2"
if [ -z "$version" ]; then
    echo "\$Please provide a release version. Example: 6.6.0"
    exit 0
fi

if [ ! -f "$package_file_path" ]; then
    echo "Package.swift file does not exist in the working directory."
    exit 0
fi

pushd "$framework_dir" > /dev/null
rm -rf "$xcframework_path"

echo "Extracting slices..."
mkdir -p variants/iphoneos
cp -R iOS/ComScore.framework variants/iphoneos
lipo -remove i386 -remove x86_64 -output variants/iphoneos/ComScore.framework/ComScore variants/iphoneos/ComScore.framework/ComScore

mkdir -p variants/iphonesimulator
cp -R iOS/ComScore.framework variants/iphonesimulator
lipo -remove armv7 -remove arm64 -output variants/iphonesimulator/ComScore.framework/ComScore variants/iphonesimulator/ComScore.framework/ComScore

mkdir -p variants/appletvos
cp -R tvOS/ComScore.framework variants/appletvos
lipo -remove x86_64 -output variants/appletvos/ComScore.framework/ComScore variants/appletvos/ComScore.framework/ComScore

mkdir -p variants/appletvsimulator
cp -R tvOS/ComScore.framework variants/appletvsimulator
lipo -remove arm64 -output variants/appletvsimulator/ComScore.framework/ComScore variants/appletvsimulator/ComScore.framework/ComScore

mkdir -p variants/watchos
cp -R watchOS/ComScore.framework variants/watchos
lipo -remove i386 -remove x86_64 -output variants/watchos/ComScore.framework/ComScore variants/watchos/ComScore.framework/ComScore

mkdir -p variants/watchsimulator
cp -R watchOS/ComScore.framework variants/watchsimulator
lipo -remove armv7k -remove arm64_32 -output variants/watchsimulator/ComScore.framework/ComScore variants/watchsimulator/ComScore.framework/ComScore

echo "Packaging XCFramework..."
xcodebuild -create-xcframework \
    -framework variants/iphoneos/ComScore.framework \
    -framework variants/iphonesimulator/ComScore.framework \
    -framework variants/appletvos/ComScore.framework \
    -framework variants/appletvsimulator/ComScore.framework \
    -framework variants/watchos/ComScore.framework \
    -framework variants/watchsimulator/ComScore.framework \
    -output "$xcframework_path"

rm -rf variants
popd > /dev/null
pushd $execution_dir > /dev/null

echo "Creating zip..."
zip -r "$xcframework_zip_name" "$xcframework_name" > /dev/null
rm -rf "$xcframework_name"

#Calculate and replace the hash in the Swift config file
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

echo "\nCommiting and creating a Tag..."
git add $package_file_path
git add $xcframework_zip_name
git commit -m "New release: $version"
git tag -a $version -m "New release: $version"
git push origin master
git push origin $version

echo "\nPROCESS COMPLETED SUCCESFULLY!"
popd > /dev/null
