# Maintainer: fauno <fauno@kiwwwi.com.ar>

pkgname=django-agpl
pkgver=0.1
pkgrel=1
pkgdesc="Django application to assist in releasing Django projects under the GNU Affero General Public License."
arch=(i686 x86_64)
url="http://www.chris-lamb.co.uk/projects/django-agpl/"
license=('AGPL3')
depends=('django')
source=("http://chris-lamb.co.uk/releases/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")

build() {
  cd "${startdir}/src/${pkgname}"
  python2 setup.py build || return 1
  python2 setup.py install --prefix=/usr --root="${pkgdir}" || return 1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" || return 1
}
md5sums=('0e51a1241047f081880a6774530b84ba')
