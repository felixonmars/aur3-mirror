# Contributor: industrie13 <industrie13@post.com>

if [ $(uname -m) = "x86_64" ] ; then
	_arch="x86_64"
else
	_arch="x86"
fi

_branch="trunk"
_major="6.0.0"
_state="beta3"
_separator1="_" #if $_state is set (eg. alpha1 or beta2), $_separator1 must be set to "_", else it must *not* be set.
_separator2="-" #if $_state is set (eg. alpha1 or beta2), $_separator2 must be set to "-", else it must *not* be set.
_minor=5715
_year=2010
_month=08
_day=09
_rlsnbr=00

pkgname="komodoedit-beta"
pkgver="${_major}_${_state}${_separator1}${_minor}"
pkgrel=1
pkgdesc="Open-Source version of ActiveState Komodo IDE - Based on XUL"
arch=(i686 x86_64)
url="http://www.openkomodo.com/"
license=('MPL')
depends=('python')
conflicts=('komodoedit' 'komodoedit-nightly')

source=("http://downloads.activestate.com/Komodo/releases/6.0.0b3/Komodo-Edit-${_major}-${_state}${_separator2}${_minor}-linux-libcpp6-${_arch}.tar.gz")

if [ $_arch = "x86_64" ] ; then
	md5sums=('016148dc3f1e3c761a6383330d00d69f')
else
	md5sums=('4a052361b7c301cf99a0fcc0860f1a61')
fi

build() {
	cd ${startdir}/src/Komodo-Edit-${_major}-${_state}${_separator2}${_minor}-linux-libcpp6-${_arch}
	./install.sh -s -I ${startdir}/pkg/opt/${pkgname}
	grep -v ${startdir} ${startdir}/pkg/opt/${pkgname}/share/desktop/Komodo-Edit-6.desktop > ${startdir}/${pkgname}.desktop
	echo "Exec=/opt/${pkgname}/bin/komodo %F" >> ${startdir}/${pkgname}.desktop
	echo "Icon=/opt/${pkgname}/share/icons/komodo16.png" >> ${startdir}/${pkgname}.desktop
	install -D -m 644 ${startdir}/${pkgname}.desktop ${startdir}/pkg/usr/share/applications/${pkgname}.desktop
}
