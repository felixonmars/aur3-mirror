pkgname=cirnosay-git
pkgver=20120430
pkgrel=1
pkgdesc="Baka for terminal"
arch=('i686' 'x86_64')
url="https://github.com/yuzurufag/cirnosay"
license=('GPL3')
depends=('imlib2')
optdepends=()
makedepends=('gcc>=4.7' 'make' 'git')
conflicts=()
provides=()
replaces=()
source=('arch.patch')
md5sums=('7a7c086820a9ebbd7b15d51caf588e56')
     
_gitname=cirnosay
_gitroot=git://github.com/yuzurufag/cirnosay.git
     
     
build() {
	cd ${srcdir}
	msg "Connecting to GIT server...."

	if [ -d ${_gitname} ] ; then
		cd ${_gitname} && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot} ${_gitname}
	fi

	msg "GIT checkout done or server timeout"
 	msg "Starting make..."
	
	rm -rf "$srcdir/$_gitname-build"
	cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir"
	patch -Np0 -i "arch.patch"
	cd "$srcdir/$_gitname-build"
	make
}


package() {
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/cirnosay"
	cp "$srcdir/$_gitname-build/src/cirnosay" "$pkgdir/usr/bin"
	cp "$srcdir/$_gitname-build/pal.png" "$pkgdir/usr/share/cirnosay"
	cp -r "$srcdir/$_gitname-build/pictures" "$pkgdir/usr/share/cirnosay"
}
