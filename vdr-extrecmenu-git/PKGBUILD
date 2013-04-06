# Maintainer: David Spicer <azleifel at gmail dot com>

pkgname=vdr-extrecmenu-git
_gitname=vdr-plugin-extrecmenu
pkgver=20121221
pkgrel=1
pkgdesc="A VDR plugin that adds additional functions to the recordings menu"
arch=('i686' 'x86_64')
url="http://projects.vdr-developer.org/projects/plg-extrecmenu"
license=('GPL2')
depends=('vdr>=1.7.42' 'vdrsymbols-ttf')
makedepends=('git')
provides=('vdr-extrecmenu')
conflicts=('vdr-extrecmenu')
source=('git://projects.vdr-developer.org/vdr-plugin-extrecmenu.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
  cd "$srcdir/$_gitname"

  # VDR directory environment
  _vdrCONFDIR="/var/lib/vdr"
  _vdrINCDIR="/usr/include"
  _vdrLIBDIR="/usr/lib/vdr"
  _vdrLOCDIR="/usr/share/locale"

  # Create install directories
  install -d -m755 "$pkgdir/usr/bin"
  install -d -m755 "$pkgdir/$_vdrLIBDIR"
  install -d -m755 "$pkgdir/$_vdrLOCDIR"

  # Build and install plugin
  make LIBDIR="$pkgdir/$_vdrLIBDIR" \
       LOCALEDIR="$pkgdir/$_vdrLOCDIR" \
       VDRDIR="$_vdrINCDIR/vdr" \
       all

  # Uncomment lines below to build and install getlength/isodetect utilities
  #gcc contrib/getlength.c -o getlength
  #install -m755 getlength "$pkgdir/usr/bin/getlength"
  #gcc contrib/isodetect.c -o isodetect
  #install -m755 isodetect "$pkgdir/usr/bin/isodetect"

  # Install script
  install -m755 scripts/dvdarchive.sh $pkgdir/usr/bin/dvdarchive.sh

  # Install documents
  install -d -m755 "$pkgdir/usr/share/doc/$pkgname"
  for _file in README HISTORY; do
    install -m644 $_file "$pkgdir/usr/share/doc/$pkgname"
  done
}
