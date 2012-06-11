# Maintainer: David McIlwraith <archaios at archaios dot net>
# Contributor: Qusai Al Shidi <aquafox90 at gmail dot com>
pkgname=crossfire-client
pkgver=1.70.0
pkgrel=1
pkgdesc="A free and open source cross platform MMORPG."
url="http://crossfire.real-time.com/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libx11' 'sdl' 'alsa-lib' 'gtk2' 'lua' 'curl' 'libglade' 'libgl')
makedepends=('autoconf' 'automake' 'libtool')
conflicts=('crossfire-client-svn')
source=(http://downloads.sourceforge.net/project/crossfire/crossfire-$pkgver/$pkgname-$pkgver.tar.gz
	crossfire-client-1.70.0-fix-libx11-dep.patch)
md5sums=('657a773fc2223629474c7ec16635d2ef'
         '8802685259be00c0a48f774cb284b400')

build(){
  cd $srcdir/$pkgname-$pkgver

  # configure.ac patch for missing libX11 dependency
  patch -Np0 -i "$srcdir/crossfire-client-1.70.0-fix-libx11-dep.patch"

  # Upstream deprecates use of autogen.sh, included aclocal.m4 is
  # out-of-date; as configure.ac is patched due to a problem with X_LIBS,
  # autoconf-related files must be rebuilt
  autoreconf -f -i
  ./configure --prefix=/usr

  make
  make DESTDIR=$pkgdir install
}
