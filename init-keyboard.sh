#!/bin/bash

# 1. 설정값 (한 줄로)
MAPPING='{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x7000000e7,"HIDKeyboardModifierMappingDst":0x70000006d},{"HIDKeyboardModifierMappingSrc":0x700000089,"HIDKeyboardModifierMappingDst":0x700000035}]}'

# 2. 즉시 적용
hidutil property --set "$MAPPING"

# 3. LaunchAgent 등록
PLIST_PATH="$HOME/Library/LaunchAgents/com.user.keyboard.plist"
mkdir -p "$HOME/Library/LaunchAgents"

cat <<EOF > "$PLIST_PATH"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.user.keyboard</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/bin/hidutil</string>
        <string>property</string>
        <string>--set</string>
        <string>$MAPPING</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
EOF

# 4. 서비스 로드
launchctl unload "$PLIST_PATH" 2>/dev/null
launchctl load "$PLIST_PATH"

echo "✅ 완료: ₩ → \` 및 오른쪽 Cmd → F18"
