# Contributor: Baptiste Grenier <baptiste@bapt.name>
pkgname=nmzmail
pkgver=1.1
pkgrel=1
pkgdesc="fast mail searching for mutt"
arch=('i686' 'x86_64')
url="http://www.ecademix.com/JohannesHofmann/nmzmail.html"
license=('GPL')
depends=('namazu')
source=("http://www.ecademix.com/JohannesHofmann/$pkgname-$pkgver.tar.gz")
md5sums=('d049f3d54e4ef77a582a16e33d7ad560')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --mandir=/usr/share/man
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
