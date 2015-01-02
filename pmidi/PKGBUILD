# Maintainer: Aka <aka@worstofevils.net>
# Contributor: Laurie Clark-Michalek <bluepeppers@archlinux.us>
# Contributor: Roman G <drakosha@au.ru>

pkgname=pmidi
pkgver=1.7.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Midi player'
url="http://sourceforge.net/projects/$pkgname"
depends=('glib' 'alsa-lib')
license=('GPL')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('013a63fd8453e66914cfa87d534decb134d1de78bd28340a5e78102aee20596d6fc2206fe72c62a3c01395852e0e5e0720c89a0cf18021b48d120b0d0c4ffaaa')

build() {
   cd $srcdir/$pkgname-$pkgver
   ./configure --prefix=/usr
   make || return 1
   
}

package() {
cd $srcdir/$pkgname-$pkgver
make DESTDIR=$pkgdir install
}

