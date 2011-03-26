# Contributor: droog
pkgname=pypanel-gaps
pkgver=2.4
pkgrel=1
pkgdesc="A lightweight panel written in python with the x y gap patch from http://de.pastebin.ca/568668"
arch=('i686' 'x86_64')
url="http://pypanel.sourceforge.net/"
license=('GPL')
depends=('python' 'x-server' 'python-xlib' 'imlib2')
makedepends=('python')
source=(http://downloads.sourceforge.net/sourceforge/pypanel/PyPanel-$pkgver.tar.gz pypanel.patch)
md5sums=('f1f9a2ed80be72ab36e748833618daba'
         'caef730f0af803866ab9c5f7a882e652')

build() {
        cd $startdir/src/PyPanel-$pkgver
	patch -Np1 -i ../pypanel.patch || return 1
        python setup.py install --root=$startdir/pkg || return 1
} 

