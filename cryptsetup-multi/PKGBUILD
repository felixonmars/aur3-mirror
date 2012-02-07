# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=cryptsetup-multi
_pkgname=cryptsetup
pkgver=1.4.1
pkgrel=1
pkgdesc="Userspace setup tool for transparent encryption of block devices using dm-crypt (support for multiple encrypted boot volumes)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://code.google.com/p/cryptsetup/"
groups=('base')
depends=('device-mapper>=2.02.85-2' 'libgcrypt' 'popt')
conflicts=('mkinitcpio<0.7' 'cryptsetup')
provides=('cryptsetup')
options=('!libtool' '!emptydirs')
source=("http://cryptsetup.googlecode.com/files/$_pkgname-$pkgver.tar.bz2"
	      "http://cryptsetup.googlecode.com/files/$_pkgname-$pkgver.tar.bz2.asc"
	      'encrypt_hook'
	      'encrypt_install')
sha256sums=('82b143328c2b427ef2b89fb76c701d311c95b54093c21bbf22342f7b393bddcb'
            '71c6506d4b6d0b22b9b6c2a68e604959e4c072af04680ed6acc0126c97bdbc88'
            '90ce4979adf6aaeb522a860de6172027d82a892aca8389ae5aefbf9eb51b0fef'
            'd4380195351b70abf8fcb3cd19461879c55a7a07e4915d1f0365b295b112a573')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	./configure --prefix=/usr --disable-static --sbindir=/sbin --libdir=/lib
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make DESTDIR="$pkgdir" install

	# Install hook.
	install -Dm 644 "$srcdir/encrypt_hook" "$pkgdir/lib/initcpio/hooks/encrypt"
	install -Dm 644 "$srcdir/encrypt_install" "$pkgdir/lib/initcpio/install/encrypt"

	# Fix 'pkgconfig' location.
	install -dm 755 "$pkgdir/usr/lib"
	mv "$pkgdir/lib/pkgconfig" "$pkgdir/usr/lib"
}
