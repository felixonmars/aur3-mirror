# Maintainer: Travis Lyons <travis.lyons@gmail.com>

pkgname=system-storage-manager
pkgver=0.2
pkgrel=1
pkgdesc="A single tool to manage your storage"
arch=(i686 x86_64)
url="http://storagemanager.sourceforge.net/"
license=('GPL')
depends=('python2')
source=("http://sourceforge.net/projects/storagemanager/files/system-storage-manager-$pkgver.tar.gz")
md5sums=('524654f3b7bab544c4e612470b5d2392')

build(){
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}


# vim:set ts=2 sw=2 et:
