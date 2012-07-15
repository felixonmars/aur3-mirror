# Maintainer: Lilian Monchalin <isaya07@users.sourceforge.net>

pkgname=gsampler
pkgver=0.3
pkgrel=2
pkgdesc="Gsampler is a Linuxsampler Frontend"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gsampler/"
license=('GPL3')
depends=('gtk3' 'linuxsampler' 'intltool')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('46faab64196418d0f828bd15d1e31a45')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr

	make || return 1
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
  
	make DESTDIR=$pkgdir install || return 1
}
