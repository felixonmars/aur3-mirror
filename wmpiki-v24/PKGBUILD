# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Henrik Tunedal <putte_xvi at tunedal dot nu>
pkgname=wmpiki-v24
_pkgname=wmpiki
pkgver=0.2.4
pkgrel=5
pkgdesc="Multiping host checker dockapp for Window Maker"
arch=('i686' 'x86_64')
url="http://dockapps.windowmaker.org/file.php/id/120"
license=('GPL')
depends=('libxpm')
provides=($_pkgname)
conflicts=($_pkgname)
source=("http://dockapps.windowmaker.org/download.php/id/587/$_pkgname-$pkgver.tar.gz"
	"$_pkgname.patch")
md5sums=('119c87de9c0f2aa2e496a9797b1e9055'
         'c5baaca900e6f9ccc361611d510032c2')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -Np2 -b -z .orig -i "$srcdir/$_pkgname.patch"
  make
}
package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -d "$pkgdir/usr/share/doc/$_pkgname"
  install -m644 AUTHORS ChangeLog README COPYING "$pkgdir/usr/share/doc/$_pkgname"
}
