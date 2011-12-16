# Contributor: Rainy <rainylau(at)gmail(dot)com>
# Contributor: Lee.MaRS <leemars at gmail dot com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Maintainer: Brad Fanella <bradfanella@archlinux.us>

pkgname=ibus-3beol
_pkgname=ibus
pkgver=1.4.0
pkgrel=1
# pkgdesc='Next Generation Input Bus for Linux.'
arch=('i686' 'x86_64')
license=('LGPL')
url='http://ibus.googlecode.com'
# depends=('dbus-python>=0.84.0' 'gconf' 'dconf' 'python2' 'pygtk' 'pyxdg' 'iso-codes' 'librsvg' 'python-notify' 'hicolor-icon-theme' 'gtk3')
# optdepends=('notification-daemon')
makedepends=('intltool')
options=('!libtool')
# install=ibus.install
source=("http://ibus.googlecode.com/files/${_pkgname}-${pkgver}.tar.gz"
		00_2011.11.20.0.git23abee8.patch
		00_2011.11.29.0.issue5431086_1.patch
		00_2011.11.29.1.issue5437062_4001.patch)
md5sums=('b4f063794e89c71eb1f8cb543210da30'
         'e38c4644bd55e823222d8c9edb784af5'
         'e5d841598c765651fc104c91320b4564'
         '36ca00d507f8b1df3702ba8824a53ab1')

build() {
	cd ${_pkgname}-${pkgver}

	export PYTHON=python2

	patch -Np1 -i "${srcdir}/00_2011.11.20.0.git23abee8.patch"
	patch -Np1 -i "${srcdir}/00_2011.11.29.0.issue5431086_1.patch"
	patch -Np1 -i "${srcdir}/00_2011.11.29.1.issue5437062_4001.patch"

	./configure \
		--prefix=/usr \
		--libexecdir=/usr/lib/ibus \
		--sysconfdir=/etc \
		--with-gconf-schema-file-dir=/usr/share/gconf/schemas \
		--enable-gtk3

	# python2 fix
	for file in setup/ibus-setup.in ui/gtk/ibus-ui-gtk.in; do
		sed -i 's_exec python_exec python2_' $file
	done

	make
}

package_ibus-3beol() {
	pkgdesc='Next Generation Input Bus for Linux.'
	depends=('dbus-python>=0.84.0' 'gconf' 'dconf' 'python2' 'pygtk' 'pyxdg' 'iso-codes' 'librsvg' 'python-notify' 'hicolor-icon-theme' 'gtk3')
	provides=('ibus')
	conflicts=('ibus')
	install=ibus.install
	optdepends=('notification-daemon')
	cd ${_pkgname}-${pkgver}

	export PYTHON=python2

	make DESTDIR=${pkgdir} install

	find ${pkgdir} -type f -exec sed -i 's_exec /usr/bin/python_exec /usr/bin/python2_' {} \;
}

