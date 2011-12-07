# Contributor: Ethan Hall <ethankhall@gmail.com>
pkgname=mpylayer
pkgver=0.2a1
pkgrel=1
pkgdesc="mpylayer is a python package to easily control mplayer (and in the future mencoder) in python, using a pythonic OO syntax"
depends=(mplayer python2)
arch=(any)
url="http://mpylayer.googlecode.com/"
license=('GPL')
source=(http://mpylayer.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=("5de9be5cc02dcea03dbf0ad941435cb6") #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root ${pkgdir}
} 
