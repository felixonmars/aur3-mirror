# Contributor: Jan Fader <jan.fader@web.de>
pkgname=miktex
pkgver=2.8.3541
pkgrel=2
pkgdesc="MPM (MiKTeX Package Manager) was originally intended to be a tool for MiKTeX/Windows users.  But the program can be helpful for users of other TeX systems too, because many of the MiKTeX packages are system-independent."
url="http://dojo.miktex.org/blogs/christian_schenk/articles/mpmunix.aspx"
arch=('i686')
license=('GPL')
depends=('curl' 'lynx' 'qt')
makedepends=('cmake' 'bison')
conflicts=()
replaces=()
backup=()
install="miktex.install"
source=(http://ftp.uni-erlangen.de/mirrors/CTAN/systems/win32/$pkgname/source/$pkgname-$pkgver.tar.bz2 miktex.sh)

build() {
  cd $srcdir/$pkgname-$pkgver
  unset LDFLAGS
  cmake -G "Unix Makefiles" -D "CMAKE_INSTALL_PREFIX:PATH=/usr" .
  make
  make DESTDIR=$pkgdir install
  mkdir -p $pkgdir/etc/profile.d/
  install -o root -g root $srcdir/miktex.sh $pkgdir/etc/profile.d/
}
md5sums=('edfc0fce88d135ecd67fe893685e76c7' 'df2ee5230d0deca11d7eafb246af9f7d')
