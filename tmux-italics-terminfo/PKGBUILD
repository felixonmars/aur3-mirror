# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

pkgname=tmux-italics-terminfo
pkgver=5.9
pkgrel=1
pkgdesc="Terminfo files for tmux that support italics (screen-it and screen-256color-it)"
arch=('any')
url="https://github.com/prurigro/${pkgname}"
license=('MIT')
depends=('tmux')

source=('screen-it'
        'screen-256color-it'
        'LICENSE')
sha512sums=('ede6015b8b5445e40603321b07fa2ec07a59be914e994029f1921a669bfc7174816721ac4ec8da9abf131775d81dc1ad5a09f4f63fd49d7e30f2a12d946891c7'
            '33ad1a2c4954b5095ec94b02749edcac818324608bb603c898d21b8d3cf11112e82eb438e38c7ef8c405dc6a55382b58af068072859c2653c6a0cd75ce009d61'
            '710b8e810862868eb3fbb2e5a63098f4303f0080b4b760931ee6ae406866aba5fe9df2387c5d0506e2d3a74864e7ccc7a81ddd7e0f671d7de8bc1ceecaa04b35')

package() {
    install -Dm644 screen-it "${pkgdir}/usr/share/terminfo/s/screen-it"
    install -Dm644 screen-256color-it "${pkgdir}/usr/share/terminfo/s/screen-256color-it"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
