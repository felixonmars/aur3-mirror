# Maintainer: DOOMer <doomer3d@gmail.com>
# Contributor: DOOMer <doomer3d@gmail.com>
pkgname=qtagger
pkgver=1.0.1
pkgrel=3
pkgdesc="Crossplatform simple id3 tag editor base on Qt4 & TagLib."
arch=('i686' 'x86_64')
url="http://qtagger.googlecode.com/"
license=('GPL2')
depends=('qt>=4.5.0' 'taglib>=1.6')
makedepends=('cmake>=2.6')
source=(http://qtagger.googlecode.com/files/qtagger-$pkgver.tar.bz2)
md5sums=('dfe2e8899b3f219029f0a228eacb5009')

build() {

cd $srcdir/qtagger-$pkgver
cmake .
make || return 1
make install DESTDIR="${pkgdir}" || return 1
}



