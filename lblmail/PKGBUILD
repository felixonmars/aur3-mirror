# Maintainer: Wael Nasreddine <wael.nasreddine@gmail.com>

pkgname=lblmail
pkgver=20091204
pkgrel=1
pkgdesc="lblmail is a small utility used to label an email based on pre-defined rules."
arch=('i686' 'x86_64')
url=http://wael.nasreddine.com/projects/lblmail.html
license=('GPL')
depends=('php')
makedepends=('git')

_gitroot="git://github.com/eMxyzptlk/lblmail.git"
_gitname="lblmail"

build() {
	cd ${srcdir}

	msg "Connecting to GIT server...."

	if [ -d ${srcdir}/$_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	git clone $_gitname $_gitname-build
	cd ${srcdir}/$_gitname-build

	make prefix=/usr
	make DESTDIR=${pkgdir} prefix=/usr install
}
