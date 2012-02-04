# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>

pkgname=uniutils
pkgver=2.27
pkgrel=1
pkgdesc="a set of programs for manipulating and analyzing Unicode text"
arch=('i686' 'x86_64')
url="http://billposer.org/Software/unidesc.html"
license=('GPL3')
depends=()
makedepends=()
optdepends=()
source=("http://billposer.org/Software/Downloads/$pkgname-$pkgver.tar.bz2")
md5sums=('0d8cdf67d670b85d8ae8bfe262ebbd65')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --mandir=/usr/share/man || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}

# vim:set ts=2 sw=2 et:
