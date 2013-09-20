# Maintainer: NormalRa <normalrawr (moo) gmail (squeak) com>

_basename=acx
pkgbase=acx-firmware
pkgname=acx-firmware
true && pkgname=("${_basename}100-firmware"
                 "${_basename}100-usb-firmware"
                 "${_basename}111-firmware"
                 "${_basename}111-usb-firmware")

pkgver=20130920
pkgrel=1
pkgdesc="Firmware for TI ACX1xx wireless cards (split PKGBUILD)"
arch=("any")
url="http://acx100.erley.org/"
license=("unknown")

source=("http://acx100.erley.org/fw/${_basename}100_1.9.8.b/tiacx100"
        "http://acx100.erley.org/fw/${_basename}100_1.9.8.b/tiacx100r0D"
        "http://acx100.erley.org/fw/${_basename}100_1.9.8.b/tiacx100r11"
        "http://acx100.erley.org/fw/${_basename}100_1.9.8.b/tiacx100r15"

        "http://acx100.erley.org/fw/${_basename}111_1.2.1.34/tiacx111"
        "http://acx100.erley.org/fw/${_basename}111_1.2.1.34/tiacx111c16"
        "http://acx100.erley.org/fw/${_basename}111_1.2.1.34/tiacx111c17"
        "http://acx100.erley.org/fw/${_basename}111_1.2.1.34/tiacx111r16"
        "http://acx100.erley.org/fw/${_basename}111_1.2.1.34/tiacx111r17"

        "http://acx100.erley.org/fw/${_basename}100_1.0.9-USB/tiacx100usbc0D"
        "http://acx100.erley.org/fw/${_basename}111_2.4.0.70-USB/tiacx111usbc1B")

md5sums=('24a54fd30f7658fcbffc825b0dd7aa5b'
         '1c7413e7b0be4ef7d1e424a132e17fab'
         'a150750ad33c512edc4afee5270b37cb'
         'c99d01d4fcf0d6cc00441aff60690be4'
         '7c2119a67417fe9090907c0b26483667'
         'fcd07de4b25e1d2aaf3b78b27c5b7ee9'
         '8a16b8e085d1ada13abc65305b59a6e5'
         '7dc869de8844b4d61740f0d9f06534c0'
         '67333c6a7cc107ebba8c80f259bda766'
         '7a5591e8c6af927c85f4798c5cf15389'
         'c4edecd912b2417779d0b65e3a7dc86d')


package_acx100-firmware() {
    true && pkgdesc="Firmware for TI ACX100 wireless cards"
    true && pkgver=1.9.8.b
    true && pkgrel=3

    cd "${srcdir}"

    install -d -m 755 "${pkgdir}/usr/lib/firmware"
    install -D -m 644 tiacx100 "${pkgdir}/usr/lib/firmware"
    install -D -m 644 tiacx100r0D "${pkgdir}/usr/lib/firmware"
    install -D -m 644 tiacx100r11 "${pkgdir}/usr/lib/firmware"
    install -D -m 644 tiacx100r15 "${pkgdir}/usr/lib/firmware"
}

package_acx100-usb-firmware() {
    true && pkgdesc="Firmware for TI ACX100 USB wireless cards"
    true && pkgver=1.0.9
    true && pkgrel=1

    cd "${srcdir}"

    install -d -m 755 "${pkgdir}/usr/lib/firmware"
    install -D -m 644 tiacx100usbc0D "${pkgdir}/usr/lib/firmware"
}


package_acx111-firmware() {
    true && pkgdesc="Firmware for TI ACX111 wireless cards"
    true && pkgver=1.2.1.34
    true && pkgrel=3

    cd "${srcdir}"
    install -d -m 755 "${pkgdir}/usr/lib/firmware"
    install -D -m 644 tiacx111 "${pkgdir}/usr/lib/firmware"
    install -D -m 644 tiacx111c16 "${pkgdir}/usr/lib/firmware"
    install -D -m 644 tiacx111c17 "${pkgdir}/usr/lib/firmware"
    install -D -m 644 tiacx111r16 "${pkgdir}/usr/lib/firmware"
    install -D -m 644 tiacx111r17 "${pkgdir}/usr/lib/firmware"
}

package_acx111-usb-firmware() {
    true && pkgdesc="Firmware for TI ACX111 USB wireless cards"
    true && pkgver=2.4.0.70
    true && pkgrel=1

    cd "${srcdir}"

    install -d -m 755 "${pkgdir}/usr/lib/firmware"
    install -D -m 644 tiacx111usbc1B "${pkgdir}/usr/lib/firmware"
}
