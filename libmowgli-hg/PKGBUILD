# Contributor: Brad Gordon <brad@rpgcyco.net>
# Contributor: Travis Willard <travisw@wmpub.ca>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Mathias Buren <mathias.buren@gmail.com>

pkgname=libmowgli-hg
pkgver=369
pkgrel=1
pkgdesc='Class library containing performance and usability oriented extensions to C.'
arch=('i686' 'x86_64')
url='http://www.atheme.org/project/mowgli'
license=('custom')
depends=('glibc' 'unzip')
makedepends=('pkgconfig' 'mercurial')
conflicts=('libmowgli')
provides=('libmowgli')
#source=()
#md5sums=()

_hgroot=http://hg.atheme.org/
_hgrepo=libmowgli

build() {
	cp -R ${startdir}/src/${_hgrepo} ${startdir}/src/${_hgrepo}-build
	cd ${startdir}/src/${_hgrepo}-build
	sh autogen.sh
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=${startdir}/pkg install

	rm -rf ${startdir}/src/${_hgrepo}-build
}
