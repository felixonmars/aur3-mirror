# Maintainer: Spike29 <leguen.yannick@gmail.com>
# Contributor: Dan Serban

pkgname='ambiance-radiance-colors-xfce-lxde'
pkgver='12.04'
pkgrel=1
pkgdesc="Ambiance & Radiance color themes for Xfce and LXDE"
arch=('any')
license=('GPL2')
url="http://ravefinity.blogspot.com/"
groups=
depends=('gtk-engine-murrine' 'gtk-engine-unico')
makedepends=
options=
install=
source=('http://dl.dropbox.com/u/4199602/Ambiance%26Radiance-Colors-XfceLXDE-12-04.tar.gz')
md5sums=('3670700578e07938e7ceaaa04ad5dab9')

build() {
  	mkdir -p "$pkgdir"/usr/share/themes/
	cd "$srcdir"/
	cp -r Ambiance* "$pkgdir/usr/share/themes"
	cp -r Radiance* "$pkgdir/usr/share/themes"
	cp -r Classic* "$pkgdir/usr/share/themes"
}