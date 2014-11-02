# Maintainer:

pkgname=xcursor-alkano
pkgver=1.01
pkgrel=1
pkgdesc="Multi-sized, dark cursor theme"
arch=('any')
url="http://xfce-look.org/content/show.php/%2BAlkano+all+in+one?content=159038"
license=('CCPL')
source=('http://xfce-look.org/CONTENT/content-files/159038-+Alkano-all-in-one.tgz')
md5sums=('46e84154e6f8d2d730aca8169b4f0c7e')

build() {
	true
}

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/icons"
	cp -r "+Alkano-all-in-one" "$pkgdir/usr/share/icons"
}
