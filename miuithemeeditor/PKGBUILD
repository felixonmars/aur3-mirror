# Maintainer: dongfengweixiao <dongfengweixiao@gmail.com>

pkgname=miuithemeeditor
pkgver=20120625
pkgrel=3
pkgdesc="An applications for edit miui theme(mtz)."
arch=('any')
license=("Custom")
url="http://www.miui.com/thread-553310-1-1.html"
depends=('jre' 'android-sdk-platform-tools' 'android-apktool')
source=('http://gthemes-china.googlecode.com/files/MIUIThemeEditor.zip' 'miuithemeeditor.png' 'miuithemeeditor.desktop')

sha1sums=('13eb19834bd070ed23ea175c727ed9c6f885e5da'
          '27e18177bccfeae7a21a17808a86b22838b830e6'
          '202e0c436f6c069d49bd85cf9ec9877381ba16b6')


package() {
    install -d "$pkgdir"/{opt/miui/themeeditor/{tools,configuration},usr/{bin,share/{applications,icons}}}
    install -m 755 $srcdir/run-linux.sh $pkgdir/opt/miui/themeeditor
    install -m 755 $srcdir/tools/MIUIThemeEditor.jar $pkgdir/opt/miui/themeeditor/tools
    install -m 755 $srcdir/tools/ShowApps.apk $pkgdir/opt/miui/themeeditor/tools
    install -m 644 $srcdir/miuithemeeditor.png $pkgdir/usr/share/icons/
    install -m 644 $srcdir/miuithemeeditor.desktop $pkgdir/usr/share/applications

    cp -rf $srcdir/configuration $pkgdir/opt/miui/themeeditor
    ln -s '/opt/android-sdk/platform-tools/aapt' $pkgdir/opt/miui/themeeditor/tools
    ln -s '/opt/android-sdk/platform-tools/adb' $pkgdir/opt/miui/themeeditor/tools
    ln -s '/usr/bin/apktool' $pkgdir/opt/miui/themeeditor/tools
    ln -s '/usr/bin/apktool.jar' $pkgdir/opt/miui/themeeditor/tools
    ln -s '/opt/miui/themeeditor/run-linux.sh' $pkgdir/usr/bin/miuithemeeditor
    sed -i 's/tools/\/opt\/miui\/themeeditor\/tools/' $pkgdir/opt/miui/themeeditor/run-linux.sh
}
