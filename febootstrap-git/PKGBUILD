# Contributor: Evaggelos Balaskas < ebalaskas _AT_ ebalaskas _DOT_ gr >
# Maintainer:  Evaggelos Balaskas < ebalaskas _AT_ ebalaskas _DOT_ gr >

_pkg=febootstrap
pkgname=$_pkg-git
pkgver=git
pkgrel=1
arch=('any')
pkgdesc="Tool used to create libguestfs supermin appliances"
url="https://github.com/libguestfs/$_pkg.git/"
license=('GPL v2')
depends=(
	'wget'
        'cpio'
)
makedepends=(
	'git'
	'ocaml'
        'ocaml-findlib'
)
provides=("febootstrap=3.21")
conflicts=("febootstrap")
replaces=("febootstrap")
install=
source=()
md5sums=()

_gitroot="https://github.com/libguestfs"
_gitname=$_pkg.git

build() {

	msg "Connecting to "$_gitroot" ..."

	if [ -d $_pkg ] ; then
		cd $_pkg && git pull origin && git checkout ./ --quiet
		msg "The local files are updated."
	else
		git clone $_gitroot/$_pkg
		msg "The local files are updated."
	fi

	cd $srcdir/$_pkg
	./autogen.sh --prefix=/usr
	make

}

package() {
	cd $srcdir/$_pkg
	make DESTDIR=$pkgdir install
}
