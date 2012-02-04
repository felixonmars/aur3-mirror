# Maintainer: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 
pkgname=lalita
pkgver=0.1.3
pkgrel=2
pkgdesc="The lalita IRC bot."
arch=(any)
url="http://launchpad.net/lalita"
license=('GPL3')
depends=('python>=2.5' 'twisted')
makedepends=('setuptools')
source=(http://code.launchpad.net/lalita/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('376d493f4b8b2448503ec48a156733fe')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir/ || return 1
} 
 
