# Maintainer: Que Quotion <quequotion@mailinator.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: hbdee <hbdee.arch@gmail.com>

pkgname=gtk2-git
_gitname=gtk+
pkgver=2.24.23.10.gc9da8bd
pkgrel=1
pkgdesc="GTK+ is a multi-platform toolkit (v2) (git version)"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
license=('LGPL')
depends=('atk' 'pango' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'libxcomposite' \
	'libxdamage' 'shared-mime-info' 'libcups' 'gtk-update-icon-cache' 'python2')
makedepends=('pkg-config' 'gobject-introspection' 'gtk-doc')
provides=("gtk2=${pkgver}" "gtk2-git=${pkgver}")
conflicts=('gtk2')
replaces=('gtk2-docs')
backup=('etc/gtk-2.0/gtkrc')
options=('!libtool')
install=arch_gtk2.install
source=('git://git.gnome.org/gtk+#branch=gtk-2-24'
        'arch_xid-collision-debug.patch')
sha512sums=('SKIP'
                        '89e3223c86731a76b12d39245f1ec4cf8b4860ab1d11d74a10e5deb0db302f20b4bb5d9034da1d8aeb96369dbdeddcdd2f28943270dc501476c694562b960159')

pkgver() {
	cd "${_gitname}"
	git describe --always | sed 's/-/./g'
}

build() {

	cd "${_gitname}"

	#Apply Arch patches
	patch -p1 -i "${srcdir}/arch_xid-collision-debug.patch"
  
	CXX=/bin/false ./autogen.sh \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--with-xinput=yes \
		--enable-test-print-backend

	# https://bugzilla.gnome.org/show_bug.cgi?id=655517
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
}

package() {
  cd "${_gitname}"

  make DESTDIR="${pkgdir}" install
  sed -i "s#env python#env python2#" "${pkgdir}/usr/bin/gtk-builder-convert"
  echo 'gtk-fallback-icon-theme = "gnome"' > "${pkgdir}/etc/gtk-2.0/gtkrc"
  # Use the official gtk-update-icon-cache package
  rm -v "${pkgdir}/usr/bin/gtk-update-icon-cache"
}
