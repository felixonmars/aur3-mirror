# Maintainer: Piotr Gorski
pkgname=mate-session-manager-1.7
pkgver=1.7.1
pkgrel=1
pkgdesc="The MATE Session Handler"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('upower' 'gtk2' 'hicolor-icon-theme' 'libxtst' 'mate-polkit') #  'startup-notification'
makedepends=('pkgconfig' 'intltool' 'xtrans')
options=('!emptydirs' '!libtool')
install=mate-session-manager.install
url="http://matsusoft.com.ar/projects/mate/"
conflicts=(mate-session-manager)
replaces=(mate-session-manager)
provides=(mate-session-manager)
groups=('mate')
source=()
sha256sums=()

_gitroot=git://github.com/mate-desktop/mate-session-manager.git
_gitname=mate-session-manager

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [[ -d "$_gitname" ]]; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone "$_gitroot" "$_gitname"
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting build..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
	    --libexecdir=/usr/lib || return 1

    make || return 1
}

package() {
	cd "$srcdir/$_gitname-build"

    make DESTDIR="${pkgdir}" MATECONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 install || return 1

    install -d -m755 "${pkgdir}/usr/share/mateconf/schemas"
   # mateconf-merge-schema "${pkgdir}/usr/share/mateconf/schemas/${pkgname}.schemas" --domain ${pkgname} ${pkgdir}/etc/mateconf/schemas/*.schemas || return 1

    # --disable-schemas-compile <- check if work <- nop
   # rm -f ${pkgdir}/etc/mateconf/schemas/*.schemas
}
