# Contributor: SiD/sidious <miste78@web.de>
pkgname=zoom2wav
pkgver=1.0
pkgrel=3
pkgdesc="ZOOM .aud or .zaf to WAV file converter for Zoom PS-02, PS-04, or MRS-8"
url="http://www.engens.com/dwight/software.html"
license="GPL2"
depends=()
source=(http://www.engens.com/dwight/dl/zoom2wav.c)
md5sums=(1291e001a0cb51c78f60f83da96376b7)
arch=('i686' 'x86_64')

build() {
  cd $srcdir
  gcc zoom2wav.c -v -o zoom2wav
  install -d -m 0755 $pkgdir/usr/bin
  install -m 0755 zoom2wav $pkgdir/usr/bin/	
}
