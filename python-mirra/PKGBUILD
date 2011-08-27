# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=python-mirra
_pkgname=mirra
pkgver=0.3.5
pkgrel=1
pkgdesc="A 2D OpenGL Python library"
arch=('i686')
url="http://www.ixi-software.net/content/body_software_mirra.html"
license=('LGPL')
depends=('python-opengl' 'python-pygame' 'psyco')
optdepends=('wxpython')
source=(http://ixi-software.net/content/download/$_pkgname/${_pkgname^m}-$pkgver.zip)
md5sums=('67bf19964f8e446a35d6c1e24c30bb5a')

build() {
  cd "$srcdir"/${_pkgname^m}-$pkgver
  python setup.py install --root="$pkgdir" || return 1
}
