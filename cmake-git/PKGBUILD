# Maintainer: ksj <podhorsky.ksj@gmail.com>
# Contributor: Andre Bartke <dev@bartke.cc>

_gitname=cmake
pkgname=cmake-git
pkgver=20140404
pkgrel=1
pkgdesc="A cross-platform open-source make system"
arch=('i686' 'x86_64')
url="http://www.cmake.org/"
license=('custom')
depends=('curl' 'libarchive' 'shared-mime-info')
makedepends=('qt5-base' 'git')
optdepends=('qt5-base: cmake-gui')
provides=(cmake)
conflicts=(cmake)
source=("git://cmake.org/cmake.git")
md5sums=(SKIP)

pkgver() {
    cd "$srcdir/$_gitname"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
  cd $srcdir/$_gitname

  ./bootstrap --prefix=/usr \
    --mandir=/share/man \
    --docdir=/share/doc/cmake \
    --system-libs \
    --qt-gui \
    --parallel=$(/usr/bin/getconf _NPROCESSORS_ONLN)

  make
}

package() {
  cd $srcdir/$_gitname
  make DESTDIR=$pkgdir install

  vimpath="${pkgdir}/usr/share/vim/vimfiles"
  install -Dm644 Auxiliary/cmake-indent.vim "${vimpath}"/indent/cmake-indent.vim
  install -Dm644 Auxiliary/cmake-syntax.vim "${vimpath}"/syntax/cmake-syntax.vim

  install -Dm644 Copyright.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
