# Contributor: Bram Schoenmakers <me@bramschoenmakers.nl>
# Contributor: henning mueller <henning@orgizm.net>
# Contributor: rakoo (AUR)
# Contributor: SanskritFritz (gmail)
# Maintainer: Jakob Matthes <jakob.matthes@gmail.com>

pkgname=bup
pkgver=0.26
_pkgver=0.26
pkgrel=1
pkgdesc="Highly efficient file backup system based on the git packfile format."
arch=('i686' 'x86_64')
url="http://github.com/bup/bup"
license=('GPL')
depends=('python2-fuse' 'par2cmdline' 'pylibacl' 'python2-pyxattr')
conflicts=('bup-git')
source=("git+https://github.com/bup/bup.git#tag=${_pkgver}"
	'python2.patch')
md5sums=('SKIP'
	'e44f6a49f85a90c4e5a27295a18e02f7')

prepare() {
	cd $pkgname
	# python2 replacements
	git apply $srcdir/python2.patch
}

build() {
	cd $pkgname
	make
}

test() {
	cd $pkgname
	make test
}

package() {
	cd $pkgname
	make DESTDIR=$pkgdir install
}
