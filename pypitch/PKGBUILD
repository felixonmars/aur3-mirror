# Maintainer: Tyler <tjb0607 at gmail dot com>
pkgname=pypitch
pkgver=svn_rev9
pkgrel=1
pkgdesc="analyze audio streams for pitch"
arch=('i686' 'x86_64')
url="http://svn.jstump.com/r/pypitch/"
license=('GPL')
depends=('python')
makedepends=('subversion')
source=()
md5sums=()

build() {
svn checkout http://svn.jstump.com/r/pypitch/trunk/
cd $srcdir/trunk/
python setup.py build
install -d $pkgdir/usr/lib/python2.6/site-packages
cp -R $srcdir/trunk/build/lib.linux-x86_64-2.6/pypitch $pkgdir/usr/lib/python2.6/site-packages/
}
