#Maintainer: Lothar_m <lothar_m at riseup dot net>

pkgname='ducklauncher'
_gitname='launcher'
pkgver=20140710
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/the-duck/launcher"
depends=('python2-pyside' 'python2-xlib' 'pygtk' 'python2-wnck' 'python2-cssutils' 'hicolor-icon-theme' 'python2-simplejson' 'python2-xdg')
makedepends=('git')
license=('GPL2')
pkgdesc="Duck Launcher Application Laucher by Mark Spurgeon <markspurgeon96@hotmail.com>"
provides=(ducklauncher)
conflicts=(ducklauncher)
install=ducklauncher.install
source=("git://github.com/the-duck/launcher.git"
	"duck-launcher.desktop"
	"ducklauncher.install"	)
md5sums=('SKIP'
         '95f61db7e9523f315f5898fe6f1eec10'
         '8ef1b9009b417ddea9614ac2b32e7f8b')

#pkgver() {
#	cd "$srcdir/$_gitname"
#	# Use tag of the last commit, but removing the prefix
#	git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
#}

build() {
	## Make sure python2 is used instead of python
	sed -i 's@/usr/bin/python@/usr/bin/python2.7@' "$srcdir/$_gitname/duck-launcher"
	find "$srcdir/$_gitname" -type f -name "*.py" -exec sed -i 's@/usr/bin/python@/usr/bin/python2.7@' {} \;
	find "$srcdir/$_gitname/duck_launcher" -type f -name "*.pyc" -exec rm {} \;

	## Patch Window.py to include from PIL import Image instead of just import Image (which is broken in Arch)
	sed -i 's@import Image@from PIL import Image@' "$srcdir/$_gitname/duck_launcher/Window.py"
}


package() {
	## Install executables
	mkdir -p "$pkgdir/usr/lib/python2.7"
	mkdir -p "$pkgdir/usr/bin"
	cp -dr --no-preserve=ownership "$srcdir/$_gitname/duck_launcher" "$pkgdir/usr/lib/python2.7/duck_launcher"
	cp --no-preserve=ownership "$srcdir/$_gitname/duck-launcher" "$pkgdir/usr/bin/"

	## Install icons
	mkdir -p "$pkgdir/usr/share/duck-launcher"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"
	cp -dr --no-preserve=ownership "$srcdir/$_gitname/icons" "$pkgdir/usr/share/duck-launcher/"
	cp --no-preserve=ownership "$srcdir/$_gitname/duck-launcher.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	
	## Install Desktop File
	mkdir -p "$pkgdir/usr/share/applications"
	cp -dr --no-preserve=ownership "$srcdir/duck-launcher.desktop" "$pkgdir/usr/share/applications"
}
