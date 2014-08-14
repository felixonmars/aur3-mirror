# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com
# Contributor: Dan Serban
# Contributor: ra_fi

pkgname=rawstudio-svn
_svnmod=rawstudio
pkgver=4429  
pkgrel=1
pkgdesc="An open source raw-image converter written in GTK"
arch=('i686' 'x86_64')
license=('GPL')
url="http://rawstudio.org/"
depends=('exiv2' 'libgphoto2' 'flickcurl' 'fftw' 'gconf' 'lensfun' 'raptor1' 'lcms' 'gtk2' 'desktop-file-utils' 'osm-gps-map')
makedepends=('subversion' 'automake' 'libtool')
options=(!libtool !strip)
conflicts=('rawstudio')
install="rawstudio.install"

source=("$_svnmod::svn+http://rawstudio.org/svn/rawstudio/trunk/"
        'libpng15.patch'
        'lensfun-version.c.patch')
#       'autogen.patch' 'profiles-Makefile.am.patch'
md5sums=('SKIP'
         'e3577ab69ff095aa667d6df0c832f77b'
         'bd9064331e87c8045cc7b5a73ba12669')

pkgver() {
  cd "$SRCDEST/$_svnmod/"
  svnversion | tr -d [A-z]
}
prepare() {
  cd "$_svnmod/"
  cp -a "$SRCDEST/$_svnmod/.svn" .
  # fix pointer differ in signedness
  patch -p0 -i "$srcdir/libpng15.patch"
  # fixed upstream - use automake-1.12
  #patch -p1 -i "$srcdir/autogen.patch"
  #
  # make it actually work
  patch -p1 -i "$srcdir/lensfun-version.c.patch"
  # fixed upstream - fix white space after line ending '\' leaving out profiles
  #patch -p1 -i "$srcdir/profiles-Makefile.am.patch"
  #
  # just to be sure...
  sed -i 's@-DWITH_MMAP_HACK@-DWITH_MMAP_HACK -fno-aggressive-loop-optimizations@' plugins/load-dcraw/Makefile.am
  # have it in any case...
  find . -name Makefile.am -exec sed -i -e 's:-O4:-O2 -g:' {} +
  # fix directory
  sed -i -e '/^icondir/s:icons:pixmaps:' pixmaps/Makefile.am
  sed -i 's@"icons"@"pixmaps"@' librawstudio/rs-utils.c src/rs-store.c src/gtk-interface.c
  ./autogen.sh 
}

build() {
  cd "$_svnmod"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "$_svnmod"
  make DESTDIR="${pkgdir}" install
  mkdir "${pkgdir}"/usr/lib/rawstudio
  mv "${pkgdir}"/usr/share/rawstudio/plugins "${pkgdir}"/usr/lib/rawstudio
  ln -s ../../lib/rawstudio/plugins "${pkgdir}"/usr/share/rawstudio/plugins  
}

