# Maintainer: Max Meyer <dev |asdf| fedux # org>
#
# Based on spec-file from mtx-1.3.12-9.fc19.src.rpm 
#
pkgname=mtx
pkgver=1.3.12
pkgrel=2
pkgdesc="Media Changer Tools"
arch=( 'i868' 'x86_64' )
url="http://sourceforge.net/projects/mtx/"
license=('GPL')
depends=( 'glibc' )
source=(
  http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz 
	$pkgname-$pkgver-destdir.patch
	$pkgname-$pkgver-argc.patch
)
sha256sums=() #generate with 'makepkg -g'
sha256sums=('0261c5e90b98b6138cd23dadecbc7bc6e2830235145ed2740290e1f35672d843'
            '7c71788310fdbc8087feccae26950849b4a464cf48e5689ad20ddce7b864a42e'
            '7416258e77e881ee52b5891cdd41136e3e3f375fb62e7ea6ed7328700d3ed4a5')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	patch -p2 -i "$srcdir/$pkgname-$pkgver-destdir.patch"
	patch -p2 -i "$srcdir/$pkgname-$pkgver-argc.patch"

  chmod a-x contrib/config_sgen_solaris.sh contrib/mtx-changer
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
