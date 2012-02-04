# Contributor: Dmitriy Morozov <archlinux@foxcub.org> 
pkgname=python-interval
_pkgname=interval
pkgver=1.0.0
pkgrel=1 
pkgdesc=""
url="http://members.cox.net/apoco/interval/"
arch=('i686')
license="GPL" 
depends=('python') 
source=(http://members.cox.net/apoco/$_pkgname/$_pkgname-$pkgver.tar.bz2)
md5sums=(9dd55d218911e2b3c9cc9755608aeaf6)

build() { 
 cd $startdir/src/$_pkgname-$pkgver
 python setup.py install --prefix=$startdir/pkg/usr
}
