# Maintainer: Federico Chiacchiaretta <federico.chia at gmail dot com>

pkgname=bin32-iowolfet-hg
pkgver=53
pkgrel=1
pkgdesc="iowolfet is a completely free, standalone, team-based, multiplayer FPS; based on Wolfenstein: Enemy Territory GPL sources. 32-bit version"
arch=('x86_64')
url="http://www.iowolfet.org/"
license=('GPL')
depends=('lib32-mesa' 'enemy-territory' 'lib32-curl' 'lib32-sdl')
makedepends=('mercurial' 'gcc-multilib')
conflicts=('iowolfet-hg')
source=(iowolfet.desktop
		iowolfet.sh
		iowolfet-ded.rc
		iowolfet-ded.sh)
md5sums=('6b650821e98f7427df7b8ece4932325e'
         '01339bf30a78cfeb5f1c7c74e8db08b2'
         '1286b579df2d4ce2433e55c99be9782f'
         '9db765b868f15a013ab2ba16c25dfca1')

_hgroot="https://bitbucket.org/tcmreastwood"
_hgrepo="raedwulf-et"

_optdir="/opt/iowolfet"

build() {
	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

    cd ${srcdir}
	rm -rf ${_hgrepo}-build
	cp -r ${_hgrepo} ${_hgrepo}-build
	cd ${_hgrepo}-build

    #Compile sources
	export ARCH="i386"
    make
}

package() {		
    # Create Destination Directories
    install -d $pkgdir/$_optdir/etmain

    # Place binaries somewhere
    cd $srcdir/${_hgrepo}-build/build/release-linux-i386
    install -m 755 {ioetded,ioet,ioet-smp}.i386 $pkgdir/$_optdir/
    cd $srcdir/${_hgrepo}-build/build/release-linux-i386/etmain
    install -m 755 {cgame,qagame,ui}.mp.i386.so $pkgdir/$_optdir/etmain

    # Place scripts in /usr/bin
    install -Dm 755 $srcdir/iowolfet.sh $pkgdir/usr/bin/iowolfet
    install -Dm 755 $srcdir/iowolfet-ded.sh $pkgdir/usr/bin/iowolfet-ded

    # Install rc.d script
    install -Dm 755 $srcdir/iowolfet-ded.rc $pkgdir/etc/rc.d/iowolfet-ded

    # Install desktop file
    install -Dm 644 $srcdir/iowolfet.desktop $pkgdir/usr/share/applications/iowolfet.desktop

    # Make symlinks to pak and video files from enemy-territory package
    ln -sf /opt/enemy-territory/etmain/pak{0,1,2}.pk3 $pkgdir/$_optdir/etmain/
    ln -sf /opt/enemy-territory/etmain/mp_bin.pk3 $pkgdir/$_optdir/etmain/
    ln -sf /opt/enemy-territory/etmain/video $pkgdir/$_optdir/etmain/video
}
