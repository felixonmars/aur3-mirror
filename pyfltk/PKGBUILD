# Maintainer:  Kozec (kozec-at-kozec-dot-com)
# Contributor: TDY <tdy@gmx.com>
# Contributor: rabyte <rabyte*gmail>
# Contributor: LukenShiro <lukenshiro@ngi.it>

pkgname=pyfltk
pkgver=1.3.0
pkgrel=1
pkgdesc="A Python wrapper for the Fast Light Tool Kit library"
arch=('i686' 'x86_64')
url="http://pyfltk.sourceforge.net/"
license=('LGPL')
depends=('fltk>=1.3.0' 'mesa' 'python2')
makedepends=('swig>=2.0.4')
source=(http://downloads.sourceforge.net/pyfltk/pyFltk-$pkgver.tar.gz)

build() {
  cd "$srcdir/pyFltk-$pkgver"
  python2 setup.py install --prefix=/usr --root=$pkgdir || return 1
}
md5sums=('3dbd8edb3b0afa7257a4baa7165f7e71')
