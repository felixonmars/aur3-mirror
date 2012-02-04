# Maintainer: Rich and Haggy - archlinux-xbmc at googlegroups.com
#
# This is a skin for the PM3 theme (not HD)
# We've adopted the package and now we're making it work.
#
pkgname=xbmc-theme-pm3-osx
pkgver=1.0
pkgrel=2
pkgdesc="OSX Theme for Project Mayhem III Skin on XBMC"
url="http://xbmc.org/forum/showthread.php?t=33100"
arch=('i686' 'x86_64')
depends=( 'xbmc' )
makedepends=( 'unzip' )
groups=( 'multimedia' )
source=( http://idisk.mac.com/choccyhobnob-Public/OSXPMIII.zip )
license=('GPL')
md5sums=('235fd78321bb7751b8a542f0a6a530f8')

build() {
	cd ${startdir}/src
	install -v -D -m644 ${startdir}/src/OSX.xpr		\
		${startdir}/pkg/usr/share/xbmc/skin/"Project Mayhem III"/media/OSX.xpr

	install -v -D -m644 ${startdir}/src/OSX.xml		\
		${startdir}/pkg/usr/share/xbmc/skin/"Project Mayhem III"/colors/OSX.xml
}

