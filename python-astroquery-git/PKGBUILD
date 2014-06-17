# Contributor: vsilv <vsilverlord@googlemail.com>
# Maintainer : vsilv <vsilverlord@googlemail.com>
pkgname=python-astroquery-git
pkgver=v0.1
pkgrel=1
pkgdesc="Package to access online data ressources for astronomy"
arch=('i686' 'x86_64')
url="https://github.com/astropy/astroquery"
license=('BSD')
depends=('python>=3.1' 'python-numpy>=1.5' 'python-scipy' 'python-requests' 'python-keyring' 'python-lxml' 'python-astropy')
conflicts=('python-pyfits' 'python-vo')
makedepends=('git')
provides=('python-astroquery')
source=('astroquery::git+https://github.com/astropy/astroquery.git')

md5sums=('SKIP')
_gitname='astroquery'

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
build() {
  cd "${srcdir}/${_gitname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --prefix=/usr --root=${pkgdir} -O1 --skip-build
  
}

