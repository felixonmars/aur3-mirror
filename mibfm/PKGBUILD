
pkgname=mibfm
pkgver=0.1
pkgrel=1
pkgdesc="Utility for uploading/downloading files to/from Memory-iButtons produced by Dallas Semiconductor. Compatible devices are DS1993, DS1995 and DS1996. Use DS9097U-9."
arch=('any')
url="http://mibfm.sourceforge.net/"
license=('GPL')
groups=()

depends=()
makedepends=()
provides=('mibfm')
conflicts=('mibfm')
replaces=()
backup=()
options=()
install=
source=(http://downloads.sourceforge.net/sourceforge/mibfm/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('601bbb2ddadd7ad00e2ffba70d57b8ef')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make clean
  make || return 1

  install -D -m755 ./mibfm $pkgdir/usr/bin/mibfm
}

