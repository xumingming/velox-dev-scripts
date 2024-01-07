# https://stackoverflow.com/questions/69914876/why-xcode-can-not-attach-to-some-programs

# Show original entitlements
codesign --display --xml --entitlements jdk.entitlements

# Add get-task-allow
# <key>com.apple.security.get-task-allow</key><true/>

# Sign with the new entitlements
sudo codesign -s - --deep --force --options=runtime --entitlements jdk.entitlements `which java`