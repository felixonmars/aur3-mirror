# Maintainer: CasualSuperman <robert.wertman@gmail.com>
# Contributor: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=gtkradiant
pkgver=1.6.4
pkgrel=1
pkgdesc="Level editor for Doom 3, Nexuiz, Quake 4, Tremulous, Warsow etc..."
arch=('i686' 'x86_64')
conflicts=("gtkradiant-gamepack-q3-svn" "gtkradiant-gamepack-urt-svn" "gtkradiant-gamepack-ja")
url="http://icculus.org/gtkradiant"
license=("GPL" "BSD" "LGPL")
depends=("gtkglext" "libpng12")
source=("https://icculus.org/gtkradiant/downloads/1.6/GtkRadiant-1.6.4-Linux-$CARCH-20131213.tar.gz")

if test "$CARCH" == x86_64; then
  md5sums=('04d71ea238d3891ce1d4aa72a2dc46ee')
else
  md5sums=('22e667cc71821c6635d7b093de084d98')
fi

package() {
  mkdir -p $pkgdir/usr/share/gtkradiant/games
  mkdir -p $pkgdir/usr/bin

  cd "${srcdir}/GtkRadiant-1.6.4-Linux-$CARCH-20131213"
  cp -r * $pkgdir/usr/share/gtkradiant/

  chmod o+rwx $pkgdir/usr/share/gtkradiant/games
  chmod o+x   $pkgdir/usr/share/gtkradiant/libjpeg.so.62

  echo -e "#!/bin/bash\ncd /usr/share/gtkradiant\n./radiant.bin" > $pkgdir/usr/bin/radiant
  chmod o+rx $pkgdir/usr/bin/radiant
}
