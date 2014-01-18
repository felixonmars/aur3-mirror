# Maintainer: Àlex Ramírez Gómez <alexandre.ramirez@est.fib.upc.edu>
pkgname='pycipher-git'
_gitname='pycipher'
pkgver=20140117
pkgrel=3
pkgdesc="Software to encrypt and decrypt data and files using several algorithms."
arch=('any')
url='https://github.com/badarg/pycipher'
license=('Apache')
#groups=()
depends=('python-crypto')
makedepends=('git')
#provides=()
#conflicts=()
#replaces=()
#backup=()
options=(!emptydirs)
#install=
source=('git://github.com/badarg/pycipher.git')
md5sums=('SKIP')

#_gitroot='https://github.com/badarg/pycipher.git'

pkgver() {
	#cd local_repo
	#git describe --always | sed 's|-|.|g'
	#echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	date +%Y%m%d
}
build() {
	cd "$srcdir"
	msg "Connecting to GIT server..."
	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone --depth=1 $_gitroot $_gitname
	fi
	msg "GIT checkout done or server timeout"
}
package() {
#	cd $_gitname
	cd "$srcdir/$_gitname"
	install -D pycipher.py "$pkgdir/usr/bin/pycipher"
	install -D pycipher.man "$pkgdir/usr/share/man/man1/pycipher.1"
}

