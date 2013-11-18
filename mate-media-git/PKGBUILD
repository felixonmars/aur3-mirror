pkgname=mate-media-git
pkgver=0.r85.68915ba
pkgrel=2
pkgdesc="MATE Media Tools"
arch=(i686 x86_64)
license=('GPL')
depends=('gstreamer0.10-base-plugins' 'mate-panel' 'libnotify')
provides=('mate-media')
conflicts=('mate-media')
makedepends=('mate-doc-utils-git' 'pkgconfig' 'mate-settings-daemon-git' 'intltool' 'mate-icon-theme' 'libpulse' 'git' 'libtool')
groups=('mate-extras')
options=(!emptydirs !libtool)
url="http://github.com/mate-desktop/mate-media"
install=mate-media.install
source=("git+${url}.git")
sha512sums=('SKIP')
_gitname=mate-media

pkgver() {
  cd "$srcdir/$_gitname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"
	./autogen.sh \
		--prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib/${pkgname} \
		--localstatedir=/var --disable-static \
		--disable-schemas-install \
		--disable-scrollkeeper \
		--disable-pulseaudio \
		--enable-profiles \
		--enable-grecord \
		--enable-gstprops \
		--enable-gstmix \
	 	--disable-maintainer-flags \
		--disable-maintainer-mode || return 1

	make || return 1
}

package() {
	cd "${srcdir}/${_gitname}"
	make MATECONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1

	install -m755 -d "${pkgdir}/usr/share/mateconf/schemas"
	mateconf-merge-schema "${pkgdir}/usr/share/mateconf/schemas/${pkgname}.schemas" --domain ${pkgname} ${pkgdir}/etc/mateconf/schemas/*.schemas || return 1
	rm -f ${pkgdir}/etc/mateconf/schemas/*.schemas
}
# vim:set ts=2 sw=2 bs=2:
