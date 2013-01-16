# Maintainer: TDY <tdy@archlinux.info>

pkgname=pynamic
pkgver=1.1
pkgrel=1
pkgdesc="A benchmark to test a system's ability to handle the dynamic linking and loading requirements of Python-based scientific applications"
arch=('i686' 'x86_64')
url="https://computation.llnl.gov/casc/Pynamic/pynamic.htm"
license=('BSD')
depends=('openmpi' 'python2')
source=(https://computation.llnl.gov/casc/Pynamic/$pkgname-$pkgver.tar.gz)
md5sums=('e82a4c3955c2a7ded5e63cb7c7066e05')

build() {
  cd "$srcdir/$pkgname-$pkgver/$pkgname-pyMPI-2.6a1"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver/$pkgname-pyMPI-2.6a1"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver/$pkgname-pyMPI-2.6a1"
  make DESTDIR="$pkgdir/" install
  install -Dm644 ../$pkgname.LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.$pkgname"
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pyMPI"
}

# vim:set ts=2 sw=2 et:
