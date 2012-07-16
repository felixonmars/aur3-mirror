# Maintainer: Spike29 <leguen.yannick@gmail.com>

pkgname='ambiance-radiance-xfce-lxde'
pkgver='12.04'
pkgrel=1
pkgdesc="Ambiance & Radiance themes for Xfce and LXDE"
arch=('any')
license=('GPL2')
url="http://ravefinity.blogspot.com/"
depends=('gtk-engine-murrine' 'gtk-engine-unico')
source=('http://dl.dropbox.com/u/85873590/Ambiance%26Radiance-XfceLXDE-12-04.tar.gz')
md5sums=('a15ffaf22dbdbb69cc12a5b80c94be80')

build() {
  	mkdir -p "$pkgdir/usr/share/themes/"
	cp -r "$srcdir/Ambiance-Xfce-LXDE" "$pkgdir/usr/share/themes"
	cp -r "$srcdir/Radiance-Xfce-LXDE" "$pkgdir/usr/share/themes"
}
