# Maintainer: itiut <t.yuichi111@gmail.com>
pkgname=ttf-ricty-diminished
pkgver=3.2.4
pkgrel=1
pkgdesc='Japanese TrueType font for developers by mixing Inconsolata and Circle M+ 1m.'
arch=('any')
url='https://github.com/yascentur/RictyDiminished'
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(RictyDiminished-${pkgver}.tar.gz::https://github.com/yascentur/RictyDiminished/archive/${pkgver}.tar.gz)
md5sums=('1b785d7d5c7ae5f6fae9bbece1a90a2c')

package() {
    cd "${srcdir}/RictyDiminished-${pkgver}"

    install -dm755 "${pkgdir}/usr/share/fonts/TTF"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

    install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
    install -m644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/"
}
