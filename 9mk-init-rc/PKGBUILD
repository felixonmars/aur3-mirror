# Maintainer: Jens Staal <staal1978@gmail.com>
pkgname=9mk-init-rc
pkgver=99
pkgrel=2
pkgdesc="an init system based on plan9 make - rc init scripts"
arch=('i686' 'x86_64')
url="http://9fans.net/archive/2009/10/375"
license=('MIT')
install=('9mkinit.install')
depends=("9base") #alternative dependency: plan9port
conflicts=('9mk-init-bash')
makedepends=('subversion')


build() {
    export LC_ALL=C
    export DESTDIR=$pkgdir

    cd $srcdir
    svn co https://lug.rose-hulman.edu/svn/misc/trunk/mkinit/ mkinit
    svn cat https://lug.rose-hulman.edu/svn/misc/trunk/mkcommon > mkcommon

    rm -rf $srcdir/build
    cp -ar mkinit build

    export PLAN9=/opt/plan9
    export PATH=$PLAN9/bin:$PATH

    rm $srcdir/build/src/mkinit
    cp $srcdir/build/src/mkinit.rc $srcdir/build/src/mkinit

    cd $srcdir/build
    mk all
}

package() {
    install -d "$pkgdir/etc"
    install -d "$pkgdir/sbin"
    install -d "$pkgdir/lib/mkinit/bin"
    install -d "$pkgdir/lib/mkinit/state"

    install -t $pkgdir/lib/mkinit/bin $srcdir/build/src/{mkinit,service,respawn,initctld}
    install -t $pkgdir/etc $srcdir/build/init.mk

    msg "WARNING: this is a highly experimental package. Make sure that you know what you are doing before installing"
}
