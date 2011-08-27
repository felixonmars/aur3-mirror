# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kfacebook-git
pkgver=20110312
pkgrel=1
pkgdesc="Facebook support in KDEPIM"
arch=('i686' 'x86_64')
url="http://kde.org"
license=('GPL')
depends=('kdepimlibs' 'qjson')
makedepends=('git' 'cmake' 'automoc4' 'boost')
provides=('kfacebook' 'akonadi-facebook')
conflicts=('kfacebook' 'akonadi-facebook')
install=kfacebook.install

_gitroot="git://anongit.kde.org/akonadi-facebook.git"
_gitname="akonadi-facebook"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/build"
  mkdir "$srcdir/build"
  cd "$srcdir/build"

  cmake ../${_gitname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
} 
