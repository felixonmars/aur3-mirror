# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=obkey-dev
_pkgname=obkey
pkgver=1.0
pkgrel=1
pkgdesc="Openbox Key Editor"
arch=('any')
url="http://code.google.com/p/obkey"
depends=('python2' 'pygtk')
makedepends=('python2')
license=('GPL')
conflicts=('obkey-git')
source=(http://obkey.googlecode.com/files/${_pkgname}-${pkgver}.tar.gz)
md5sums=('fd11d473d79055af1e68f40c354d233b')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python2 setup.py install --root=${pkgdir}
}
