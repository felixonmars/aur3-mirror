# Contributor: Florian Pritz <f-p@gmx.at>

pkgname=gom
pkgver=0.30.2
pkgrel=1
pkgdesc="Command line and interactive ncurses-based OSS audio mixer"
arch=('i686' 'x86_64')
url="http://packages.debian.org/en/sid/gom"
license=('GPL')
depends=('oss')
source=("http://ftp.de.debian.org/debian/pool/main/g/gom/${pkgname}_${pkgver}.orig.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
md5sums=('7e53cdf68a54be2ff07fd8183c1b17b0')
sha1sums=('1048c8a823dc823d8e9bc35b96ee5c09fb9555fe')
