# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Your Name <youremail@domain.com>
pkgname=quote
pkgver=0.05
pkgrel=1
pkgdesc="quote is a simple Perl script that allows retrieval of stock quotes from Yahoo! Finance."
arch=('i686', 'x86_64')
url="http://www.circlemud.org/~jelson/software/quote/"
license=('GPL')
groups=()
install=
source=(http://www.circlemud.org/pub/jelson/quote/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
 ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
md5sums=('c02a98d99b8e0a6490a7ff744d79e81e')
