# Maintainer: Dogukan Korkmazturk <d.korkmazturk@gmail.com>
# Contributor: Stephen Garcia <stgarcia@verizon.net> irc: Execute_Method
pkgname=cwallpaper-fltk
pkgver=0.4.2
pkgrel=1
pkgdesc="*FLTK version* CWallpaper is a front end for fbsetbg, Esetroot, feh, and other wallpaper changers"
arch=('i686' 'x86_64' )
url="http://cwallpaper.sourceforge.net/index.php"
license=('GPL')
depends=('fltk')
conflicts=('cwallpaper')
makedepends=('automake' 'autoconf')
install=${pkgname}.install
source=("http://downloads.sourceforge.net/project/cwallpaper/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('f14cb82b10d721a0fe4d667b6a18d769')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin/ || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install
}