# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Alexandre Bique <bique.alexandre@gmail.com>
pkgname=emacs-rebox2
pkgver=0.7
pkgrel=1
pkgdesc="emacs package for seemlessly creating, editing, removing boxes"
url="https://github.com/lewang/rebox2"
arch=('any')
license=('GPL')
depends=(emacs)
makedepends=(emacs)
conflicts=()
replaces=()
backup=()
install=
source=(https://github.com/lewang/rebox2/tarball/version-${pkgver}
  makefile.patch)
md5sums=('a75e0a4d6c25740f0e9f78802f709abc'
         'bba780d9a69bf4f5813d405be75c9838')
build() {
  cd $startdir/src/lewang-rebox2-97870d3
  patch -p1 <$startdir/makefile.patch
  make || return 1
  make prefix=/usr DESTDIR=$startdir/pkg/ install
}