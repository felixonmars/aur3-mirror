pkgname=feh-trapd00r-git
pkgver=20101124
pkgrel=1
pkgdesc='Fast, lightweight image viewer which uses imlib2'
arch=('i686' 'x86_64')
url='https://github.com/trapd00r/feh'
license=('MIT')
depends=('libxinerama' 'giblib' 'perl')
makedepends=('libxt')
provides=('feh')
conflicts=('feh')

_gitroot="https://github.com/trapd00r/feh.git"
_gitname="feh"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."
	
	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi
	
	msg "GIT checkout done or server timeout"
	msg "Starting make..."
	
	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"
	
	sed -i -e 's:/usr/local:/usr:g' config.mk
	make
}

package(){
	cd "$srcdir/$_gitname-build"
	
	make DESTDIR="${pkgdir}" install
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
