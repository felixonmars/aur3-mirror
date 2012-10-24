# Maintainer: Matt Harrison < matt at mistbyte dot com >
# Contributor: Muhammad Qadri <Muhammad dot A dot Qadri at gmail dot com>
# This PKGBUILD is managed at https://github.com/matt-h/julius-pkgbuild

pkgname=julius
pkgver=4.2.2
pkgrel=1
pkgdesc="A high-performance, two-pass large vocabulary continuous speech recognition (LVCSR) decoder software for speech-related researchers and developers"
arch=("i686" "x86_64")
url="http://julius.sourceforge.jp/"
license=("custom")
depends=("libpulse" "perl")
source=("http://osdn.dl.sourceforge.jp/${pkgname}/56549/${pkgname}-${pkgver}.tar.gz")
sha256sums=("f53caf18be4fb8266b988071855565dccb78c09f00f1d36a8e258b7be6b3cef5")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

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
  #make DESTDIR=${pkgdir} install

  install -D LICENSE.txt \
    "${pkgdir}/usr/share/licenses/julius/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
