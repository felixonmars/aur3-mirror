# Maintainer: Olaf Bauer <hydro@freenet.de>

pkgname=ttcut-svn
pkgver=238
pkgrel=3
pkgdesc="MPEG-2 cutting tool for removing commercials from demuxed DVB recordings"
arch=('i686' 'x86_64')
url="http://ttcut.tritime.de/index.2.html"
license=('GPL')
depends=('qt4' 'mesa' 'libmpeg2' 'glu')
makedepends=('subversion')
optdepends=('mplayer: preview cut'
            'ffmpeg: encoding mode')
conflicts=('ttcut')
provides=('ttcut')
source=(${pkgname}::svn+http://svn.berlios.de/svnroot/repos/ttcut/branches/work#revision=${pkgver}
        ttcut-0.19.6-deprecated.patch
        ttcut-0.19.6-ntsc-fps.patch
        ttcut-0.19.6-ffmpeg-vf-setdar.patch
        ttcut-0.19.6-no_implicit_GLU.patch)
md5sums=(SKIP
         'cbf959a2ac67f5a76b5a27043ddcbc49'
         '13d967ec8d1a40d41ca20e4b743eac95'
         '96869a5a33fe632336489a383ad7d629'
         'ed95d6cf9d078bfc0fdd793f2c67773f')

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p1 -i $srcdir/ttcut-0.19.6-deprecated.patch
  patch -p1 -i $srcdir/ttcut-0.19.6-ntsc-fps.patch
  patch -p1 -i $srcdir/ttcut-0.19.6-ffmpeg-vf-setdar.patch
  patch -p0 -i $srcdir/ttcut-0.19.6-no_implicit_GLU.patch
}

build() {
  cd "${srcdir}/${pkgname}"
  qmake-qt4 ttcut.pro -o Makefile.ttcut 
  make -f Makefile.ttcut 
}

package() {
  cd "${srcdir}/${pkgname}"
  install -D ttcut $pkgdir/usr/bin/ttcut 
}
