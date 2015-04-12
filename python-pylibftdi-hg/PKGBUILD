# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-pylibftdi-hg
pkgver=0.14.2.3.e60a488a7872
pkgrel=1
pkgdesc="Pythonic interface to FTDI devices using libftdi"
arch=('any')
url="https://bitbucket.org/codedstructure/pylibftdi"
license=('MIT')
depends=('python' 'libftdi')
makedepends=('mercurial')
provides=('python-pylibftdi')

_hgroot='https://bitbucket.org/codedstructure/pylibftdi'
_hgname='pylibftdi'

source=("$_hgname::hg+$_hgroot")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_hgname"
  hg log -r . --template '{latesttag}-{latesttagdistance}-{node|short}\n' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_hgname"
}

package() {
  cd "$srcdir/$_hgname"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

