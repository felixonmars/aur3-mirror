# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Daniel Micay <danielmicay@gmail.com>

_basename=tftpy
pkgname=python2-$_basename
pkgver=0.6.1
pkgrel=1
pkgdesc="A TFTP library for the Python programming language."
arch=(any)
url="http://tftpy.sourceforge.net/"
license=('MIT')
depends=('python2')
options=(!emptydirs)
source=("https://sourceforge.net/projects/tftpy/files/latest/download/${pkgname}-${pkgver}.tar.gz")
sha1sums=('c713c4f9b66a12d633443ee8c50d627e68bcc09b')


package() {
  cd "$srcdir/$_basename-$pkgver"
  python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
