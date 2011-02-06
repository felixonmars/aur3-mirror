pkgname=openpref-git
pkgver=20100807
pkgrel=2
pkgdesc="Preferans -- quite old European card game mostly popular in Russia"
arch=('i686' 'x86_64')
url="http://openpref.sourceforge.net/"
license=('GPL')
depends=('qt' )
makedepends=('cmake>=2.4.8' 'git')
provides=('openpref')
conflicts=('openpref')

_gitroot="http://git.gitorious.org/~annulen/openprefqt4/annulens-clone.git"
_gitname="annulens-clone"

build() {
  cd $srcdir

  if [ -d $_gitname ]; then
	  echo "Pulling changes"
    cd $_gitname && git pull origin || return 1
  else
    git clone $_gitroot || return 1
  fi

  cd $srcdir
  mkdir -p build
  cd build
  cmake -D CMAKE_INSTALL_PREFIX="/usr" -D BIN_INSTALL_DIR=bin ../$_gitname
  make || return 1
  make DESTDIR="${pkgdir}" install

}
