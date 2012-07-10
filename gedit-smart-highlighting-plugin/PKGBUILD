# Maintainer: NiteHogg <keith.b.elliott [at] gmail [dot] com>
pkgname=gedit-smart-highlighting-plugin
_pkgname=smart_highlighting
_shortname=smart_highlight
pkgver=3.0.3
pkgrel=1
pkgdesc="Smart highlighting plugin for gedit3.x(Gnome3)"
arch=(any)
url="http://code.google.com/p/smart-highlighting-gedit/"
license=('GPL2')
depends=("gedit")
changelog=ChangeLog
source=(http://smart-highlighting-gedit.googlecode.com/files/$_pkgname-$pkgver.tar.gz)
md5sums=('cf9d4c3c611bb0bf53957f7c6ca4e664')

package() {
    mkdir -p "$pkgdir/usr/lib/gedit/plugins/"

    _root="src"
    #_root="$_pkgname-$pkgver"

    # l10n will be handled by the coreutils package.
    rm -fr "$srcdir/$_root/$_shortname/"{locale,po}
    cp -r "$srcdir/$_root/"{$_shortname,$_shortname.plugin} "$pkgdir/usr/lib/gedit/plugins/"
}
# vim:set ts=3 sw=2 et:

