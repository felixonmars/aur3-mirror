# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>

pkgname=ttf-dejavusans-yuanti
pkgver=20110101
pkgrel=1
pkgdesc="Chinese Yuan Ti family based on DejaVu Sans Fonts"
arch=(any)
url="http://forum.ubuntu.org.cn/viewtopic.php?t=110509"
license=(custom:Copyleft)
depends=()
makedepends=(p7zip)
install=${pkgname}.install
source=("http://qinsdisk.googlecode.com/files/dejavusansyuanti.7z")
sha1sums=('2c03a6a38c8b8de93c7abeae512ba4449ab339bb')
md5sums=('c96df2210e55fecccd8a1c1407766f0e')

build() {
  7z e -o"${srcdir}/${pkgname}" "${srcdir}/dejavusansyuanti.7z"
}

package() {
  install -d -m755 "${pkgdir}/usr/share/fonts/TTF"
  install -m644 "${srcdir}/${pkgname}"/DejaVuSansYuanTi*.ttf \
    "${pkgdir}/usr/share/fonts/TTF/"
}
# vim:set ts=2 sw=2 et:
