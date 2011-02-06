# Maintainer: Kosava <kosava@archlinux.us>

pkgname=a4
pkgver=0.03
pkgrel=1
pkgdesc="A4 is an editor and viewer of presentations."
arch=('i686' 'x86_64')
url="https://launchpad.net/a4"
license=('GPL3')
depends=('pygtk' 'python-rsvg' 'python-pyenchant' 'python2-numpy' 'python-lxml')
makedepends=('python2')
conflicts=('a4-bzr')
source=("http://launchpad.net/a4/trunk/0.03/+download/a4_0.03.tar.gz")
md5sums=('3d4a6f2abc5000827d0b9fcd47738ee4')

build() {
   cd $srcdir/$pkgname-$pkgver
   python2 setup.py install --prefix=$pkgdir/usr
}