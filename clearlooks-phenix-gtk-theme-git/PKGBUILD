# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=clearlooks-phenix-gtk-theme-git
pkgver=6.0.3.r2.g6c1b854
pkgrel=1
pkgdesc='GTK3 theme visually close to Clearlooks'
arch=('any')
url='https://github.com/jpfleury/clearlooks-phenix'
license=('GPL')
depends=('gtk-engines')
provides=('clearlooks-phenix-gtk-theme')
conflicts=('clearlooks-phenix-gtk-theme')
makedepends=('git')
source=('git://github.com/jpfleury/clearlooks-phenix')
sha256sums=('SKIP')

pkgver() {
	cd clearlooks-phenix/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

prepare() {
	cd clearlooks-phenix/

	rm -rf .git/
}

package() {
	cd clearlooks-phenix/

	for FILE in $(find doc/ -type f); do
		install -D -m0644 ${FILE} ${pkgdir}/usr/share/doc/clearlooks-phenix-gtk-theme/${FILE}
	done
	rm -rf doc/

	for FILE in $(find -type f); do
		install -D -m0644 ${FILE} ${pkgdir}/usr/share/themes/Clearlooks-Phenix/${FILE}
	done
}

