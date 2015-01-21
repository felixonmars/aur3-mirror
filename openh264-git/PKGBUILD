# Maintainer: Buck 'apitofme' Rodgers <gbuck2550 at gmail dot moc>
# Contributor: Bartłomiej Piotrowski <bpiotrowski at archlinux dot org>

_pkgname=openh264
pkgname="${_pkgname}-git"
pkgver=v1.3.r145.g8bef6bc
pkgrel=1
pkgdesc="A free, open-source codec library for H.264 encoding and decoding"
arch=('i686' 'x86_64')
url="http://www.openh264.org/"
license=('BSD')
depends=('gcc-libs-multilib')
makedepends=('git' 'yasm')
# Note: official src dep is 'nasm', however 'yasm' provides this also!
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("$pkgname::git+https://github.com/cisco/openh264.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$pkgname"

  msg 'Starting make...'
  # Removed 32/64 bit conditional check as it should auto-detect!
  msg "Building for $CARCH architecture..."
  make

# TODO -- figure out how to build the docs! (doxygen?)

  msg 'Build finished!'
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 h264dec "$pkgdir"/usr/bin/h264dec
  install -Dm755 h264enc "$pkgdir"/usr/bin/h264enc
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  make DESTDIR="${pkgdir}" install

  mv -v "${pkgdir}/usr/local/lib" "${pkgdir}/usr/"
  mv -v "${pkgdir}/usr/local/include" "${pkgdir}/usr/"
  rm -rv "${pkgdir}/usr/local"
}
