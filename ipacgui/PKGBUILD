# Maintainer: NiteHogg <keith.b.elliott [at] gmail [dot] com>
pkgname=ipacgui
pkgver=0.3
_pkgver=0_3
pkgrel=1
pkgdesc="GUI for I-PAC USB keyboard encoder programming utility."
arch=('any')
url="http://www.zumbrovalley.net"
license=('GPL')
changelog=ChangeLog
depends=('ipacutil' 'python2' 'pygtk' 'gtk2')
source=("http://www.zumbrovalley.net/ipacutil/dnld/$pkgname"_"$_pkgver.tar.gz")
md5sums=('de6f49bb346ab37254d0366ed4f8ea45')

package() {

    install -d $pkgdir/usr/bin $pkgdir/usr/share/{applications,ipacgui,pixmaps}
    cd $srcdir/$pkgname'_'$pkgver/usr

    install share/games/ipacgui/* $pkgdir/usr/share/ipacgui
    install share/pixmaps/* $pkgdir/usr/share/pixmaps/
    sed -r 's|/usr/games|/usr/bin|g;s|(Categories=).*|\1GTK;Utility|g' share/applications/ipacgui.desktop > $pkgdir/usr/share/applications/ipacgui.desktop
    sed -r 's|(IPATH=).*|\1/usr/share/ipacgui|g;s|python|python2|g' games/ipacgui > $pkgdir/usr/bin/ipacgui
    chmod 755 $pkgdir/usr/bin/ipacgui
}

# vim:set ts=2 sw=2 et:
