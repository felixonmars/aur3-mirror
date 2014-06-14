# Maintainer: Manolo Martínez <manolo@austrohungaro.com>

pkgname=greg
pkgver=0.4.2
pkgrel=1
pkgdesc="A command-line podcast aggregator."
arch=(any)
url="https://github.com/manolomartinez/greg"
license=('GPL')
depends=('python-feedparser')
optdepends=('python3-stagger-svn: writing metadata'
  'wget: alternative downloadhandler'
	'aria2: alternative downloadhandler')
makedepends=('python-setuptools')
source=("https://github.com/manolomartinez/greg/archive/${pkgver}.tar.gz")
md5sums=('23df878dd36385973dedb087efdfb8f8')
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    msg "Running setup.py..."
    python setup.py install --root="${pkgdir}" --optimize=1
} 
