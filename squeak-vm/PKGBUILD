# Contributor: Piero Sartini <piero@sartini.de>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: knut
# Contributor: kxmd

pkgname=squeak-vm
pkgver=4.4.7.2357
pkgrel=1
pkgdesc="a full-featured implementation of the Smalltalk programming language and environment"
arch=('i686' 'x86_64')
url="http://www.squeak.org/"
license=('custom:MIT' 'APACHE')
conflicts=('squeak')
provides=('squeak')
depends=('alsa-lib' 'libxt' 'libxrender' 'libgl')
makedepends=('cmake')
optdepends=('speex: for ogg plugin' 'gstreamer0.10: for gstreamer plugin' 'libpulse: for pulse plugin' 'squeak-image: for the full Squeak environment')
source=(http://ftp.squeak.org/4.2/unix-linux/Squeak-$pkgver-src.tar.gz)
md5sums=('49c60cae3f3ea84d45655ea792df0272')

build() {
  cd "${srcdir}/Squeak-$pkgver-src/"
  # Create build directory
  [ -d build ] && rm -rf build/
  install -d build
  cd build
  # Build program
  ../unix/cmake/configure --prefix=/usr \
                          --without-quartz \
                          --with-x \
                          --enable-mpg-mmx || return 1
  make || return 1
  make DESTDIR="$pkgdir" install
  # Install license
  mkdir -p $pkgdir/usr/share/licenses/squeak
  install "${srcdir}/Squeak-$pkgver-src/unix/doc/LICENSE" $pkgdir/usr/share/licenses/squeak
  #rm -f $pkgdir/usr/bin/squeak.sh
}

# vim:set ts=2 sw=2 et:
