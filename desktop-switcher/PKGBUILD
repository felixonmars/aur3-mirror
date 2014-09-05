# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Unknown

pkgname=desktop-switcher
pkgver=0.5.8
pkgrel=1
pkgdesc="Allows the user to switch between two desktop modes"
arch=('i686' 'x86_64')
depends=('netbook-launcher')
makedepends=('intltool')
url="https://edge.launchpad.net/~netbook-remix-team/+archive"
license=('GPL')
source=("https://launchpad.net/desktop-switcher/0.5/ubuntu-9.10-beta-freeze/+download/$pkgname-$pkgver.tar.gz"
    "https://launchpad.net/desktop-switcher/0.5/ubuntu-9.10-beta-freeze/+download/$pkgname-$pkgver.tar.gz.asc")
md5sums=('0c383f824d213d1729835349d715a93d'
         'SKIP')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname

  make install DESTDIR=$pkgdir
}
