
# Maintainer:  <kontakt.zuf@gmail.com>
pkgname=video3x
pkgver=0.2
pkgrel=1
pkgdesc="The program contains only video filtering functions, but no video compressors or decompressors. So, it must be used in conjunction with some other video processing application, like ffmpeg."
arch=(i686 x86_64)
url="http://cdslow.webhost.ru/en/video3x/index.html"
license=(LGPL GPL)
depends=()
makedepends=(cmake)
optdepends=(ffmpeg)
install=video3x.install
source=(http://cdslow.webhost.ru/files/video3x/$pkgname-$pkgver.tar.gz)
md5sums=('63aeb4bbeb9a75e0f3cb02f0c5c61706')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake .
  #./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/bin/"
  cp vi3x "${pkgdir}/usr/bin/"
  cp scripts/vi3x_encode "${pkgdir}/usr/bin/"
  cp scripts/vi3x_play "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/video3x"
  cp README.txt "${pkgdir}/usr/share/video3x/"
  cp HELP.txt "${pkgdir}/usr/share/video3x/"
}

# vim:set ts=2 sw=2 et:
