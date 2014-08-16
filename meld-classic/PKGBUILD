# Maintainer: Rouven Rastetter rouven.rastetter@firaweb.de
# Contributor: 謝致邦<Yeking@Red54.com>

pkgname=meld-classic
_pkgname=meld
pkgver=1.8.6
pkgrel=1
pkgdesc='Visual diff and merge tool'
url='http://meldmerge.org/'
license=('GPL')
arch=('any')
makedepends=('intltool' 'gnome-doc-utils')
depends=('pygtk' 'hicolor-icon-theme' 'desktop-file-utils')
optdepends=('pygtksourceview2: syntax highlighting'
            'python2-dbus: open a new tab in an already running instance'
            'python2-gconf: gnome integration')
provides=('meld')
conflicts=('meld')
replaces=('meld')
source=("http://ftp.gnome.org/pub/GNOME/sources/meld/1.8/meld-1.8.6.tar.xz")
sha1sums=('33e23f2e56b27f2ac5cd21032c7eefe9dd469480')

install=install
options=('!emptydirs')

prepare() {
	cd "${_pkgname}-${pkgver}"
	sed -i 's/update-/#update-/' Makefile
	sed -i 's/env python/env python2/' bin/meld
}

build() {
	cd "${_pkgname}-${pkgver}"
	make PYTHON=/usr/bin/python2 prefix=/usr
}

package() {
	cd "${_pkgname}-${pkgver}"
	make PYTHON=/usr/bin/python2 prefix=/usr DESTDIR="${pkgdir}" install
}
