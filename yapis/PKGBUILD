# Maintainer: Antonio Ciccia <m4dnoob@gmail.com>
pkgname=yapis
pkgver=20130317
pkgrel=1
epoch=
pkgdesc="Yet another python information script to display system informations!"
arch=('i686' 'x86_64')
url="https://github.com/MadNoob/yapis.git"
license=('GPL')
groups=()
depends=('python3')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()
gitroot="git://github.com/MadNoob/yapis.git"
gitname="yapis"

build() {
	cd ${srcdir}

	rm -rf ${pkgname}

	if [ -d ${pkgname} ] ; then
		cd ${pkgname} && git pull origin
		msg "The local files are updated."
	else
		git clone ${gitroot}
	fi

	msg "Starting to make $pkgname package!"

	cd ${srcdir}/${pkgname}
	
	install -D -m644 yapis.conf ${pkgdir}/etc/${pkgname}/yapis.conf || return 1
	install -D -m644 yapis_colors.conf ${pkgdir}/etc/${pkgname}/yapis_colors.conf || return 1
	install -D -m755 yapis ${pkgdir}/usr/bin/yapis || return 1
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
