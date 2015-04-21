# Maintainer: Max Liebkies <mail@maxliebkies.de>
pkgname="gnome-calendar-git"
pkgver=3.16.1_e43aa8a
pkgrel=1
#epoch=
pkgdesc=""
arch=('i686' 'x86_64')
url="https://git.gnome.org/browse/gnome-calendar/"
license=('GPL')
groups=()
depends=('libical>=0.43' 'clutter-gtk>=1.2' 'evolution-data-server>=3.5.3')
makedepends=('intltool' 'git' 'gnome-common')
provides=('gnome-calendar')
options=('strip')
install=gnome-calendar-git.install
#changelog=
source=("$pkgname"::'git://git.gnome.org/gnome-calendar#branch=master'
        'gnome-calendar-git.install'
        'gnome-calendar-git.desktop'
)
md5sums=('SKIP'
         '9d0176e81e824eb2b15a3c1089dcb0bf'
         '0e72a32f62d4db34223def7e4beb2dbc'
)

pkgver() {
	cd "$srcdir/$pkgname"
	# Version in configure.ac
	local ver=$(grep '^AC_INIT' configure.ac | cut -d',' -f2)
	local gitrev=$(git rev-parse --short HEAD)
	printf "%s_%s" "${ver:1:-1}" "$gitrev"
}

prepare() {
	cd "$srcdir/$pkgname"
	NOCONFIGURE="yes" ./autogen.sh
}

build() {
	cd "$srcdir/$pkgname"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install

	cd "$startdir"

	install -Dm644 ${pkgname}.desktop \
		"${pkgdir}/usr/share/applications/${pkgname}.desktop"
}


