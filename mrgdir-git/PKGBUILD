# Maintainer: Àlex Ramírez Gómez <alexandre.ramirez@est.fib.upc.edu>
pkgname='mrgdir-git'
_gitname='mrgdir'
pkgver=20130509
pkgrel=2
pkgdesc="A bash script to merge directories."
arch=('any')
url='https://github.com/badarg/mrgdir'
license=('Apache')
#groups=()
depends=('bash')
makedepends=('git')
#provides=()
#conflicts=()
#replaces=()
#backup=()
options=(!emptydirs)
#install=
source=('git://github.com/badarg/mrgdir.git')
md5sums=('SKIP')

_gitroot='https://github.com/badarg/mrgdir.git'

pkgver() {
	#cd local_repo
	#git describe --always | sed 's|-|.|g'
	#echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
	date %Y%m%d
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
	install -D mrgdir.sh "$pkgdir/usr/bin/mrgdir"
}

