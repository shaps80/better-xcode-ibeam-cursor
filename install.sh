#!/bin/bash

echo 'Downloading new image'
curl -o /tmp/DVTIbeamCursor.tiff https://raw.githubusercontent.com/shaps80/better-xcode-ibeam-cursor/master/DVTIbeamCursor.tiff

echo 'Backing up the original cursor that ships with Xcode to ./backup-DVTIbeamCursor.tiff'
cp /Applications/Xcode.app/Contents/SharedFrameworks/DVTKit.framework/Resources/DVTIbeamCursor.tiff ./backup-DVTIbeamCursor.tiff
echo 'Copying the improved ibeam cursor to the correct location'
sudo cp /tmp/DVTIbeamCursor.tiff /Applications/Xcode.app/Contents/SharedFrameworks/DVTKit.framework/Resources/DVTIbeamCursor.tiff

echo 'Backing up the original cursor that ships with Terminal to ./backup-ShadowedIBeam.tiff'
cp /Applications/Utilities/Terminal.app/Contents/Resources/ShadowedIBeam.tiff ./backup-ShadowedIBeam.tiff
echo 'Copying the improved ibeam cursor to the correct location'
sudo cp /tmp/DVTIbeamCursor.tiff /Applications/Utilities/Terminal.app/Contents/Resources/ShadowedIBeam.tiff

defaults write com.apple.Terminal UseCustomIBeamCursor -bool YES

echo 'Removing downloaded image'
rm -f /tmp/DVTIbeamCursor.tiff

echo 'Done - restart Xcode and have fun!'
