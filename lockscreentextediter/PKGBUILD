pkgname=lockscreentextediter
pkgver=20120625
pkgrel=1
pkgdesc="An applications for edit miui lock screen theme(mtz)."
arch=('any')
license=("Custom")
url="http://www.miui.com/thread-553310-1-1.html"
depends=('jre' 'android-sdk-platform-tools' 'android-apktool')
source=('lockscreentextediter.png' 'http://gthemes-china.googlecode.com/files/LockscreenTextEditer.zip' 'miuilockscreentextediter.desktop')

sha1sums=('6d6ec90d6c050316240c184406df82b319e658a4'
          '62188a0db1af52d81943654243916403e357d894'
          'aaacc7993354006c7e3a0422e2a1273fd55e6a91')

package() {
    install -d "$pkgdir"/{opt/miui/lockscreentextediter/,usr/{bin,share/{applications,icons}}}
    install -m 644 $srcdir/LockscreenTextEditer/description.xml $pkgdir/opt/miui/lockscreentextediter/
    install -m 755 $srcdir/LockscreenTextEditer/LockscreenTextEditer.jar $pkgdir/opt/miui/lockscreentextediter/
    install -m 755 $srcdir/LockscreenTextEditer/run_linux.sh $pkgdir/opt/miui/lockscreentextediter/
    install -m 644 $srcdir/LockscreenTextEditer/schema.xml $pkgdir/opt/miui/lockscreentextediter/
    install -m 644 $srcdir/lockscreentextediter.png $pkgdir/usr/share/icons
    install -m 644 $srcdir/miuilockscreentextediter.desktop $pkgdir/usr/share/applications

    ln -s '/opt/miui/lockscreentextediter/run_linux.sh' $pkgdir/usr/bin/lockscreentextediter
    sed -i 's/LockscreenTextEditer/\/opt\/miui\/lockscreentextediter\/LockscreenTextEditer/' $pkgdir/opt/miui/lockscreentextediter/run_linux.sh
}
