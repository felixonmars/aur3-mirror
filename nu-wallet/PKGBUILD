## Maintainer: peerchemist
# package provides both daemon and qt based GUI wallet

pkgname='nu-wallet'
_gitname="nubit"
pkgver=1.2.0.r4.ga544017
pkgrel=1
pkgdesc="The World's First Stable Digital Currency."
arch=('i686' 'x86_64')
url="https://nubits.com/"
license=('custom')
provides=('nubits')
conflicts=('nubits-wallet')
replaces=('nu-wallet-bin')
depends=('qt4' 'miniupnpc' 'boost-libs')
source=(git+https://bitbucket.org/JordanLeePeershares/nubit
		https://nubits.com/sites/default/files/assets/logo-nu-full-150-dark.png
        nu.desktop)
install=nu.install
sha256sums=('SKIP'
            '4500ea60a521a2df38ebe5c4d494e28036869c910b8414d9442900ace374d16b'
            '20977ea565836178b2c5aa8ff23964f097a68e3dec024074b702f11a46934479')

pkgver() {

	cd "$srcdir/$_gitname"
	# Use tag of the last commit, but removing the prefix
	git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build () {
	
	## Build daemon
	cd $srcdir/$_gitname/src
	make -f makefile.unix USE_UPNP=0 USE_SSL=1 -e PIE=1

	# make qt gui
	cd $srcdir/$_gitname
	qmake-qt4 USE_UPNP=0 USE_SSL=1 PIE=1
	make
}


package() {

	install -Dm644 nu.desktop ${pkgdir}/usr/share/applications/nu.desktop
	install -Dm644 logo-nu-full-150-dark.png ${pkgdir}/usr/share/pixmaps/nu.png
	install -Dm644 $_gitname/COPYING $pkgdir/usr/share/licenses/$_gitname/COPYING

	##daemon
	install -Dm755 $_gitname/src/nud $pkgdir/usr/bin/nud

	## qt
	install -Dm755 $_gitname/nu ${pkgdir}/usr/bin/nu
}

