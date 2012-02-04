# Contributor: Franz Burgmann <f dot burgmann at gmail dot com>

pkgname=vdr-dvd-cvs
pkgver=20090113
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="VDR-Plugin to play DVDs."
url="http://sourceforge.net/projects/dvdplugin"
license=('GPL')
depends=('vdr' 'libdvdcss' 'libdvdnav' 'a52dec' 'libdvdread')
makedepends=('cvs')
provides=('vdr-dvd')
source=()
backup=()
options=()
md5sums=()
_cvsroot=":pserver:anonymous@dvdplugin.cvs.sourceforge.net:/cvsroot/dvdplugin"
_cvsmod="dvd"

build() {
  cd $srcdir
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -r $srcdir/$_cvsmod-build
  cp -r ../$_cvsmod ../$_cvsmod-build
  cd ../$_cvsmod-build || return 1
  
  
  sed -i -e 's|fprintf(stderr, "arg: %s\n", optarg);|// fprintf(stderr, "arg: %s\n", optarg);|' \
    dvd.c || return 1
  
  make VDRDIR="/usr/src/VDR/" LIBDIR="." \
    LOCALEDIR="$pkgdir/usr/share/locale" all || return 1
  
  mkdir -p $pkgdir/usr/lib/vdr || return 1
  cp libvdr-*.so.* $pkgdir/usr/lib/vdr/ || return 1
}

