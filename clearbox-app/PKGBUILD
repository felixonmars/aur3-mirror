# Contributor: Hugo Olabera <hoo@marandhu.jazztel.es>
# Maintainer: Shaun Lastra <badicalia@gmail.com>
pkgname=clearbox-app
pkgver=1.0
pkgrel=0
pkgdesc="A small GTK application allows configuration of different theme aspects, provides a preview of the theme, and can save it in the user themes folder."
url="http://www.marandhu.jazztel.es/clearbox/"
depends=('metacity' 'x-server')
source=(http://www.marandhu.jazztel.es/clearbox/download/clearbox-app.tar.gz)
md5sums=('847a29daee61fbb0b507e6621c69bed5')

build() {
  cd $startdir/src/clearbox-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
