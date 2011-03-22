# Maintainer: Jens Staal <staal1978@gmail.com>
pkgname=9mk-init-rc
pkgver=1
pkgrel=1
pkgdesc="an init system based on plan9 make - rc init scripts"
arch=('i686' 'x86_64')
url="http://9fans.net/archive/2009/10/375"
license=('MIT')
source=('archpath1.patch' 'archpath2.patch')
md5sums=('2f7db22ca295b963152d1b628533385c' '0546f2aeb1d16c5865167b6d69c0d672')
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

    cd $srcdir/build
    patch -i $srcdir/archpath1.patch
    cd $srcdir/build/src
    patch -i $srcdir/archpath2.patch
    cd $srcdir/build

    export PLAN9=/opt/plan9
    export PATH=$PLAN9/bin:$PATH

    rm $srcdir/build/src/mkinit
    cp $srcdir/build/src/mkinit.rc $srcdir/build/src/mkinit

    mk all
    mk DESTDIR=$pkgdir install
    msg "WARNING: this is a highly experimental package. Make sure that you know what you are doing before installing"
}
