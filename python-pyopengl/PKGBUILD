# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Mathieu Pasquet <mathieui> <mathieuivi@gmail.com>

pkgname=python-pyopengl
_pkgname=PyOpenGL
pkgver=3.0.1
pkgrel=1
arch=('any')
pkgdesc="Cross-platform Python bindings to OpenGL and related APIs."
depends=('python')
license='BSD'
url="http://pyopengl.sourceforge.net"
source=("http://sourceforge.net/projects/pyopengl/files/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.gz/download")
md5sums=('221d4a6a0928fcfeef26751370ec5f52')

package() {
  cd "${srcdir}/${_pkgname}-$pkgver/"
  python setup.py install --root="$pkgdir" --optimize=1
}
