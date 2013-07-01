# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=fuppes-svn
pkgver=692
pkgrel=3
pkgdesc="A free, multiplatform Universal Plug and Play (UPnP) A/V MediaServer"
arch=('i686' 'x86_64')
url="http://fuppes.ulrich-voelkel.de/"
license=('GPL2')
backup=('var/lib/fuppes/fuppes.cfg')
depends=('libxml2' 'pcre' 'sqlite')
optdepends=('libvorbis: OGG Vorbis decoding' \
            'libmpcdec: MPC decoding' 'flac: FLAC decoding' \
            'imagemagick: image transcoding' \
            'taglib: audio metadata' 'libmp4v2: audio metadata' \
            'exiv2: EXIF support' \
            'ffmpeg: video metadata' \
            'mysql: mysql database' \
            'curl: blip.tv')
# minimal makedepends
#makedepends=('subversion')
# depends for all possible plugins (only the correctly detected ones are listed)
makedepends=('subversion' \
             'libvorbis' 'libmpcdec' 'flac' 'faad2' 'libmad' \
             'imagemagick' \
             'taglib' 'libmp4v2' \
             'exiv2' \
             'ffmpeg' \
             'mysql')
source=('fuppes::svn+https://fuppes.svn.sourceforge.net/svnroot/fuppes/trunk' \
        fix_regexp_crash.diff fix_includes.diff ffmpeg_0.11.diff)
md5sums=('SKIP'
         '67a7059bcf61d01bf8ac8f3b4429bd53'
         '050071ed96aa1f25802f4ed88334e765'
         'bef3522097ec99b30609770ad3d509d5')

pkgver() {
  cd "$srcdir/fuppes"
  svnversion | tr -d [A-z]
}

build()
{
  cd "$srcdir/fuppes"

  patch -Np0 < "$srcdir/fix_regexp_crash.diff" || true
  patch -Np0 < "$srcdir/fix_includes.diff" || true
  patch -Np0 < "$srcdir/ffmpeg_0.11.diff" || true
  sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g' configure.ac

  autoreconf -vfi
  ./configure --sysconfdir=/etc --localstatedir=/var --prefix=/usr --disable-rpath
  sed -i 's|$(basedir)/fuppes.cfg|$(DESTDIR)/&|g' config/Makefile
  make
}

package() {
  cd "$srcdir/fuppes"
  make DESTDIR="$pkgdir" install
}

