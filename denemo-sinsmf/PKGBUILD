# Maintainer: David Adler <david.jo.adler@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Philipp Sandhaus <philipp.sandhaus@gmx.de>
# Contributor: Robert Emil Berge <filoktetes@linuxophic.org>
# Contributor: Gnud <ach.gnud@gmail.com>

pkgname=denemo-sinsmf
_pkgname=denemo
pkgver=0.8.18
pkgrel=1
pkgdesc="A music score editor. Experimental version - patched to exclude libsmf"
arch=('i686' 'x86_64')
url="http://www.denemo.org"
license=('GPL')
depends=('aubio' 'portaudio' 'lilypond' 'gtk2' 'libxml2' 'guile' 'fftw' 'gtksourceview2' 'fluidsynth' 'libsmf')
provides=(denemo)
conflicts=(denemo)
options=('!libtool')
source=("http://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.gz" 'denemo.patch')
md5sums=('beba8545152eed23e1fcac61923b3b80'
         'f6d2cc25a736f758213fa2eeae275e17')

build() {
  cd $srcdir/$_pkgname-$pkgver
  
  patch -p1 -i $srcdir/denemo.patch
  autoreconf
  
  ./configure --prefix=/usr
  make

  make DESTDIR=$pkgdir install
}
