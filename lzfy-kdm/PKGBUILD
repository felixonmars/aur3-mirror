# Contributor: Michalis Georgiou <mechmg93@gmail.com>

pkgname=lzfy-kdm
pkgver=1.0
pkgrel=1
pkgdesc="Lzfy KDM theme"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/lzfy?content=90432"
license=('GPL')
md5sums=('8efdd38a4e93fbc7a34263826502c2c2')
source=(http://kde-look.org/CONTENT/content-files/90432-lzfy-kde4.tar.gz)
build() {
  cd ${startdir}/src/
  mkdir -p $pkgdir/usr/share/apps/kdm/themes
  mv lzfy-kde4/ $pkgdir/usr/share/apps/kdm/themes
}

