# Contributor: Alec Litvinov <aleclitvinov1980@gmail.com>
pkgname=lives-svn
pkgver=2.0.7
pkgrel=1
pkgdesc="A Video Editing System"
arch=('i686' 'x86_64')
url="http://lives.sourceforge.net"
license=('GPL')
provides=('lives')
conflicts=('lives')
makedepends=('subversion')
depends=('mplayer' 'imagemagick' 'gtk3' 'sox' 'libvisual' 'liboil' 
         'libavc1394' 'mjpegtools' 'python' 'ffmpeg' 'jack' 'fftw')
optdepends=('xorg-utils' 'sdl' 'libogg' 'mkvtoolnix-cli' 
            'libmatroska' 'ogmtools' 'dvgrab' 'cdrkit' 'lame' 'youtube-dl')

options=()
changelog=

build () {
svn checkout http://svn.code.sf.net/p/lives/code/trunk "$srcdir"
cd "$srcdir"
./autogen.sh
./configure --prefix=/usr
make
}

package() {
echo $pkgdir
read answer

  make install DESTDIR="$pkgdir"
  rm "$pkgdir"/usr/bin/lives
  ln -s /usr/bin/lives-exe "$pkgdir"/usr/bin/lives
}
