# Maintainer: X0rg

pkgname=northfield-git
pkgver=20130401
pkgrel=1
pkgdesc="A Wayland fork with a few minor changes."
arch=('any')
url="http://www.northfield.ws/"
conflicts=('libwayland-git' 'wayland' 'wayland-git')
license=('MIT')
depends=('libffi')
makedepends=('git' 'expat')
options=(!libtool)

_gitroot="https://github.com/soreau/northfield.git"
_gitname="next"

build() {
 	 msg "Connecting to GIT server...."

 	 if [[ -d "$_gitname" ]]; then
   	 	cd "$_gitname" && git pull origin
   	 	msg "The local files are updated."
 	 else
  	 	 git clone "$_gitroot" "$_gitname"
  	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf ${srcdir}/$_gitname-build
	cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build
	cd ${srcdir}/$_gitname-build
	./autogen.sh --prefix=/usr --disable-documentation
	make
}

package() {
     cd ${srcdir}/$_gitname-build
     make DESTDIR="${pkgdir}" install
}
