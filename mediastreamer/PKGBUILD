pkgname=mediastreamer
pkgver=2.10.0
pkgrel=1
pkgdesc="Mediastreamer2 is a GPL licensed library to make audio and video real-time streaming and processing."
arch=(i686 x86_64)
url="http://www.linphone.org/"
license=('GPL')
options=(!libtool)
depends=('gsm' 'v4l-utils' 'ffmpeg' 'libxv' 'ortp' 'speex')
makedepends=('cmake' 'automoc4' 'intltool')
optdepends=('mediastreamer-plugin-msamr-git: amr plugin' 'mediastreamer-plugin-msx264-git: x264 plugin')

provides=('mediastreamer')
conflicts=('mediastreamer')

source=("http://download.savannah.gnu.org/releases/linphone/$pkgname/$pkgname-$pkgver.tar.gz"{,.sig})

build() {
  cd $srcdir/$pkgname-$pkgver

  ./autogen.sh
  ./configure --prefix=/usr --enable-external-ortp --libexecdir=/usr/lib/mediastreamer/
  make
}

package() {
  make -C $srcdir/$pkgname-$pkgver DESTDIR=$pkgdir install
}
md5sums=('5a4e7545e212068534b56fdf41c961e9'
         'SKIP')
