pkgname=mate-conf-git
pkgver=0.r33.b6bafb4
pkgrel=1
pkgdesc="A configuration database system"
arch=(i686 x86_64)
license=('LGPL')
depends=('mate-corba' 'libxml2' 'polkit' 'libldap' 'dbus-glib' 'gtk2')
makedepends=('pkgconfig' 'intltool' 'gtk-doc' 'gobject-introspection')
conflicts=('mate-conf')
provides=('mate-conf')
groups=('mate')
options=('!libtool')
install=mate-conf.install
url="http://github.com/mate-desktop/mate-conf"
source=("git+${url}.git"
		mateconf-merge-schema
        mateconfpkg)
sha512sums=('SKIP'
            '24f3bd8a7d3cf16cb3bf6679fd6979d5f8f66d7e7363ad12b1f27ef16ee1a43f0adb054473ed0b033296feb1bdff7dd1a769cc93d21ac5b23b74d380093fcb36'
            '508db169a9189cc5feacce6656f6b90c34acec99aa1f1d0f2685354c70efb60f6023e23cd4e0b695758e275f2390222051da50ff10541404727d8bb91997b836')
_gitname=mate-conf

pkgver() {
  cd "$srcdir/$_gitname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}"
	touch ChangeLog
  ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/MateConf \
        --localstatedir=/var \
        --disable-static \
        --enable-defaults-service \
				--enable-gsettings-backend=no || return 1
    make || return 1
}

package() {
	cd "${srcdir}/${_gitname}"

    make DESTDIR="${pkgdir}" install || return 1
    install -m755 -d "${pkgdir}/etc/mateconf/mateconf.xml.system" || return 1
    install -m755 "${srcdir}/mateconf-merge-schema" "${pkgdir}/usr/bin/" || return 1
    install -d -m755 "${pkgdir}/usr/sbin"
    install -m755 "${srcdir}/mateconfpkg" "${pkgdir}/usr/sbin/" || return 1
}
# vim:set ts=2 sw=2 bs=2:
