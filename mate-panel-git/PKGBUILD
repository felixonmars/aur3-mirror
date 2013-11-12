# Maintainer: Perberos <perberos@gmail.com>
pkgname=mate-panel-git
pkgver=0.r195.1b401ff
pkgrel=1
pkgdesc="The MATE Panel"
arch=('i686' 'x86_64')
url="http://github.com/mate-desktop/mate-panel"
license=('GPL')
depends=('libwnck' 'mate-conf-git' 'mate-menus' 'mate-desktop-git' 'librsvg'
         'hicolor-icon-theme' 'libcanberra' 'libmatecomponentui'
         'libmateweather') # 'evolution-data-server'
makedepends=('git' 'mate-doc-utils-git' 'pkgconfig' 'intltool' 'networkmanager')
options=('!emptydirs' '!libtool')
install=mate-panel.install
source=("git+${url}.git"
				patch_wnck_versioning_check.patch)
sha512sums=('SKIP'
            '51342d97182054a3d0ed6ce093f123522d4437ffb844e04fa57332176b8474f6b442992bc355e3a0aef3f7402b74e88f2a7b0209cf0d1bacb987d1a0f81ac63a')
groups=('mate')
conflicts=('mate-panel')
provides=('mate-panel')
_gitname=mate-panel

pkgver() {
  cd "$srcdir/$_gitname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"
	patch -p0 < $srcdir/patch_wnck_versioning_check.patch
    PYTHON=/usr/bin/python2 ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-static \
        --libexecdir=/usr/lib/mate-panel \
        --disable-scrollkeeper \
        --enable-introspection \
        --enable-matecomponent \
			 	--disable-maintainer-mode \
				--disable-maintainer-flags || return 1
    make || return 1
}

package() {
	cd "$srcdir/$_gitname"

    make MATECONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1

    install -m755 -d "${pkgdir}/usr/share/mateconf/schemas"
    mateconf-merge-schema "${pkgdir}/usr/share/mateconf/schemas/${pkgname}.schemas" --domain ${pkgname} ${pkgdir}/etc/mateconf/schemas/*.schemas || return 1
    rm -f ${pkgdir}/etc/mateconf/schemas/*.schemas
}
# vim:set ts=2 sw=2 bs=2:
