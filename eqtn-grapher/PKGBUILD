# Contributor: Jeff Bailes <thepizzaking@gmail.com>
# Contributor: Thomas Dziedzic

pkgname=eqtn-grapher
pkgver=20090301
pkgrel=2
pkgdesc="A 2D implicit equation grapher"
arch=('i686' 'x86_64')
url="http://eqtn-grapher.sourceforge.net/"
license=('GPL')
depends=('gtk2')
install=eqtn-grapher.install
source=("http://downloads.sourceforge.net/project/eqtn-grapher/eqtn-grapher/bugfixes%2C%20minor%20feature/grapher-$pkgver.tar.gz")
md5sums=('1c75a94836df4a74f3b71c51139062f6')

build() {
  cd grapher-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc

  make || return 1

  make DESTDIR=$pkgdir install || return 1
}
