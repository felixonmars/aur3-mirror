# Maintainer: jlu85 <jlu85 at ono dot com>

pkgname=(chuck-pulse)
pkgver=1.3.2.0
pkgrel=1
pkgdesc="ChucK is a programming language for real-time sound synthesis and music creation."
arch=('i686' 'x86_64')
url="http://chuck.cs.princeton.edu/"
license=('LGPL')
depends=('libsndfile' 'pulseaudio')
conflicts=('chuck' 'chuck-jack')
source=( ${url}release/files/chuck-${pkgver}.tgz src.patch )
md5sums=('2ddbfdc0e470a3d735ef890726899bd4'
	 '655cbf36e5dc65ad73e330da9e61bc21')


build() {
  cp $startdir/src.patch $srcdir/chuck-$pkgver
  cd $srcdir/chuck-$pkgver
  patch -p0 < src.patch || return 1
  cd src/
  make linux-alsa || return 1
  
}

package() {
  
  mkdir -p ${pkgdir}/usr/bin || return 1
  cp $srcdir/chuck-$pkgver/src/chuck ${pkgdir}/usr/bin || return 1  
  mkdir -p ${pkgdir}/usr/share/doc/chuck/ || return 1
  cp -R $srcdir/chuck-$pkgver/examples ${pkgdir}/usr/share/doc/chuck/ || return 1
  cp $srcdir/chuck-$pkgver/doc/* ${pkgdir}/usr/share/doc/chuck/ || return 1
}

