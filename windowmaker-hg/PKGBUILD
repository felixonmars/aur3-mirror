# Contributor: Daniel Isenmann <daniel at archlinux.org>
pkgname=windowmaker-hg
pkgver=1613
pkgrel=1
pkgdesc="An X11 window manager with a NEXTSTEP look and feel"
arch=(i686 x86_64)
depends=('libxinerama' 'libpng' 'libxpm' 'libxft' 'libtiff' 'giflib' 'perl')
makedepends=('mercurial')
license=('GPL')
source=()
url="http://www.windowmaker.info"
md5sums=()
provides=('windowmaker')
conflicts=('windowmaker')

_hgroot="http://hg.windowmaker.info/"
_hgrepo="wmaker"

build() {
  cd $startdir/src

  if [ -d $_hgrepo/.hg ]; then
    cd $_hgrepo 
    hg up -r $pkgver
  else
    hg clone -r $pkgver $_hgroot/$_hgrepo $_hgrepo
  fi

  msg "Copying files..."

  [ -z "$LINGUAS" ] && export LINGUAS="`ls po/*.po | sed 's:po/\(.*\)\.po$:\1:'`"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc \
    --with-gnustepdir=/usr/share/GNUstep --with-nlsdir=/usr/share/locale \
    --enable-xinerama 
  make || return 1
  make DESTDIR=$startdir/pkg install

}


