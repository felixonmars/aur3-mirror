# Contributor: arch0r <arch0r@inbox.com>

pkgname=kletterwizard
pkgver=0.9.8
pkgrel=2
pkgdesc="K-Letter-Wizard makes writing letters easy"
arch=(i686)
url="http://www.kluenter.de/klw"
license=('GPL')
depends=('kdelibs>=3.2.x' 'tetex' 'kdegraphics>=3.5' 'gdb')
source=(http://www.kluenter.de/$pkgname-$pkgver.tar.gz)
md5sums=(be808768b092c1b5372697f25b4d5b9f)

build() {
  cd "$srcdir/$pkgname"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

