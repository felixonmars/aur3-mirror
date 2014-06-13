# Maintainer: Que Quotion <quequotion@mailinator.com>

pkgname=plank-themer-git
_gitname=plank-themer
pkgver=1401992562
pkgrel=4
pkgdesc="A small program that allows you to change Plank Dock themes without any additional consumption of resources"
arch=('i686' 'x86_64')
url="http://rhoconlinux.github.io/plank-themer/"
license=('LGPL')
depends=('bash' 'plank')
makedepends=('bash')
optdepends=('plank-themes-elementary-bzr')
provides=("plank-themer=${pkgver}" "plank-themer-git=${pkgver}")
conflicts=()
replaces=('plank-themer')
source=('git://github.com/rhoconlinux/plank-themer'
	'Makefile'
	'plank-themer.sh')
sha512sums=('SKIP'
            'c4c4e78c00ba16962bcae5dbb3a91cf9964edfffac7557aa97a5b632e3b325a201e39c276bfff5a14325e9ff6b17a24ddeca57726ef0094af0c77a624b4ae14e'
            'be70799eb6c88f304fbd056c3d08b1d1cbac3991733445d1948f864111741d8520d31af4b7e592a82be57c9a30b9de49d1940ecb771bb61c1eace459de94cba4')

pkgver() {

	cd "${_gitname}"
	git log -1 --pretty=format:%ct HEAD

}


prepare() {
	# plank-themer's theme repository contains rhoconlinux's own and other's contributions
	# not sure which is more up to date, rhoconlinux's git or elementary's bzr
	# avoiding conflict with "official" bzr versions as a matter of policy
	rm -rf ${_gitname}/themes-repo/Themes/Pantheon # Conflicts with plank-theme-pantheon(-bzr)
	rm -rf ${_gitname}/themes-repo/Themes/Chameleon # Conflicts with plank-themes-elementary-bzr 
	rm -rf ${_gitname}/themes-repo/Themes/Coal # Conflicts with plank-themes-elementary-bzr 
	rm -rf ${_gitname}/themes-repo/Themes/Darktheon # Conflicts with plank-themes-elementary-bzr 
	rm -rf ${_gitname}/themes-repo/Themes/Wingy # Conflicts with plank-themes-elementary-bzr 
	cp "$srcdir/Makefile" ${_gitname}
	cp "$srcdir/plank-themer.sh" ${_gitname}

}

build() {

	cd ${_gitname}
	make

}

package() {

	cd ${_gitname}
	make DESTDIR="$pkgdir" install

}
