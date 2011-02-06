# Contributor: wido <widomaker2k7@gmail.com>

pkgname=lib32-libdvbpsi
pkgver=0.1.7
pkgrel32=1
pkgrel=1
pkgdesc="MPEG TS and DVB PSI tables library (needed by vlc for streaming)."
url="http://developers.videolan.org/libdvbpsi/"
license=('GPL2')
arch=('x86_64')
depends=('lib32-glibc')
groups=('lib32')
source=(ftp://ftp.archlinux.org/extra/os/i686/${pkgname/lib32-/}-${pkgver}-${pkgrel32}-i686.pkg.tar.xz)
md5sums=('437aa09ca552411b4c5825a9af79d5ae')

build() {
  mkdir -p $pkgdir/opt/lib32/usr/lib/
  cp -r $srcdir/usr/lib/*.so* $pkgdir/opt/lib32/usr/lib
}
