# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=kdeicons-crystalproject
pkgver=20070620
pkgrel=2
pkgdesc="The Crystal Project icon theme by Everaldo Coelho"
arch=('i686' 'x86_64')
url="http://www.everaldo.com/crystal/"
license=('LGPL')
source=(http://www.everaldo.com/crystal/crystal_project.tar.gz)
md5sums=('338dfdb8918e0bb1085bd8109efd71df')

build() {
  cd ${startdir}/src/
  mkdir -p ${startdir}/pkg/opt/kde/share/icons
  mv crystal_project ${startdir}/pkg/opt/kde/share/icons/crystalproject

  find ${startdir}/pkg -type f -exec chmod 644 {} +
  find ${startdir}/pkg -type d -exec chmod 755 {} +
}
