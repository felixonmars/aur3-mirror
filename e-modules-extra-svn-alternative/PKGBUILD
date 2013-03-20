# Maintainer: Cravix < dr dot neemous at gmail dot org >
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=e-modules-extra-svn-alternative
pkgver=79887
pkgrel=4
pkgdesc="Interactive version of e-modules-extra-svn, allow you maually select modules (need to restart build after selection)"
arch=('i686' 'x86_64')
groups=('e17-extra-svn')
url="http://www.enlightenment.org"
license=('GPLv2' 'LGPLv2' 'MIT')
depends=('enlightenment17' 'efreet' 'e_dbus')
makedepends=('subversion')
conflicts=('e-modules-extra')
provides=('e-modules-extra')
options=('!libtool')
source=('REST' 'chscr')
md5sums=('cde7590827d74e401053843a0205cf33'
         'ed909b844c072c2c970431e2f02f5f7c')

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/E-MODULES-EXTRA"
_svnmod="E-MODULES-EXTRA"

defset=(
    alarm deskshow exebuf mail news places winselector forecasts engage empris eenvader.fractal photo slideshow eektool execwatch everything-mpris everything-pidgin everything-tracker everything-websearch
   )

build() {

  cd "$startdir"

  # Prepare for restore...
  ./chscr || exit 1

  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #Adjust
  [[ -n $(pacman -Q e_dbus 2>/dev/null) ]] && {
		for i in	everything-mpris everything-pidgin everything-shotgun everything-tracker everything-websearch empris; do
		  sed -i '1i\#include "E_DBus.h"' $i/src/e_mod_main.c
    done
    sed -i '1i\#include "E_DBus.h"' everything-shotgun/src/evry_plug_msg.c
	}

  for i in ${defset[@]}; do
    cd $i
    ./autogen.sh --prefix=/usr
    make
    cd ..
  done
} 

package() {
  cd $srcdir/$_svnmod-build

  for i in ${defset[@]}; do
    cd $i

    make DESTDIR=$pkgdir install

    # install license files
    if [ -e $srcdir/$_svnmod-build/$i/COPYING ]; then
      install -Dm644 $srcdir/$_svnmod-build/$i/COPYING \
        $pkgdir/usr/share/licenses/$pkgname/$i/COPYING
    fi
    if [ -e $srcdir/$_svnmod-build/$i/COPYING-PLAIN ]; then
      install -Dm644 $srcdir/$_svnmod-build/$i/COPYING-PLAIN \
        $pkgdir/usr/share/licenses/$pkgname/$i/COPYING-PLAIN
    fi
 
    cd ..
  done
  # Dirty tricks to restore.
  sed -i '/^#  \./s/#//' $startdir/PKGBUILD
}
