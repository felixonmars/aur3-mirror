# Maintainer:  <clu>

pkgname=python2-idlsave  
_pkgname=IDLSave
pkgver=1.0.0
pkgrel=1
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
md5sums=('2b2d4d0cc69d12d327bff2a78bcb737d')
#source=(http://sourceforge.net/projects/idlsave/files/$_pkgname/$_pkgname-$pkgver/$_pkgname-${pkgver}.tar.gz)

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/ --optimize=1
}
