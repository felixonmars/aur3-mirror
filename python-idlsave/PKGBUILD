# Maintainer:  <clu>

pkgname=python-idlsave  
_pkgname=IDLSave
pkgver=0.9.7
pkgrel=2
pkgdesc="IDLSave - a python module to read IDL 'save' files"
url="http://astrofrog.github.com/idlsave/"
arch=('any')
license=('MIT')
depends=('python2' 'python2-numpy')
makedepends=('python2' 'python2-distribute')
conflicts=()
replaces=()
backup=()
#install=
source=(https://github.com/downloads/astrofrog/idlsave/IDLSave-${pkgver}.tar.gz)
md5sums=('8364d1271231ec4b9e7fd75bc9c630a1')
#source=(http://sourceforge.net/projects/idlsave/files/$_pkgname/$_pkgname-$pkgver/$_pkgname-${pkgver}.tar.gz)

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/ --optimize=1
}
