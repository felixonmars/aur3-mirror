# Maintainer: Thomas Krug <phragment@lavabit.com>

pkgname=fprintd-git
pkgver=20111113
pkgrel=3
pkgdesc="fprintd is a D-Bus daemon that offers libfprint functionality over the D-Bus interprocess communication bus."
arch=(i686 x86_64)
url="http://www.freedesktop.org/wiki/Software/fprint/fprintd"
license=(GPL)
depends=(libfprint-git dbus-glib polkit dbus-glib)
makedepends=(intltool gtk-doc git)
groups=(fprint-git)
provides=(fprint)
options=(!libtool)

_gitroot="git://anongit.freedesktop.org/libfprint/fprintd"
_gitname="fprintd"

build() {
	cd ${srcdir}
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd ${srcdir}/$_gitname-build


	./autogen.sh --prefix=/usr \
               --sysconfdir=/etc \
               --libexecdir=/usr/lib \
               --disable-static

	make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir" pammoddir="/lib/security" install
}

# vim:set ts=2 sw=2 et:
