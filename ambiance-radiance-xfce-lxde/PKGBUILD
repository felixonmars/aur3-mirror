# Maintainer: Spike29 <leguen.yannick@gmail.com>

pkgname='ambiance-radiance-xfce-lxde'
pkgver='11.10.2'
pkgrel=1
pkgdesc="Ambiance & Radiance themes for Xfce and LXDE"
arch=('any')
license=('GPL2')
url="http://ravefinity.blogspot.com/"
groups=
depends=('gtk-engine-murrine' 'gtk-engine-unico')
makedepends=
options=
install=
source=('http://xfce-look.org/CONTENT/content-files/146674-Ambiance&Radiance-XfceLXDE-11-10-2.tar.gz')
md5sums=('7850c32b7a6c7d5e297a3f70376f82c4')

build() {
  	mkdir -p "$pkgdir"/usr/share/themes/
	cd "$srcdir"/
	cp -r "Ambiance-Xfce-LXDE" "$pkgdir/usr/share/themes"
	cp -r "Radiance-Xfce-LXDE" "$pkgdir/usr/share/themes"
}
