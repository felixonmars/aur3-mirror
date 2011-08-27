# Contributor: Federico Chiacchiaretta <federico.chia at gmail.com>

pkgname=kio_afc-git
pkgver=20100523
pkgrel=1
pkgdesc="a KIOSlave implementation wrapping the AFC protocol"
arch=('i686' 'x86_64')
url="http://github.com/JonathanBeck/kio_afc"
license=('GPL')
depends=('kdelibs' 'libimobiledevice')
makedepends=('git' 'cmake')

_gitroot="git://github.com/JonathanBeck/kio_afc.git"
_gitname="kio_afc"

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

  rm -rf $srcdir/build
  mkdir $srcdir/build
  cd $srcdir/build

  #
  # BUILD HERE
  #

  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ../$_gitname
  make || return 1
  make DESTDIR="$pkgdir" install
}
