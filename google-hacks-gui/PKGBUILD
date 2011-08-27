# Contributor:Xemertix <arch88(at)katamail(dot)com>
 
pkgname=google-hacks-gui
_pkgname1=GoogleHacks
pkgver=1.6
pkgrel=1
pkgdesc="a compilation of carefully crafted Google searches"
arch=('i686' 'x86_64')
url="http://code.google.com/p/googlehacks/"
license=('GPL')
depends=('pango' 'bash' 'libstdc++5' 'gtk2' )
[ "$CARCH" = "x86_64" ] && depends=('lib32-pango' 'bash' 'lib32-libstdc++5' 'lib32-gtk2' ) 
source=(http://googlehacks.googlecode.com/files/${_pkgname1}${pkgver}.tar.gz
        'googlehacks'
        'googlehacks.desktop'
        'googlehacks.png')
md5sums=('94a1318dce921d5209f76375b05a0753'
         '420f9ef4c6ea53f8d2db90d31ccda479'
         '9eef625d39954054a1e96788a421ba23'
         '7b47a0639dc2f2d1648f13453acda44c')
 
build() {
  cd $srcdir
  # Program 
  install -D -m 755 GoogleHacks ${pkgdir}/opt/${pkgname}/GoogleHacks
  install -D -m 755 googlehacks $pkgdir/usr/bin/googlehacks
  [ "$CARCH" = "x86_64" ] && sed -i 's:#!/bin/sh:#!/bin/sh\nexport PANGO_RC_FILE="/opt/lib32/config/pango/pangorc":' $pkgdir/usr/bin/googlehacks
 
  # Freedesktop compatibility
  install -D -m 664 googlehacks.png ${pkgdir}/usr/share/icons/googlehacks.png
  install -D -m 664 googlehacks.desktop ${pkgdir}/usr/share/applications/googlehacks.desktop
}
