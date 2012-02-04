# Maintainer: Daniel <packages@post.danielnoegel.de>
# Contributor: Daniel <packages@post.danielnoegel.de> 
pkgname=joy2mouse-bzr
pkgver=5
pkgrel=1
pkgdesc="Control your mouse with your joystick/joypad"
arch=("any")
url="https://launchpad.net/joy2mouse"
license=("GPL")
groups=()
provides=()
depends=('python-xlib' 'python-virtkey' )
makedepends=()
conflicts=()
replaces=()
backup=()
source=()
md5sums=()

_bzrmod=joy2mouse
_bzrtrunk=lp:joy2mouse

build() {
	cd ${srcdir}

    bzr branch ${_bzrtrunk} -q

	cd ${pkgdir}
    mkdir -p ${pkgdir}/usr/{bin,share/{,apps/joy2mouse}}
    
    cp -R ${srcdir}/${_bzrmod}/* ${pkgdir}/usr/share/apps/joy2mouse
    ln -s /usr/share/apps/joy2mouse/joy2mouse ${pkgdir}/usr/bin/joy2mouse

}
