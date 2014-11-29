# Maintainer: Guillaume ALAUX <guillaume at alaux dot net>
# Contributor: Adrian Berriel <berriel@gmail.com>
# Contributor: Tomas Urgosik <tomas.urgosik@gmail.com>
# Contributor: Lee.MaRS <leemars@gmail.com>
pkgname=gwt
pkgver=2.7.0
pkgrel=1
pkgdesc='Google Web Toolkit - core libraries and compiler to write web applications'
arch=('any')
url='https://developers.google.com/web-toolkit/'
license=('APACHE')
depends=('java-environment')
source=("http://storage.googleapis.com/${pkgname}-releases/${pkgname}-${pkgver}.zip")
sha256sums=('aa65061b73836190410720bea422eb8e787680d7bc0c2b244ae6c9a0d24747b3')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}"/{opt,usr/bin}
  cp -R ${pkgname}-${pkgver} "${pkgdir}"/opt/${pkgname}
  for f in webAppCreator i18nCreator; do
    sed -i 's/`dirname $0`/\/opt\/gwt/' "${pkgdir}"/opt/${pkgname}/${f}
    ln -s /opt/gwt/${f} "${pkgdir}"/usr/bin/${f}
  done
  find "${pkgdir}" -name "*.dll" -o -name "*.cmd" -delete
}
