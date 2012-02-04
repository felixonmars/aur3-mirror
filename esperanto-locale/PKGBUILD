# Maintainer: Guillaume Brunerie <guillaume.brunerie [at] gmail [dot] com>

pkgname=esperanto-locale
pkgver=0.1
pkgrel=1
pkgdesc="Esperanto locale for glibc"
arch=('any')
url="http://lists.debian.org/debian-esperanto/"
license=('unknown')
install=esperanto-locale.install
source=(eo)
md5sums=('1b5ea48065f1630a23041817f06a2c5f')

build() {
    install -D -m644 eo "${pkgdir}/usr/share/i18n/locales/eo"
}