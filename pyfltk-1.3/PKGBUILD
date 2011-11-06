# Maintainer:  Kozec (kozec-at-kozec-dot-com)
# Contributor: TDY <tdy@gmx.com>
# Contributor: rabyte <rabyte*gmail>
# Contributor: LukenShiro <lukenshiro@ngi.it>
# Contributor: Exaos <Exaos.Lee*gmail>

pkgname=pyfltk-1.3
pkgver=1.3.0
pkgrel=1
pkgdesc="A Python wrapper for the Fast Light Tool Kit library"
arch=('i686' 'x86_64')
url="http://pyfltk.sourceforge.net/"
license=('LGPL')
depends=('fltk>=1.3.0' 'mesa' 'python2')
makedepends=('swig1>=1.3.30')
source=(http://downloads.sourceforge.net/pyfltk/pyFltk-$pkgver.tar.gz)
md5sums=('3dbd8edb3b0afa7257a4baa7165f7e71')

build() {
  cd "$srcdir/pyFltk-$pkgver"
  python2 setup.py install --prefix=/usr --root=$pkgdir || return 1
}
