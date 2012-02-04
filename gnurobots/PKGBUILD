#Contributor: Dario Schiavon (dario.schiavon at fastwebnet.it)
#Contributor: Stefan Husmann <stefan-husmann@t-online.de>
#Contributor: Ashok `ScriptDevil` Gautham <ScriptDevil@gmail.com>

pkgname=gnurobots
pkgver=1.2.0
pkgrel=2
pkgdesc="A game/diversion where you construct a program for a little robot, then watch him explore a world"
arch=(i686 x86_64)
url="http://www.gnu.org/software/gnurobots/"
license=('GPL')
depends=('vte' 'libxpm' 'guile')

source=("http://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('2435f16a80b21ad348aa558e2e0ae9d8')

build() {

  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --with-x || return 1

  make || return 1

  make DESTDIR="$pkgdir" install
}

