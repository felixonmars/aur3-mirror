# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

#Maintainer gee
#Based of primecoin-qt by Daniel Spies

pkgname=protoshares-thbaumbach-miner-git
_gitname=ptsminer
pkgver=20131114
pkgrel=1
pkgdesc="Pool miner for ProtoShares"
arch=('x86_64' 'i686')
url="https://github.com/thbaumbach/ptsminer"
license=('MIT')
provides=('protoshares-thbaumbach-miner')
depends=('miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'yasm')
source=('git+https://github.com/thbaumbach/ptsminer.git')
install=protoshares-thbaumbach-miner.install

sha256sums=(SKIP)

## files & commands for building
_makefile_unix=makefile.unix

build() {
	cd ${_gitname}/src

	# build ptsminer
	msg "Building ProtoShares Miner"
	make USE_UPNP=1 USE_SSL=1 -f ${_makefile_unix} ${_gitname}
}

package() {
	cd ${_gitname}
	
	install -Dm755 src/${_gitname} "$pkgdir"/usr/bin/${_gitname}
}
