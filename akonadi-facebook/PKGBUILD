# Maintainer: Thaodan <theodorstormgrade@gmail.com>

pkgname=akonadi-facebook
pkgver=20120712
pkgrel=1
pkgdesc="An Akonadi resource for Facebook Resource, build from ubuntu sources until next KDE SC ist released"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/pim/akonadi-facebook"
license=('GPL')
depends=('kdepimlibs')
conflicts=('akonadi-facebook-git')
source=( 'http://archive.ubuntu.com/ubuntu/pool/universe/a/akonadi-facebook/akonadi-facebook_0.0git20120712.orig.tar.gz')
md5sums=( 'a5d373cf0c1f38fa952f47a360b38ffd' )
makedepends=('git' 'cmake' 'qjson' 'boost')
#_gitroot="git://anongit.kde.org/akonadi-facebook"
#_gitname="akonadi-facebook"

build() {
  cd "$srcdir/$pkgname"


  rm -rf "$srcdir/build"
  mkdir "$srcdir/build"
  cd "$srcdir/build"

  cmake ../${pkgname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` 
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
} 

