# Maintainer: Wolfgang Faust <wolfgangmcq@gmail.com>
_basename=python-editorconfig-core
pkgname=$_basename-git
pkgver=0.11.1.r13.g5c12d5d
pkgrel=1
pkgdesc="Clone of EditorConfig core written in Python"
arch=('any')
url="http://editorconfig.org"
license=('PSF')
groups=()
depends=('python')
makedepends=('git')
provides=("$_basename")
conflicts=("$_basename")
source=("$pkgname"::"git://github.com/editorconfig/editorconfig-core-py.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root=$pkgdir --optimize=1
}

# vim:set ts=2 sw=2 et:
