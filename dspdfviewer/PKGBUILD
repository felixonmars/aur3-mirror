# Maintainer: Fredrik Strandin <fredrik@strandin.name>

pkgname="dspdfviewer"
pkgver=1.11
pkgrel=1
pkgdesc="Viewer for latex-beamer presentations that are built with the «show notes on second screen»-option"
arch=('i686' 'x86_64')
url="https://github.com/dannyedel/dspdfviewer"
license=('GPL')
depends=('boost-libs' 'poppler-qt4')
makedepends=('cmake' 'boost')
conflicts=('dspdfviewer-git')
source=("https://github.com/dannyedel/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('39c97a91fa1006ec43c2d75a7be3190d')
sha512sum=('6ca93e468af03f04fa6f82a2e63c28ecba757275a0950e81fb946ad46f3e7f8505f2211b0b6ff975dc6e801d481efacc111fef908aa96aa2bbd0b36b8a8fd811')

build() {
  cd "${pkgname}-${pkgver}"
  cmake \
    -DCMAKE_INSTALL_PREFIX="/usr/" \
    -DSYSCONFDIR="/etc" \
    -DCMAKE_BUILD_TYPE=Release \
    -DDSPDFVIEWER_VERSION="${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
