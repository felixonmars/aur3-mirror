# Maintainer: NormalRa <normalrawr (moo) gmail (squeak) com>

_basename=acx111
pkgname=${_basename}-firmware
pkgver=1.2.1.34
pkgrel=2
pkgdesc="Firmware for TI ACX111 wireless cards"
arch=("any")
url="http://acx100.erley.org/"
license=("unknown")

source=("http://acx100.erley.org/fw/${_basename}_${pkgver}/tiacx111"
        "http://acx100.erley.org/fw/${_basename}_${pkgver}/tiacx111c16"
        "http://acx100.erley.org/fw/${_basename}_${pkgver}/tiacx111c17"
        "http://acx100.erley.org/fw/${_basename}_${pkgver}/tiacx111r16"
        "http://acx100.erley.org/fw/${_basename}_${pkgver}/tiacx111r17")

sha256sums=('e2896ddd2af3ef16bcb27580b6b916a6f785a702b50aae73e4dd02c502af28d7'
            '672ed9d02565ab44da450c52f0ced3be99a3a3901f73454455da8e1f98ada220'
            '73e32dec4c88c90cbef87d0ee6997379d463c937a4ef7fd95afe18aa80940794'
            '8cb7e25b4936ac3859c86f2dcfc35dc2c5b2d764894e1f21ac9c94c81c1dcb74'
            'b2a883bbdce0a3b1803249268617e53bb4a3397c23ffdaf9938152537d292e89')


package() {
    install -d -m 755 "${pkgdir}/usr/lib/firmware"
    install -D -m 644 tiacx111* "${pkgdir}/usr/lib/firmware"
}
