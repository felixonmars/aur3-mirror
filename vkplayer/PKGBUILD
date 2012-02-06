pkgname=vkplayer
pkgver=0.08.16
pkgrel=1
pkgdesc="VKPlayer Search music, load MyAudio and Recommendations playlists, save stream while"
arch=(any)
url="http://forum.ubuntu.ru/index.php?topic=168217"
license=('unknown')
depends=('qt' 'gstreamer0.10-ffmpeg' 'gstreamer0.10-ugly' 'gstreamer0.10-ugly-plugins' 'gstreamer0.10-good-plugins')
makedepends=('phonon')
source=("https://launchpad.net/~yuberion/+archive/vkget/+files/vkplayer_0.08-16-4.tar.gz" "make.patch")
md5sums=('05df66b10732b04dc7de2c181962f387'
         '2b9044fc10ff51869d5119712ee04519') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname/src"
  qmake
  patch Makefile -i ../../../make.patch 
  make
}

check() {
  cd "$srcdir/$pkgname/src"
  make -k check
}

package() {
  cd "$srcdir/$pkgname/src"
  make INSTALL_ROOT="${pkgdir}" install
}
