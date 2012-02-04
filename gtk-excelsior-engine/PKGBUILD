# Contributor: Josip Ponjavic <josipponjavic@gmail.com>
pkgname=gtk-excelsior-engine
pkgver=4.1.0
pkgrel=1
pkgdesc="A Theme Engine based on Clearlooks."
source=(http://www.nanolx.org/free/excelsior-$pkgver.tar.bz2)
url="http://www.nanolx.org/index.php"
license=('GPL')
depends=('gtk2')
md5sums=('f7af1905ebdffb2a7a7fe15cd05e23e3')

arch=('i686' 'x86_64')

build() {
  cd $startdir/src/excelsior
  sed -i 's|/usr/bin/install|/bin/install|g' $startdir/src/excelsior/Makefile.in
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
