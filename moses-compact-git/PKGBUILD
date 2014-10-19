# Maintainer: Filip Graliński <filipg@amu.edu.pl>
pkgname=moses-compact-git
pkgver=20141018
pkgrel=4
pkgdesc="An MT system (with compact phrase tables)"
arch=('i686' 'x86_64')
url="http://www.statmt.org/moses/"
license=('LGPL')
makedepends=(gcc make)
provides=(moses-git)
depends=(giza-pp irstlm boost-libs bash perl python cmph-staticlibs)

_gitroot="https://github.com/moses-smt/mosesdecoder"
_gitname="mosesdecoder"

build() {
  cd $srcdir

  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  cd "$srcdir/$_gitname"

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  mkdir -p "${srcdir}/opt/moses"

  ./bjam -q --with-xmlrpc-c --with-irstlm=/opt/irstlm --with-giza=/usr/bin debug-symbols=off --prefix="${srcdir}/opt/moses" --install-scripts --with-cmph=/usr
}

package() {
  rm -rf "${pkgdir}/opt/moses"
  mkdir -p "${pkgdir}/opt/moses"
  cp --preserve=all -R "${srcdir}/opt/moses" "${pkgdir}/opt"
}
