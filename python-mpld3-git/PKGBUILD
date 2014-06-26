# Contributor: vsilv <vsilverlord@googlemail.com>
# Maintainer : vsilv <vsilverlord@googlemail.com>
pkgname=python-mpld3-git
pkgver=v0.2
pkgrel=1
pkgdesc="interactive D3js-based viewer which brings matplotlib graphics to the browser"
arch=('i686' 'x86_64')
url="https://github.com/jakevdp/mpld3"
license=('BSD')
depends=('python>=3.1' 'python-jinja' 'python-matplotlib' )
makedepends=('git')
provides=('python-mpld3')
source=('mpld3::git+https://github.com/jakevdp/mpld3.git')

md5sums=('SKIP')
_gitname='mpld3'

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
build() {
  cd "${srcdir}/${_gitname}"
  python setup.py submodule
  python setup.py build
}

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --prefix=/usr --root=${pkgdir} -O1 --skip-build
  
}

