# Maintainer: Brian Knox <taotetek at gmail>
# Submitter: Brian Knox <taotetek at gmail>

pkgname=liblognorm-git
pkgver=20120403
pkgrel=2
pkgdesc="log normalization library"
arch=('i686' 'x86_64')
url="http://www.liblognorm.org/"
license=('LGPL')
depends=('gcc-libs' 'libestr-git' 'libee-git')
makedepends=('git make')
conflicts=('liblognorm')
provides=('liblognorm')
_gitroot="git://git.adiscon.com/git/liblognorm.git"
_gitname="liblognorm"

build() {
  cd "$srcdir"
  msg "Connecting to Git server...."

  if [ -d $_gitname ]; then
    pushd $_gitname && git pull origin && popd
    msg "The local files are updated"
  else
    git clone $_gitroot
  fi

  msg "Git checkout done or server timeout"
  msg "Starting make..."

  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build
}

package() {
  cd "$srcdir/$_gitname-build"
  autoreconf -fvi
  ./configure --prefix=/usr
  make install DESTDIR=${pkgdir}
}
