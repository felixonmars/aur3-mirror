# Maintainer: David Caruso <deibido.caruso@gmail.com>

pkgname=mediterraneannight-theme-git
pkgver=2.03.0.1.r2.gdca0b72
pkgrel=1
pkgdesc="Mediterranean Night GTK3 theme collection - git version - work in progress "
arch=('any')
url="http://gnome-look.org/content/show.php?content=156782"
license=('GPL')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
provides=('mediterraneannight-theme')
conflicts=('mediterraneannight-theme')
makedepends=('git')
source=('git+https://github.com/rbrito/pkg-mediterranean-gtk-themes.git#branch=master')
pkgver() {
	cd pkg-mediterranean-gtk-themes/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd pkg-mediterranean-gtk-themes/
	rm -rf .git/
}

package() {
	cd pkg-mediterranean-gtk-themes/
	find Mediterranean*/ -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;

}

sha256sums=('SKIP')
