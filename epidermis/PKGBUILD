# Maintainer:  evr <evanroman at gmail>

pkgname=epidermis
pkgver=0.6.2
pkgrel=1
pkgdesc="An application for managing, automatically downloading and installing themes of various types"
arch=("i686" "x86_64")
url="http://epidermis.tuxfamily.org/"
license=('GPL')
depends=('python' 'python-gconf' 'python-pexpect' 'python-numeric')
source=(https://launchpad.net/epidermis/0.x/0.6.3/+download/epidermis-0.6.2.tar.gz)
md5sums=('131d51a0a9ddb91b1f0fd21a9796f705')

build() {
	/bin/true;
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  python setup.py install --prefix=/usr --root=${pkgdir}
}
