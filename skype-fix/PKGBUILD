# Maintainer: Stas Solovey <whats_up@tut.by>
pkgname=skype-fix
pkgver=1
pkgrel=3
pkgdesc="skype libgobject 2.36 fix"
arch=(i686)
url="http://archlinux.org.ru/"
license=('LGPL 3.0')
depends=('skype')
makedepends=()
source=(https://dl.dropboxusercontent.com/u/8047492/repo/skype-fix.tar.gz)
md5sums=('3d205df12c52b1d20497f59b90269f67')

build() {
 /bin/true
}

package() {
cd "$srcdir"

install -dm755 ${pkgdir}/usr/lib
install -m644 libffi.so.4.0.1 libgobject-2.0.so.0.3400.3 $pkgdir/usr/lib
install -dm755 ${pkgdir}/usr/local/bin
install -m755 skype.sh $pkgdir/usr/local/bin
install -dm755 ${pkgdir}/usr/share/applications
install -m755 Skype-Fixed.desktop $pkgdir/usr/share/applications

ln -s /usr/lib/libffi.so.4.0.1 $pkgdir/usr/lib/libffi.so.4
}
