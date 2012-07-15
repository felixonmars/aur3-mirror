# Contributor: Det <nimetonmaili at gmail a-dot com>
# Contributor: Lee Jackson <tomoe AT lbjackson DOTCOM>
# Based on [extra]'s wine

pkgname=bin32-wine-snapshot
pkgver=LATEST
_pkgver=`curl -s http://download.opensuse.org/repositories/Emulators:/Wine/openSUSE_Factory/i586/ | grep -o wine-snapshot.*rpm | head -n1 | cut -d - -f3`
pkgrel=1
pkgdesc="A compatibility layer for running Windows programs (openSUSE i586 Daily build)"
url="http://en.opensuse.org/Wine"
install=$pkgname.install
arch=('x86_64')
license=('LGPL')
depends=('lib32-fontconfig' 'lib32-mesa' 'lib32-libxcursor' 'lib32-libxrandr' 'lib32-libxdamage' 'lib32-libxi' 'lib32-gettext' 'lib32-gnutls' 'desktop-file-utils')
makedepends=('lynx')
optdepends=('lib32-giflib' 'lib32-libpng' 'lib32-libldap' 'lib32-lcms' 'lib32-libxml2' 'lib32-mpg123' 'lib32-openal' 'lib32-v4l-utils' 'lib32-libpulse' 'lib32-alsa-plugins' 'lib32-alsa-lib' 'wine_gecko')
provides=("wine=$pkgver" 'winetricks')
conflicts=('wine' 'winetricks' 'winetricks-svn' 'wine-mono')

FORCE_VER="$_pkgver"

# -- Reduce compression time -- 
# Delete the next line if you want a regular .pkg.tar.xz package instead
# PKGEXT='.pkg.tar'

package() {

  for i in wine-snapshot-[0-9] wine-snapshot-devel-[0-9]; do
    wget `lynx -dump http://download.opensuse.org/repositories/Emulators:/Wine/openSUSE_Factory/i586/ | grep -o http.*$i.*rpm | tail -1` -O - | bsdtar -xf -
  done

  wget `lynx -dump http://download.opensuse.org/repositories/Emulators:/Wine/openSUSE_Factory/noarch/ | grep -o http.*wine-mono.*rpm | tail -1` -O - | bsdtar -xf -

  msg2 "Cleaning up unnecessary desktop entries"
  rm -f usr/share/applications/wine-*

  msg2 "Re-arranging docs"
  mv usr/share/doc/{packages/wine-snapshot,wine}
  rm -rf usr/share/doc/packages

  msg2 "Moving everything in place"
  mv usr/ "$pkgdir/"
}
