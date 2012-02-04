# Maintainer: Daniel <packages@post.danielnoegel.de>
# Contributor: Daniel <packages@post.danielnoegel.de> 
pkgname=lsrsid-bzr
pkgver=46
pkgrel=1
pkgdesc="lsR SID is a simple browser for the High Voltage SID Collection"
arch=("any")
url="https://launchpad.net/lsr.sid"
license=("GPL")
groups=()
provides=()
depends=('python-pysqlite' 'python-configobj' 'sidplay2' 'alsa-oss')
makedepends=()
conflicts=()
replaces=()
backup=()
source=()
md5sums=()

_bzrmod=lsr.sid
_bzrtrunk=lp:lsr.sid

build() {
	cd ${srcdir}

    bzr branch ${_bzrtrunk} -q

	cd ${pkgdir}
    mkdir -p ${pkgdir}/usr/{bin,share/{,apps/lsrsid}}
    
    cp -R ${srcdir}/${_bzrmod}/* ${pkgdir}/usr/share/apps/lsrsid
    ln -s /usr/share/apps/lsrsid/lsrsid ${pkgdir}/usr/bin/lsrsid

}
