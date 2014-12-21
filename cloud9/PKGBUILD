# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Leo von Klenze <leo@devel.von-klenze.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=cloud9
pkgver=2.0.93
pkgrel=1
pkgdesc="Cloud9 IDE - Your code anywhere, anytime. Open Source Javascript Cloud9 IDE"
arch=('i686' 'x86_64')
url="https://c9.io"
license=('GPLv3')
depends=('nodejs8')
source=(${pkgname}-v${pkgver}.tar.gz::https://github.com/ajaxorg/${pkgname}/archive/v${pkgver}.tar.gz
        'cloud9.service'
        'cloud9.tmpfile.d')
sha512sums=('6466680f786dfb0f779b9b19ea8daac47938109c41d1337b33ecae8101285b3e11c0918de5cb3bb1d501d7cdf7d7d40d1ed95143310407cd26b21dd7a19d1704'
	    'fdfd1524ec5c0c9c8003616c8d2541ef6bdcf62d19286d11cb8c7e3607254f037692891ab5762193131f4a9d980b8b69454226b724165943f6e93ec5f502ee38'
	    '8172f4fc2d1f394046cb9215b50917cc5f42559d030b408c5c1919e3b62e53776d56ec00674260a332533545aa08160993e8c61663ce2786c9d97a2dafd560e4')
install=cloud9.install

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  npm install
  npm install treehugger ace v8debug asyncjs
  install -d "${pkgdir}/usr/share/webapps/cloud9"
  cp -ra . "${pkgdir}/usr/share/webapps/cloud9/"

  install -Dm644 "${srcdir}"/cloud9.service "${pkgdir}"/usr/lib/systemd/system/cloud9.service
  install -Dm644 "${srcdir}"/cloud9.tmpfile.d "${pkgdir}"/usr/lib/tmpfiles.d/cloud9.conf
  install -D LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
} 
