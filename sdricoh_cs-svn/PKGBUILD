# Contributor: Frank Oosterhuis <frank@scriptzone.nl

pkgname=sdricoh_cs-svn
pkgver=15
pkgrel=1
pkgdesc="Linux driver for Ricoh Bay1Controller Secure Digital and MMC Card Readers"
arch=('i686')
url="http://sourceforge.net/projects/sdricohcs"
license=('GPL')
depends=('kernel26')
makedepends=('subversion')
conflicts=()
options=('!strip')
install=sdricoh_cs.install
_kernver=2.6.20-ARCH
source=(sdricoh_cs.install debug.patch write.patch)
md5sums=(e8aa20bbe9e98e33d8f2b8cdf7f11da0 8c5cecb1c07f79d6a0e54818ef10638f 18ca4a9fde9956af64cd2489b0e5110a)
sha1sums=(ea26d8019ea4988125142b60048887d5efb6a22a e7aa5af67ad83291b6d69bcefd02404b58aebacf 6fec49a1125223d23c7aab096a4a5c913bbfcede)

_svnmod=sdricohcs
_svntrunk=https://sdricohcs.svn.sourceforge.net/svnroot/sdricohcs

build() {
    cd $startdir/src
    msg "Connecting to $_svnmod SVN server...."
    svn co $_svntrunk $_svnmod -r $pkgver
	
    msg "SVN checkout done or server timeout"
	
    msg "Starting make..."

    patch -Np0 -i write.patch
#    patch -Np0 -i debug.patch    

    cd sdricohcs/sdricoh_cs
    
    make || return 1

    install -m 644 -D sdricoh_cs.ko \
        $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/mmc/sdricoh_cs.ko
}
