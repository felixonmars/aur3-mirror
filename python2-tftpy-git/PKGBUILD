# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Daniel Micay <danielmicay@gmail.com>

_basename=tftpy
pkgname=python2-$_basename-git
pkgver=0.6.1.r7.g21c0b09
pkgrel=1
pkgdesc="TFTP library for the Python programming language"
arch=(any)
url="http://tftpy.sourceforge.net/"
license=('MIT')
depends=('python2')
options=(!emptydirs)
provides=(python2-$_basename)
conflicts=(python2-$_basename)
source=(git://github.com/msoulier/$_basename.git)
md5sums=('SKIP')


pkgver() {
  cd "$_basename"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_basename"

  python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
