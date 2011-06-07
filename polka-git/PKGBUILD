# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: mutlu_inek <mutlu_inek@yahoo.de>

pkgname=polka-git
pkgver=20110607
pkgrel=1
pkgdesc="A humane address book for the cloud using new ways of visualizing address book data"
arch=('i686' 'x86_64')
url="http://quickgit.kde.org/?p=scratch/cschumac/polka.git"
license=('GPL')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4' 'git')
install=polka.install
provides=('polka')
conflicts=('polka')

_gitroot="git://anongit.kde.org/scratch/cschumac/polka.git"
_gitname="polka"

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

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  cmake "$srcdir/$_gitname" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 
