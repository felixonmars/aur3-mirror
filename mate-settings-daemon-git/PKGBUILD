# Maintainer: Alex Brinister <alex_brinister@yahoo.com>
pkgname=mate-settings-daemon-git
pkgver=0.r162.07e60d4
pkgrel=1
pkgdesc="The MATE Settings daemon"
arch=('i686' 'x86_64')
license=('GPL')
depends=('mate-common-git' 'libmatekbd-git' 'mate-desktop-git' 'libnotify' 'gstreamer0.10-base'
         'hicolor-icon-theme')
makedepends=('intltool' 'pkgconfig')
options=('!libtool')
url="https://github.com/mate-desktop/mate-settings-daemon"
install=mate-settings-daemon.install
provides=('mate-settings-daemon')
conflicts=('mate-settings-daemon')
groups=('mate')
source=("git+${url}.git")
sha512sums=('SKIP')
_gitname=mate-settings-daemon

pkgver() {
  cd "$srcdir/${_gitname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}"
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/mate-settings-daemon \
    --disable-static \
    --disable-pulse \
    --disable-schemas-install \
    --enable-polkit || return 1
  make || return 1
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="${pkgdir}" MATECONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 \
		install || return 1
  install -d -m755 "${pkgdir}/usr/share/mateconf/schemas"
  mateconf-merge-schema \
		"${pkgdir}/usr/share/mateconf/schemas/${pkgname}.schemas" \
		--domain ${pkgname} ${pkgdir}/etc/mateconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/mateconf/schemas/*.schemas
}
# vim:set ts=2 sw=2 bs=2:
