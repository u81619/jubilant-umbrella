.PHONY: build test clean run

PROJECT_NAME = SimpleTableApp
SCHEME = SimpleTableApp
DESTINATION = platform=iOS Simulator,name=iPhone 14,OS=16.4

setup:
    xcodebuild -resolvePackageDependencies
    pod install

build:
    xcodebuild \
        -project $(PROJECT_NAME).xcodeproj \
        -scheme $(SCHEME) \
        -destination "$(DESTINATION)" \
        clean build

test:
    xcodebuild test \
        -project $(PROJECT_NAME).xcodeproj \
        -scheme $(SCHEME) \
        -destination "$(DESTINATION)"

clean:
    xcodebuild clean \
        -project $(PROJECT_NAME).xcodeproj \
        -scheme $(SCHEME)

run:
    xcodebuild \
        -project $(PROJECT_NAME).xcodeproj \
        -scheme $(SCHEME) \
        -destination "$(DESTINATION)" \
        build
    xcrun simctl install booted ./build/$(DESTINATION)/$(PROJECT_NAME).app
    xcrun simctl launch booted com.example.$(PROJECT_NAME)

archive:
    xcodebuild archive \
        -project $(PROJECT_NAME).xcodeproj \
        -scheme $(SCHEME) \
        -archivePath ./build/$(PROJECT_NAME).xcarchive \
        -destination generic/platform=iOS

ipa:
    xcodebuild -exportArchive \
        -archivePath ./build/$(PROJECT_NAME).xcarchive \
        -exportPath ./build \
        -exportOptionsPlist ExportOptions.plist

lint:
    swiftlint --fix
    swiftlint

help:
    @echo "الأوامر المتاحة:"
    @echo "  make setup    - تثبيت التبعيات"
    @echo "  make build    - بناء المشروع"
    @echo "  make test     - تشغيل الاختبارات"
    @echo "  make clean    - تنظيف المشروع"
    @echo "  make run      - تشغيل التطبيق على المحاكي"
    @echo "  make archive  - إنشاء أرشيف للتطبيق"
    @echo "  make ipa      - إنشاء ملف IPA"
    @echo "  make lint     - فحص وتصحيح الكود"
    @echo "  make help     - عرض هذه المساعدة"
