# Contributor: David Keogh <davekeogh@shaw.ca>

pkgname=colorwalk
pkgver=0.1.1
pkgrel=2
pkgdesc="A GTK+ comicbook reader written in Python"
arch=('any')
url="http://github.com/davekeogh/colorwalk/tree/master"
license=('GPLv3')
depends=('pygtk' 'unrar' 'unzip' 'python2-numpy')
source=("http://cloud.github.com/downloads/davekeogh/colorwalk/$pkgname-$pkgver.tar.gz")
md5sums=('39c2b26a48e5c01c35fa8bde3d87ec21')

build() {
    cd "$startdir/src/$pkgname-$pkgver"
    
    python2 setup.py build
    python2 setup.py install --root=$pkgdir/ || return 1

}

