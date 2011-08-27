# Contributor: Simon Brakhane <simon.brakhane at web dot de>

pkgname=pymote
pkgver=0.1
pkgrel=1
pkgdesc="Yet another python class for the wiimote."
arch=(i686 x86_64)
url="http://www.failedprojects.de/projects/show/pymote"
license=('GPL')
depends=('bluez-python')
source=(http://www.failedprojects.de/attachments/download/8/${pkgname}-${pkgver}.tgz)
md5sums=('b6c1d151067a08af89263477c1782d2f')

build() {
  cd $startdir/src/$pkgname
  python setup.py install --root=$startdir/pkg
}

