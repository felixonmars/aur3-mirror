# $Id: PKGBUILD 128602 2011-06-24 13:59:34Z ibiru $
# Contributor: Gary van der Merwe <garyvdm@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=python-dbus-git
pkgver=20121206
pkgrel=1
pkgdesc="Python3 bindings for DBUS"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="http://www.freedesktop.org/wiki/Software/DBusBindings"
depends=('dbus-core' 'python' 'dbus-glib')
makedepends=('git' 'python-docutils')
#optdepends=('dbus-glib: glib mainloop support')
provides=('python-dbus')
conflicts=('python-dbus')
options=('!libtool')
source=()
md5sums=()

_gitroot=git://anongit.freedesktop.org/dbus/dbus-python
_gitname=dbus-python

build() {
	cd "${srcdir}"
	msg "Connecting to GIT server...."
	if [ -d ${_gitname} ] ; then
		cd ${_gitname} && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot} ${_gitname}
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting build..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	./autogen.sh --prefix=/usr --docdir=/usr/share/doc/python-dbus
	make
}

package() {
	cd "$srcdir/$_gitname-build"
	make DESTDIR="$pkgdir/" install
	rm "$pkgdir/usr/lib/pkgconfig/" -r
	rm "$pkgdir/usr/include/" -r
}

