# Contributor: Nathan Owe. <ndowens.aur at gmail dot com>
pkgname=sync2cd
pkgver=1.3
pkgrel=2
pkgdesc="An incremental archiving tool. It allows backing up complete filesystem hierarchies to multiple backup media"
arch=('i686' 'x86_64')
url="http://c-space.org/software/sync2cd.html"
source=(http://c-space.org/download/$pkgname/$pkgname-$pkgver.tar.gz)
license=('gpl')
depends=('python>=2.4')
options=('!emptydirs')
md5sums=('ef75497153e5504b4e801987c243d024')
build() {

	/bin/true
}
package() {

  cd $srcdir/$pkgname-$pkgver
  
  python setup.py install --root=$pkgdir/
  
}


