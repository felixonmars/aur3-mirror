# Contributor: Sascha Pfau <MrPeacock at gmail dot com>
pkgname=konch
pkgver=1.00
pkgrel=1
pkgdesc="Konch is a highly-configurable KDE system tray applet that acts as a proxy to ordinary scripts written in bash, Perl, etc."
url="http://konch.kdex.org/"
license="GPL"
depends=('kdelibs')
source=("http://konch.kdex.org/files/$pkgname-$pkgver.tar.gz")
md5sums=('4938ae121f6dedda7d294c00b6856786')
arch=('i686')

build() {
  cd $startdir/src/$pkgname-$pkgver
  
  ./configure || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install
}
