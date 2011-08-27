# Contributor: r'ennero <rennero@bastardi.net>
pkgname=freej
pkgver=0.10
pkgrel=3
pkgdesc="FreeJ is a vision mixer: an instrument for realtime video manipulation used in the fields of dance teather, veejaying, medical visualisation and TV."
url="http://freej.dyne.org/"
arch=('i686' 'x86_64')   
makedepends=('bash' 'rpmextract')
depends=('alsa-lib' 'ffmpeg' 'fftw' 'jack-audio-connection-kit' 'libjpeg6' 'liblo' 'libpng' 'libtheora' 'libvorbis' 'sdl' 'slang' 'sdl_gfx')
source=("http://packman.links2linux.org/download/freej/361875/freej-0.10-0.pm.4.1.i586.rpm")
md5sums=('865601c291d552fc4d1df4e4fb36fe2c')
[ "$CARCH" = "x86_64" ] && source=("http://packman.links2linux.org/download/freej/362606/freej-0.10-0.pm.4.1.x86_64.rpm") && md5sums=('672fa9d864c67f732a84c60dc2475ca3')

license=('GPL')

build() {
   
 if [ "$CARCH" = "i686" ]; then
               cd $pkgdir
               rpmextract.sh $srcdir/freej-0.10-0.pm.4.1.i586.rpm 
 else
               cd $pkgdir
               rpmextract.sh $srcdir/freej-0.10-0.pm.4.1.x86_64.rpm
 fi
}
