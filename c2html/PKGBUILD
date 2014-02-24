# Contributor: Jed Brown <jed@59A2.org>
pkgname=c2html
pkgver=0.9.6
pkgrel=2
pkgdesc="C -> html converter"
arch=(i686 x86_64)
url="http://packages.debian.org/sid/web/c2html"
license=('GPL')
depends=()
options=(!distcc)
source=(http://ftp.de.debian.org/debian/pool/main/c/c2html/c2html_$pkgver.orig.tar.gz
	http://ftp.de.debian.org/debian/pool/main/c/c2html/c2html_$pkgver-2.diff.gz)
md5sums=('043cb8c73e634f1f5c0d6bd7c5c4e19b'
         '99e9b204b14419c31b2eef4f3435bb28')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 <../c2html_$pkgver-2.diff

  ./configure --prefix=/usr LEXLIB=-lfl
  make  || return 1
  make install \
	prefix=$pkgdir/usr \
	docdir=$pkgdir/usr/share/doc/c2html \
	man1dir=$pkgdir/usr/share/man/man1
}

