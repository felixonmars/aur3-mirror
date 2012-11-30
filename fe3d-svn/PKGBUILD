pkgname=fe3d-svn
pkgver=0.11
pkgrel=2
pkgdesc="fe3d is a OpenGL based 3D visualization tool for network security information and frontend for nmap"
arch=('i686' 'x86_64')
license=('GPLv2')
depends=('nmap' 'wxgtk' 'xerces-c')
url="http://svn.icapsid.net/fe3d/fe3d/branches/fe3d_0.11/"
_svnname="fe3d"
build(){
	cd "$srcdir"
	msg2 "Connecting to SVN server..."
	if [[ -d "$_svnname" ]]; then
		cd "$_svnname" && svn update
		msg2 "Local files updated"
	else
		svn co "$url" "$_svnname"
	fi
	msg2 "SVN checkout done or server timeout"
	msg2 "Removing old build dir"
	rm -rf "$srcdir/$_svnname-build"
	msg2 "Coping into build dir"
	svn export "$srcdir/$_svnname" "$srcdir/$_svnname-build"
	msg2 "Moving into build dir"
	cd "$srcdir/$_svnname-build"
	if [[ -d "build" ]]; then
		rm -rf build
	fi
	msg2 "Compiling"
	mkdir build && cd build
	../configure
	make
}

package() {
	cd "$srcdir/$_svnname-build/build"
	make DESTDIR="$pkgdir" install
}

