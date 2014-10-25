# Contributor: Lonfucius <Lonfucius@gmail.com>
# Maintainer: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=ibus-table-others
pkgver=1.3.5
pkgrel=1
pkgdesc='Extra table based inputmethods for Ibus'
arch=('any')
url="https://github.com/moebiuscurve/ibus-table-others"
license=('GPL3')
depends=('ibus-table')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/moebiuscurve/ibus-table-others/archive/${pkgver}.tar.gz)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./autogen.sh  --prefix=/usr --libexecdir=/usr/lib/ibus
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}

md5sums=('97b5e1822a6616db9f3823f1222d4ff5')
