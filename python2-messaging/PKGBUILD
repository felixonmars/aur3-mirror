# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python2-messaging
_pkgbase=python-messaging
_pkgname=messaging
pkgver=0.5.12
pkgrel=1
pkgdesc="Pure python SMS/MMS encoder/decoder"
arch=('any')
url="https://github.com/pmarti/python-messaging"
license=('GPL2')
depends=('python2')
source=("https://github.com/pmarti/$_pkgbase/archive/$pkgver.tar.gz")
sha512sums=('dccd511bf7597831afb4386a18d4efec89a42f8425a41bf651474659ee525fe35f02830c9ca4ca0ece0937e641f3417fbf32ec4ec0c698e3dabfda3f4dbdeea6')

build() {
  cd ${srcdir}/${_pkgbase}-${pkgver}
  python2 setup.py build
}
package() {
  cd ${srcdir}/${_pkgbase}-${pkgver}
  python2 setup.py install --root=$pkgdir
}
