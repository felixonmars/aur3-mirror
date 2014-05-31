# $Id$
# Contributor: Baurzhan Muftakhidinov <baurthefirst@gmail.com>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>

_pkgname=orage
pkgname=${_pkgname}-git
pkgver=4.10.0.r53.gb9d3268
pkgrel=1
pkgdesc="A simple calendar application with reminders for Xfce"
arch=("i686" "x86_64")
license=('GPL2')
url="http://www.xfce.org"
groups=('xfce4-git')
depends=('hicolor-icon-theme' 'xfce4-panel-git' 'libnotify')
makedepends=('git' 'intltool' 'pkgconfig' 'xfce4-dev-tools-git')
provides=("orage")
conflicts=("orage")
options=('!libtool')
install=${_pkgname}.install
source=("${_pkgname}::git://git.xfce.org/apps/$_pkgname")
md5sums=("SKIP")

pkgver() {
	cd "${_pkgname}"

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[_-+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
    
    cd "${srcdir}/${_pkgname}"
    
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib  \
    --localstatedir=/var --disable-static --enable-debug=minimum \
   --enable-maintainer-mode
  make
}

package() {
	cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
