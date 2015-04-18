# Maintainer: Josh Lavin <arch jlavin com>
pkgname=sauceconnect32
pkgver=4.3.8
pkgrel=1
pkgdesc='32-bit utility for Sauce Labs testing'
arch=('i686')
url='https://docs.saucelabs.com/reference/sauce-connect/'
license=('unknown')
source=("https://saucelabs.com/downloads/sc-${pkgver}-linux32.tar.gz")
sha1sums=('b9724f63b727f3c49e7367970b6ea5e4a7bb697d')

package() {
  cd "${srcdir}/sc-${pkgver}-linux32/"
  install -D -m755 "bin/sc" "${pkgdir}/usr/bin/sc"

  # License
  install -D -m644 "license.html" "${pkgdir}/usr/share/licenses/sauceconnect32/license.html"
}
