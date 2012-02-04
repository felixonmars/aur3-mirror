# Contributor: Prurigro
# Maintainer: Prurigro

pkgname=iphone-fixpng-svn
pkgver=20091017
pkgrel=1
pkgdesc="This 'fixes' iphone native png files, allowing them to be viewed and edited on a computer"
arch=('i686' 'x86_64')
url="http://modmyi.com/wiki/index.php/Iphone_PNG_images"
license=('GPL')
depends=('libpng' 'zlib')
makedepends=('svn')
source=(Makefile)
md5sums=('7d32c932ac3e64a836d3068fc7eb818d')

_svn="svn://svn.poop.nl/pub/iphone-fixpng"

build() {
	if [ -d "$srcdir"/iphone-fixpng ]; then
		echo "Removing old source files" || return 1
		rm -rf "$srcdir"/iphone-fixpng || return 1
	fi || return 1

	echo "Connecting to poop.nl...." || return 1
	pushd "$srcdir" || return 1
		svn co $_svn || return 1
	popd || return 1
	
	echo "Updating Makefile" || return 1
	cat Makefile > "$srcdir"/iphone-fixpng/Makefile || return 1

	echo "Compiling" || return 1
	pushd "$srcdir"/iphone-fixpng || return 1
		make || return 1
		install -d "$pkgdir"/usr/bin || return 1
		install -D -m755 fixpng "$pkgdir"/usr/bin || return 1
		install -D -m755 flipchannels "$pkgdir"/usr/bin || return 1
	popd || return 1
}

