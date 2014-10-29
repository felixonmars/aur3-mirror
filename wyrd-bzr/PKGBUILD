# Maintainer: tealeaf joss-arch@pseudonymity.net
# Contributor: ormris ormris@ormris.com

pkgname="wyrd-bzr"
pkgver=313
pkgrel=1
pkgdesc="A text-based front-end to Remind."
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~pelzlpj/wyrd/wyrd-dev"
license=('GPL2')
depends=('remind' 'ncurses' 'less')
provides=('wyrd')
conflicts=('wyrd')
makedepends=('bzr' 'ocaml' 'camlp4' 'texlive-core' 'texlive-latexextra' 'python' 'hevea' )
source=()
md5sums=()
_bzrbranch=lp:wyrd
_bzrmod=wyrd

pkgver() {

	cd ${_bzrmod}
	bzr revno

}



build() {

	cd $srcdir

	# Check out branch
	rm -rf ${_bzrmod}
	bzr branch ${_bzrbranch}

	# Make package
	[ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
	cp -r ./${_bzrmod} ./${_bzrmod}-build
	cd ./${_bzrmod}-build

	./prep-devtree.sh

	cd ${srcdir}/${_bzrmod}-build/doc/

	make all

	cd ${srcdir}/${_bzrmod}-build/

	./configure --exec-prefix=/usr --prefix=/usr --sysconfdir=/etc
	make || return 1

}

package() {
	
	cd ${srcdir}/${_bzrmod}-build
	make DESTDIR="$pkgdir" install

}
