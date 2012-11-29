## Maintainer: Abelardo Ricart <aricart@gmail.com>

pkgname=paintown-svn
pkgver=7603
pkgrel=1
pkgdesc="Open source fighting game in the same genre as Streets of Rage and Teenage Mutant Ninja Turtles"
arch=('i686' 'x86_64')
url="http://paintown.sourceforge.net/"
license=('GPL')
depends=('python2' 'freetype2' 'sdl' 'libpng' 'mpg123' 'libogg' 'libvorbis')
makedepends=('cmake' 'scons')
provides=('paintown')
conflicts=('paintown')
source=(paintown.png)
md5sums=(ed547f1377212ea079cf9b0a1ad2d587)

_svntrunk="https://paintown.svn.sourceforge.net/svnroot/paintown/trunk"
_svnmod="paintown"

build() {
	cd ${srcdir}

	msg "Getting sources..."
	if [ -d ${_svnmod}/.svn ]; then
		cd ${_svnmod} && svn up -r ${pkgver}
	else
		svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
		cd ${_svnmod}
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."
	
	# fix python2 header
	for file in $(find . -name '*.py' -print); do
		sed -i "s#/usr/bin/python#/usr/bin/env python2#" $file
	done
	
	make || return 1
}

package() {
	cd ${srcdir}/${_svnmod}
	mkdir -p $pkgdir/usr/{bin,share/{paintown,pixmaps,applications,licenses/paintown}}
	sh install.sh -d $pkgdir/usr/share/paintown -b $pkgdir/usr/bin
	# correct the gnerated file to remove the wrong path (because $pkgdir/usr/bin is written in the file)
	sed -i "s#$pkgdir##g" $pkgdir/usr/bin/paintown
	install -m644 $srcdir/paintown/misc/paintown.desktop $pkgdir/usr/share/applications/paintown.desktop
	install -m644 $srcdir/paintown.png $pkgdir/usr/share/pixmaps/paintown.png
	install -m644 LICENSE $pkgdir/usr/share/licenses/paintown/LICENSE
	install -m644 LEGAL $pkgdir/usr/share/licenses/paintown/LEGAL
}
