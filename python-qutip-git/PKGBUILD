# Contributor: vsilv <vsilverlord@googlemail.com>
# Maintainer : vsilv <vsilverlord@googlemail.com>
pkgname=python-qutip-git
pkgver=v0.1
pkgrel=1
pkgdesc="Framework for solving the dynamics of open quantum systems"
arch=('any')
url="https://github.com/qutip/qutip"
license=('GPLv3')
depends=('python>=3.1' 'python-numpy>=1.5' 'python-scipy')
conflicts=('python-qutip')
makedepends=('git' 'cython')
provides=('python-qutip')
source=('qutip::git+https://github.com/qutip/qutip.git')

md5sums=('SKIP')
_gitname='qutip'

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

