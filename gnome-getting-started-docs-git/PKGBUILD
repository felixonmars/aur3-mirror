# Maintainer: Yosef Or Boczko <yosefor3@walla.com>

_pkgname=gnome-getting-started-docs
pkgname=$_pkgname-git
pkgver=20130320
pkgrel=1
pkgdesc="Help a new user get started in GNOME"
arch=(any)
depends=('python')
makedepends=('gnome-common' 'automake' 'itstool' 'libxml2' 'yelp-tools')
url="http://www.gnome.org"
license=('GPL')
groups=('gnome')
conflicts=('gnome-getting-started-docs')
replaces=('gnome-getting-started-docs')
provides=('gnome-getting-started-docs' 'gnome-getting-started-docs=3.7.92')

_gitroot=http://git.gnome.org/browse/gnome-getting-started-docs
_gitname=gnome-getting-started-docs

build() {
	cd $srcdir
	msg "Connecting to GIT server...."

	if [ -d $srcdir/$_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	./autogen.sh --prefix=/usr
	make
}

package() {
    cd "$srcdir/$_gitname-build"
    make DESTDIR="$pkgdir" install
    rm -rf "$srcdir/$_gitname-build"
}
