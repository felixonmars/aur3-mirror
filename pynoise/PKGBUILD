# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: <oslik@mail.ru>
pkgname=pynoise  
pkgver=0.2
pkgrel=1 
pkgdesc="A python interface to libnoise"
url="http://home.gna.org/pynoise/"
arch=('i686')
license=('GPL')
depends=('python2' 'libnoise')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://download.gna.org/$pkgname/PyNoise-$pkgver.zip setup.py)
md5sums=('93bee1dc3a702486416db17b24c5bcda' 'e2f690ac2b08b8be67072ebc8468af68')
build() {
  cd $startdir/src/PyNoise-$pkgver
  cp ../../setup.py .
  python2 setup.py install --prefix=$pkgdir/usr
}