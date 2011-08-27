# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=python26-opengl
pkgver=3.0.1
pkgrel=1
pkgdesc="The cross platform Python binding to OpenGL and related APIs"
url="http://www.pyopengl.sourceforge.net"
license=('BSD')
arch=('any')
depends=('python26' 'tk' 'freeglut' 'python26-distribute')
source=("http://downloads.sourceforge.net/pyopengl/PyOpenGL-$pkgver.tar.gz"
	'LICENSE')
md5sums=('221d4a6a0928fcfeef26751370ec5f52'
         '0b53c508a63e5dbaf44cdfb0fa103b3a')

package() {
 cd "$srcdir/PyOpenGL-$pkgver"
 python26 setup.py install --root="$pkgdir"
 install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
