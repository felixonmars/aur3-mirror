# Contributor: Lawrence Lee <valheru@facticius.net>
pkgname=kdeartwork4-svn
true && pkgname=('kdeartwork4-aurorae-svn' 'kdeartwork4-colorschemes-svn' 'kdeartwork4-desktopthemes-svn' 'kdeartwork4-emoticons-svn'
		 'kdeartwork4-iconthemes-svn' 'kdeartwork4-kscreensaver-svn' 'kdeartwork4-sounds-svn' 'kdeartwork4-styles-svn'
		 'kdeartwork4-wallpapers-svn' 'kdeartwork4-weatherwallpapers-svn')
pkgver=1241269
pkgrel=1
pkgdesc="Additional artwork for KDE4"
arch=('i686' 'x86_64')
url="http://www.kde.org/"
license=('GPL')
makedepends=('subversion' 'pkgconfig' 'cmake' 'automoc4' 'xscreensaver' 'eigen' 'kdebase4-workspace-git' 'libkexiv2-git')
conflicts=('kdeartwork')
groups=('kde4-git' 'kdeartwork4-svn')

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/KDE/kdeartwork
_svnmod=kdeartwork

build() {
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/build
  fi 

  mkdir ${srcdir}/build
  cd ${srcdir}/build
  cmake $startdir/src/$_svnmod -DCMAKE_BUILD_TYPE=debugfull \
		-DCMAKE_SKIP_RPATH=ON \
		-DCMAKE_INSTALL_PREFIX=/usr
  make
}

package_kdeartwork4-aurorae-svn() {
        pkgdesc='An Aurorae theme based on the Oxygen plasma theme'
	conflicts=('kdeartwork-aurorae')
        cd $srcdir/build/aurorae
        make DESTDIR=$pkgdir install
}

package_kdeartwork4-colorschemes-svn() {
        pkgdesc='KDE color schemes'
	conflicts=('kdeartwork-colorschemes')
        cd $srcdir/build/ColorSchemes
        make DESTDIR=$pkgdir install
}

package_kdeartwork4-desktopthemes-svn() {
        pkgdesc='KDE desktop themes'
	conflicts=('kdeartwork-desktopthemes')
        cd $srcdir/build/desktopthemes
        make DESTDIR=$pkgdir install
}

package_kdeartwork4-emoticons-svn() {
        pkgdesc='KDE emoticons'
	conflicts=('kdeartwork-emoticons')
        cd $srcdir/build/emoticons
        make DESTDIR=$pkgdir install
}

package_kdeartwork4-iconthemes-svn() {
        pkgdesc='KDE icon themes'
	conflicts=('kdeartwork-iconthemes')
        cd $srcdir/build/IconThemes
        make DESTDIR=$pkgdir install
}

package_kdeartwork4-kscreensaver-svn() {
        pkgdesc='KDE screensaver'
        depends=('kdebase4-workspace-git' 'libkexiv2')
	conflicts=('kdeartwork-kscreensaver')
        cd $srcdir/build/kscreensaver
        make DESTDIR=$pkgdir install
}
 
package_kdeartwork4-sounds-svn() {
        pkgdesc='KDE sounds'
	conflicts=('kdeartwork-sounds')
        cd $srcdir/build/sounds
        make DESTDIR=$pkgdir install
}
package_kdeartwork4-styles-svn() {
        pkgdesc='KDE styles'
        depends=('kdebase4-workspace-git')
	conflicts=('kdeartwork-styles')
        cd $srcdir/build/styles
        make DESTDIR=$pkgdir install
        cd $srcdir/build/kwin-styles
        make DESTDIR=$pkgdir install
}

package_kdeartwork4-wallpapers-svn() {
        pkgdesc='KDE wallpapers'
	conflicts=('kdeartwork-wallpapers')
        cd $srcdir/build/wallpapers
        make DESTDIR=$pkgdir install
        cd $srcdir/build/HighResolutionWallpapers
        make DESTDIR=$pkgdir install
}
 
package_kdeartwork4-weatherwallpapers-svn() {
        pkgdesc='KDE weather wallpapers'
	conflicts=('kdeartwork-weatherwallpapers')
        cd $srcdir/build/WeatherWallpapers
        make DESTDIR=$pkgdir install
}

url="http://www.kde.org/"
pkgdesc="Additional artwork for KDE4"