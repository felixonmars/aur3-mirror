# Maintainer: Matt Harrison < matt at mistbyte dot com >
# Contributor: Muhammad Qadri <Muhammad dot A dot Qadri at gmail dot com>
# This PKGBUILD is maintained at https://github.com/matt-h/aur-pkgbuilds/tree/master/julius

pkgname=julius
pkgver=4.2.3
pkgrel=1
pkgdesc="A high-performance, two-pass large vocabulary continuous speech recognition (LVCSR) decoder software for speech-related researchers and developers"
arch=("i686" "x86_64")
url="http://julius.sourceforge.jp/"
license=("custom")
depends=("libpulse" "perl")
source=("http://jaist.dl.sourceforge.jp/${pkgname}/59049/${pkgname}-${pkgver}.tar.gz")
sha256sums=("917e7fa94db0c9a662de8803d8778262091530637fabfa9e7431396a1a66f5ed")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # replace /lib/cpp with /usr/bin/cpp since Arch Linux doesn't have /lib/cpp anymore
  sed -i "s%/lib/cpp%/usr/bin/cpp%g" "julius/configure"
  sed -i "s%/lib/cpp%/usr/bin/cpp%g" "jcontrol/configure"
  sed -i "s%/lib/cpp%/usr/bin/cpp%g" "libjulius/configure"
  sed -i "s%/lib/cpp%/usr/bin/cpp%g" "gramtools/configure"
  sed -i "s%/lib/cpp%/usr/bin/cpp%g" "libsent/configure"
  sed -i "s%/lib/cpp%/usr/bin/cpp%g" "configure"

  # Add -02 to CPPFLAGS to prevent issue with -D_FORTIFY_SOURCE=2
  CPPFLAGS="$CPPFLAGS -O2"
  ./configure \
    --prefix='/usr' \
    --mandir='${prefix}/share/man' \
    --enable-words-int \
    --enable-msd \
    --enable-gmm-vad \
    --enable-decoder-vad \
    --enable-power-reject \
    --enable-wpair

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make prefix="${pkgdir}/usr" install

  install -D LICENSE.txt \
    "${pkgdir}/usr/share/licenses/julius/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
