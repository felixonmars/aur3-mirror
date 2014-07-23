# Maintainer: Dmitry Lavnikevich <haff@midgard.by>

pkgname=embox
pkgver=1.1
pkgrel=1
pkgdesc="Embedded developer's toolbox"
url="https://github.com/githaff/embox"
license=('BSD')
arch=('i686' 'x86_64')
depends=('extopts')
makedepends=('git' 'cmake')

_gitroot="git://github.com/githaff/embox.git"
_gitname="embox"

dirname=${_gitname}-${pkgver}

build() {
  msg "Connecting to GIT server..."

  if [ -d $_gitname ] ; then
    cd ${dirname} && git pull origin v${pkgver}
    git checkout v${pkgver}
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${dirname}
    cd ${dirname}
    git checkout -q v$pkgver
  fi

  msg "Configuring..."
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  msg "Compiling..."
  make
}

package(){
  cd ${_gitname}-${pkgver}
  make DESTDIR="${pkgdir}/" install
}
