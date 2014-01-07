# Maintainer: Justin Dray <justin@dray.be>

pkgname=ice-git
pkgver=r214.1cf9c50
pkgrel=1
pkgdesc="Application to automatically add ROMs to Steam"
arch=('i686' 'x86_64')
url='http://scottrice.github.io/Ice'
license=('MIT')
depends=('python2')
makedepends=('git')
backup=('opt/ice/emulators.txt' 'opt/ice/consoles.txt' 'opt/ice/config.txt')
install="ice-git.install"
source=("git+https://github.com/scottrice/Ice.git"
        'ice.desktop'
        'ice-wrapper')
md5sums=('SKIP'
         '2fcbbe1d2627847ec642cc248a81e449'
         '662de708b23d496901643726651aa40f')

pkgver() {
	cd "${srcdir}/Ice"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"|grep -Eo "[a-z0-9.]*"
}

prepare() {
	cd "${srcdir}/Ice"
	find . -iname '*.py' -exec sed -i 's|#!/usr/bin/env python|#!/usr/bin/python2|' {} \;
	rm -rf "${srcdir}/Ice/.git"*
}

package() {
	install -d "${pkgdir}/opt" "${pkgdir}/usr/bin"
	cp -r "${srcdir}/Ice/" "${pkgdir}/opt/ice"
	install -D "${srcdir}/ice.desktop" "${pkgdir}/usr/share/applications/ice.desktop"
	install -Dm775 "${srcdir}/ice-wrapper" "${pkgdir}/opt/ice/ice-wrapper"
	touch "${pkgdir}/opt/ice/ice.log"
	chmod 666 "${pkgdir}/opt/ice/ice.log"
	chmod +x "${pkgdir}/opt/ice/ice-qt.py"
	ln -s "/opt/ice/ice-wrapper" "${pkgdir}/usr/bin/ice"
	ln -s "/opt/ice/ice-wrapper" "${pkgdir}/usr/bin/ice-qt"
}
