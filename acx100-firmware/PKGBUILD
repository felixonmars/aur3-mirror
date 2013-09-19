# Maintainer: NormalRa <normalrawr (moo) gmail (squeak) com>

_basename=acx100
pkgname=${_basename}-firmware
pkgver=1.9.8.b
pkgrel=1
pkgdesc="Firmware for TI ACX100 wireless cards"
arch=("any")
url="http://acx100.erley.org/"
license=("unknown")

source=("http://acx100.erley.org/fw/${_basename}_${pkgver}/tiacx100"
        "http://acx100.erley.org/fw/${_basename}_${pkgver}/tiacx100r0D"
        "http://acx100.erley.org/fw/${_basename}_${pkgver}/tiacx100r11"
        "http://acx100.erley.org/fw/${_basename}_${pkgver}/tiacx100r15")

sha256sums=('4f05913c940c2455b267545b12d93ad81fa5eebb0cbee22a2c7588c50525b4f0'
            '6a4a7fbb24a328a88261bc2a507b2a0bf63c91e831e3f1a8caa4f6599b2215e6'
            'e005a93a0b463e01edba2b79038b54c29a7932efee61c851a2ac644b8a4e5dd4'
            'c6f40bead5ef45720e2d72bbe4d998367c2c7857eb7716234aedeb2ad98bcdde')

package() {
    cd "${srcdir}"

    install -d -m 755 "${pkgdir}/usr/lib/firmware"
    install -D -m 644 tiacx* "${pkgdir}/usr/lib/firmware"
}
