# Maintainer: Samuele Disegna <smldis at gmail dot com>

pkgname=('opensync-plugins-svn')
pkgbase="opensync-plugins-svn"
pkgver=6100
pkgrel=1
pkgdesc="Development version of the OpenSync synchronisation framework plugins"
arch=('i686' 'x86_64')
url="http://www.opensync.org"
license=('LGPL2')
depends=('libopensync-svn')
makedepends=('subversion' 'cmake')
conflicts=('libopensync-plugins' 'opensync-plugins')
replaces=('libopensync-plugins-svn')
source=('splittedPKGBUILD')
md5sums=('1093ae51824c419523dd4abea167b51d')

plugins_list="opensync-plugins-evolution2-svn opensync-plugins-file-svn opensync-plugins-syncml-svn"


build() {

  [ -d $startdir/build ] && rm -fr $startdir/build
  mkdir $startdir/build
  cp $srcdir/splittedPKGBUILD $startdir/build/PKGBUILD
  cd $startdir/build
  
  makepkg --pkg "${plugins_list}"
  
  return 0
}

package() {
  msg "${plugins_list}"
  cd $startdir/build/pkg
 
  for current_plugin in ${plugins_list}; do
      if [ -e ${current_plugin} ]; then
	cp -r --preserve=all ${current_plugin}/* $pkgdir
      fi
  done

}
