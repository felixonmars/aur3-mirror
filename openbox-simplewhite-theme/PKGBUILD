# Maintainer: Alireza Savand <alireza.savand@gmail.com>
# Contributor: twa022 <twa022@gmail.com>

pkgname=openbox-simplewhite-theme
_tname="SimpleWhite"
pkgver=2008.02.14
pkgrel=1
pkgdesc="Simple White OpenBox Theme"
arch=('any')
url="http://box-look.org/content/show.php/SimpleWhite?content=75316"
license=('GPL')
depends=('openbox>=3.0')
source=(http://box-look.org/CONTENT/content-files/75316-$_tname.tar.gz)
md5sums=('327ad7a0b48ca11357c801558025c5e4')

build() {
  mkdir -p $pkgdir/usr/share/themes/
  cp -r $srcdir/$_tname $pkgdir/usr/share/themes/
}
