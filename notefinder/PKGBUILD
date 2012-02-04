# Contributor: GFORGX <gforgx@gmail.com>
pkgname=notefinder
pkgver=0.1.8
pkgrel=1
pkgdesc="Easy-to-use desktop note-taking application"
arch=('i686' 'x86_64')
url="http://notefinder.co.cc"
depends=('python' 'qt' 'pyqt' 'setuptools' 'python-feedparser')
provides=('pycreole' 'libnofi')
license=('BSD revised' 'GPL' 'LGPL')
source=(http://notefinder.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('7cd78ecabe41f964c1ddb959899a1c0f')

build() {  
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir
}
