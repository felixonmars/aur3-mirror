# Maintainer: Levent <levent@online.de>
# Contributor Levent <levent@online.de>
pkgname=gspeakers
pkgver=0.11
pkgrel=1
pkgdesc="GSpeakers is a multi platform loudspeaker design program"
arch=(i686 x86_64)
url="http://gspeakers.sourceforge.net/index.html"
license=('GPL')
depends=('gnucap')
source=(http://internap.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('1a8ed81fe42000969e8b0d29f8156bae')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-no-debug-output --disable-dependency-tracking 
  make || return 1
  make prefix=$startdir/pkg/usr install
}
