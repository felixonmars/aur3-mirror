# Contributor: vsilv <vsilverlord@googlemail.com>
# Maintainer : vsilv <vsilverlord@googlemail.com>
pkgname=python-pylatex-git
pkgver=v0.1
pkgrel=1
pkgdesc="A Python library for creating LaTeX files"
arch=('i686' 'x86_64')
url="https://github.com/JelteF/PyLaTeX"
license=('MIT')
depends=('python>=3.1')
makedepends=('git')
provides=('python-pylatex')
source=('PyLaTeX::git+https://github.com/JelteF/PyLaTeX.git')

md5sums=('SKIP')
_gitname='PyLaTeX'

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

