# VCS2Plist_PhoneCode
腾讯短信国家号vcs文件转成自定义的plist

首先要删除vcs里面的标题（去除不要数据）

然后用number打开，然后再存为vcs（转码，vcs原来的编码是GBK，要变成utf8）

本测试项目中vcs已经是utf8的编码了


vcs解析采用的是https://github.com/JanX2/cCSVParse

```
<!--结果例子-->
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <array>
        <dict>
            <key>code</key>
            <string>HK</string>
            <key>name_en</key>
            <string>Hong Kong</string>
            <key>name_zh_Hans</key>
            <string>中国香港</string>
            <key>name_zh_Hant</key>
            <string>中國香港</string>
            <key>number</key>
            <string>852</string>
        </dict>
        <dict>
            <key>code</key>
            <string>MO</string>
            <key>name_en</key>
            <string>Macau</string>
            <key>name_zh_Hans</key>
            <string>中国澳门</string>
            <key>name_zh_Hant</key>
            <string>中國澳門</string>
            <key>number</key>
            <string>853</string>
        </dict>
    </array>
</plist>


```
