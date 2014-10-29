# OldOldContributor: tochiro@no.spam.mail.berlios.de
# OldContributor: Andreas W. Hauser <andy-aur@splashground.de>
# Contributor: Brian De Wolf <arch@bldewolf.com>

pkgname=mlton
pkgver=20130715
pkgrel=4
pkgdesc="an open-source, whole-program, optimizing Standard ML compiler"
url="http://mlton.org/"
license=('BSD' 'MIT' 'LGPL')
depends=('bash' 'gmp')
makedepends=('patch')
conflicts=()
replaces=()
backup=()
arch=(i686 x86_64)
options=('staticlibs')
install=
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.src.tgz \
	http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver-1.x86-linux.tgz)
md5sums=('8b4bd860e83deb67e5091e7d81a71fb2'
	'154211021262403bcc535a408e46c2d9')

if [ "${CARCH}" = "x86_64" ]; then
	source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.src.tgz \
		http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver-1.amd64-linux.tgz)
	md5sums=('8b4bd860e83deb67e5091e7d81a71fb2'
		'8f81fd906ee17a2893c2e7b6f5c6b702')

fi

build() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i -e "s/lib=.*/lib='${srcdir//\//\\/}'\/usr\/lib\/mlton/" "$srcdir/usr/bin/mlton" || return 1
	PATH="$PATH:$srcdir/usr/bin" make -j1 all-no-docs
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	# Copy over the handful of licenses and the README as explanation
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/$pkgname-$pkgver/doc/license/"* "$pkgdir/usr/share/licenses/$pkgname/"

	make -j1 DESTDIR="$pkgdir/" install-no-docs
}
