#Contributor: Julien MISCHKOWITZ <wain@archlinux.fr>
#Contributor: Arnaud Fortier <warnaud@gmail.com>
pkgname=planfacile
pkgver=2.0.070523
pkgrel=2
pkgdesc="A compiler that generates a document from a mindmap using ideas linked by dependencies"
arch=('i686' 'x86_64')
url="http://www.planfacile.org/?lang=en"
license=('GPL')
depends=('flex' 'bison')
makedepends=('awk')
options=(docs)
source=(http://www.planfacile.org/download/PlanFacile-$pkgver.tar.gz)
md5sums=('977d4dbc565e2ddb01f689ff2b43866d')

build() {
  cd $startdir/src/PlanFacile-2.0/
  ./configure --prefix=/usr --mandir=/usr/man
  make || return 1
  make DESTDIR=$startdir/pkg install
}
