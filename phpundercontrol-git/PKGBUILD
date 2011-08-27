# Maintainer: Kim Silkebækken <kim.silkebaekken+archlinux@gmail.com>

pkgname=phpundercontrol-git
pkgver=20101117
pkgrel=1
pkgdesc="An addon application for the continuous integration tool CruiseControl, which integrates some of the best PHP development tools."
arch=(any)
url="http://phpundercontrol.org/"
license=("custom")
depends=("cruisecontrol-bin>=2.8" "php")
makedepends=("git")
install=${pkgname}.install

_gitroot="git://github.com/phpundercontrol/phpUnderControl.git"
_gitname="phpUnderControl"

build() {
	cd ${srcdir}

	msg "Connecting to GIT repo..."

	if [ -d ${_gitname} ]; then
		cd ${_gitname}
		git pull origin
		cd ..

		msg "The local files are updated."
	else
		git clone ${_gitroot}
	fi

	msg "GIT checkout completed."

	install -d ${pkgdir}/opt/phpundercontrol
	cp -a ${srcdir}/${_gitname}/{bin,data,src} ${pkgdir}/opt/phpundercontrol
	rm -rf `find ${pkgdir} -name ".git"`
	install -D -m 644 ${srcdir}/${_gitname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
