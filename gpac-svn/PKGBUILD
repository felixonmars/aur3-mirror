# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=gpac-svn
pkgver=4649
pkgrel=1
pkgdesc="MPEG-4 multimedia framework"
arch=('i686' 'x86_64')
url="http://gpac.sourceforge.net/"
license=('LGPL')
depends=('alsa-lib' 'zlib')
optdepends=('wxgtk: GUI Osmo4' 'openssl' 'ffmpeg' 'freetype2' 'libmad' 'libxml2: SVG parsing'
            'freeglut: OpenGL' 'faad2: AAC' 'xvidcore: MPEG4-ASP' 'libjpeg: JPEG image'
            'libpng: PNG image' 'libvorbis: OGG vorbis' 'libtheora: OGG theora'
            'a52dec: for A52 support' 'jack: for jack support' 'xulrunner: JavaScript')
makedepends=('subversion')
options=(!makeflags)
provides=('gpac')
conflicts=('gpac')
source=('svn+svn://svn.code.sf.net/p/gpac/code/trunk/gpac')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/gpac"
  svnversion | tr -d [A-z]
}

build() {
  cd "$srcdir/gpac"

  ./configure --prefix=/usr --mandir=/usr/share/man --X11-path=/usr --use-js=no
  make
}

package() {
  cd "$srcdir/gpac"

  make DESTDIR="$pkgdir" install
}
