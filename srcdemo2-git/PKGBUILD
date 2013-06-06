# Maintainer: Etienne Perot <etienne at perot dot me>
pkgname=srcdemo2-git
pkgver=20130322
pkgrel=1
pkgdesc="Render smoother Source Engine demos (HL2/TF2/etc.) without sacrificing terabytes of disk space. https://srcdemo2.googlecode.com/"
arch=('i686' 'x86_64')
url='https://srcdemo2.googlecode.com/'
license=('BSD' 'Apache' 'LGPL' 'GPL')
depends=('bash' 'java-runtime' 'fuse' 'python2' 'xdg-utils')
makedepends=('git' 'apache-ant')

_gitroot='git://perot.me/srcdemo2'
_gitname='srcdemo2'

build() {
	msg 'Connecting to Git server....'
	rm -rf "$srcdir/$_gitname"
	if pwd | grep -q 'srcdemo2/package/linux/buildscripts/arch'; then
		# Package is being built from a clone of the repo itself
		# so just clone from there instead of downloading it all again
		git clone --recursive "file://$(pwd)/../../../../.." "$srcdir/$_gitname"
	else
		git clone --recursive "$_gitroot" "$srcdir/$_gitname"
	fi
	cd "$srcdir/$_gitname"
	msg 'Starting build...'
	ant package
}

package() {
	cd "$srcdir/$_gitname"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd build/jar
	mkdir -p "$pkgdir/opt/$_gitname" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
	cp -ar * "$pkgdir/opt/$_gitname/"
	cd "$pkgdir"
	for i in "opt/$_gitname/bin/"*; do
		ln -s "/$i" "$pkgdir/usr/bin/$(basename "$i")"
	done
	for i in "opt/$_gitname/desktopfiles/"*; do
		ln -s "/$i" "$pkgdir/usr/share/applications/$(basename "$i")"
	done
}
