# Maintainer: levi (levi0x0)
pkgname=fluxbox-elegant-arch-theme
pkgver=0.1
pkgrel=3
pkgdesc="An Arch Linux theme for fluxbox"
arch=('any')
url="http://box-look.org/content/show.php/Elegant+Arch?content=81764"
license=('GPL')
depends=('fluxbox')
optdepends=('gtk-elegant-arch-theme: GTK elegant arch theme')
source=('http://box-look.org/CONTENT/content-files/81764-Elegant%20Arch.tar.bz2')
md5sums=('a91bc70710714d1eec3fe1f6d88b1276')

package() {
	cd "$srcdir"
	install -D -m775 "$srcdir/Elegant Arch/theme.cfg"  "$pkgdir/usr/share/fluxbox/styles/$pkgname/theme.cfg"
	mv "$srcdir/Elegant Arch/pixmaps"  "$pkgdir/usr/share/fluxbox/styles/$pkgname/pixmaps"
}
