# Maintainer: teraflops < cprieto.ortiz@gmail.com >

pkgname="ncmpcpp-color"
_gitname=ncmpcpp
pkgver=1670.
pkgrel=1
pkgdesc="ncmpcpp with colorized visualizations" 
arch=('i686' 'x86_64')
url="https://github.com/dpayne/ncmpcpp/tree/ncmppWithColor"
license=('GPL2')
depends=('ncurses' 'libmpdclient>=2.8' 'boost-libs')
makedepends=('git' 'boost' 'pkg-config')
optdepends=('curl: fetch lyrics' 'taglib: tag editor' 'fftw: frequency spectrum mode visualization')
conflicts=('ncmpcpp' 'ncmpcpp-xdg-config' 'ncmpcpp-xdg-config-git')
source=("git+https://github.com/dpayne/ncmpcpp.git")
md5sums=('SKIP')

pkgver() {
  cd "${SRCDEST}/${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short 
HEAD)
}

build() {
  cd "${srcdir}/${_gitname}"
  ./autogen.sh BOOST_LIB_SUFFIX=''\
  --prefix=/usr \
  --enable-clock \
  --enable-outputs \
  --enable-visualizer \
  --without-iconv 
  make
} 

package() {
  cd "${srcdir}/${_gitname}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et
