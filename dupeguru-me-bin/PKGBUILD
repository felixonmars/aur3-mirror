# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com
# Contributor: Dan Serban, SiD

pkgname=dupeguru-me-bin
pkgver=6.5.0
pkgrel=2
pkgdesc="Find duplicate songs in your music collection"
arch=(any)
url=http://www.hardcoded.net/dupeguru_me/
license=('BSD')
depends=(python pyqt sip)

source=(https://launchpadlibrarian.net/112416309/dupeguru-me_${pkgver}_all.deb)
md5sums=('1b143883a44c99965b0acea9c5c23a48')

build() {
  return 0
}	

package() {
  cd "${srcdir}"
  bsdtar -xf dupeguru-me_${pkgver}_all.deb data.tar.gz
  bsdtar -xf data.tar.gz

# nonag
  sed -i 's/self.model.initial_registration_setup()/# self.model.initial_registration_setup()/g' \
	usr/share/dupeguru_me/qt/base/app.py
  
  mkdir -p "${pkgdir}"/usr/bin
  mv usr/bin/dupeguru_me "${pkgdir}"/usr/bin
  mv usr/share "${pkgdir}"/usr/

  install -Dm644 "${pkgdir}"/usr/share/dupeguru_me/hscommon/LICENSE \
    "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
