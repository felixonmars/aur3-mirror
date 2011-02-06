# Maintainer: Swift Geek <swiftgeek+aur at gmail dot com>

pkgname=iowolfet-hg
pkgver=53
pkgrel=1
pkgdesc="iowolfet is a completely free, standalone, team-based, multiplayer FPS; based on Wolfenstein: Enemy Territory GPL sources"
arch=('i686' 'x86_64')
url="http://www.iowolfet.org/"
license=('GPL')
depends=('mesa' 'libxext' 'enemy-territory')
makedepends=('mercurial')
#backup=(opt/iowolfet/etmain/server.cfg)
#       opt/enemy-territory/etmain/punkbuster.cfg)
install=iowolfet.install
source=(iowolfet.desktop iowolfet-ded.rc iowolfet.sh iowolfet-ded.sh scripts-x86_64.patch)
md5sums=('6b650821e98f7427df7b8ece4932325e'
         '0c4d902b2a2fc6bd67df74347ce7be3b'
         '01339bf30a78cfeb5f1c7c74e8db08b2'
         '9db765b868f15a013ab2ba16c25dfca1'
         '47e4755cdb246c050b41eed174ec8a08')
_hgroot="https://bitbucket.org/tcmreastwood"
_hgrepo="raedwulf-et"
optdir="/opt/iowolfet"
# Computer Architecture Variable used by iowolfet
[ "$CARCH" = "i686" ] && _dirarch=i386
[ "$CARCH" = "x86_64" ] && _dirarch=x86_64

build() {
		cd ${srcdir}/${_hgrepo}


		#Compile sources
		make
}		


package() {
		# Clean after compilation process
		#cd $srcdir/${_hgrepo}/build
		#rm -r 
		# Create Destination Directories
		install -d $pkgdir/$optdir/{client,clientsmp,ded,etmain}
		install -d $pkgdir/$optdir/etmain/{cgame,game,qcommon,ui,video}

		# Place binaries somewhere
		cd $srcdir/${_hgrepo}/build/release-linux-$_dirarch
		install -m 755 {ioetded.$_dirarch,ioet.$_dirarch,ioet-smp.$_dirarch} $pkgdir/$optdir/
		cd ./etmain
		install -m 755 {cgame.mp.$_dirarch.so,qagame.mp.$_dirarch.so,ui.mp.$_dirarch.so} $pkgdir/$optdir/etmain

		# Place other data files somewhere
		cd $srcdir/${_hgrepo}/build/release-linux-$_dirarch
		cp -R {client,clientsmp,ded} $pkgdir/$optdir/
		cd ./etmain
		cp -R {cgame,game,qcommon,ui} $pkgdir/$optdir/etmain

		# Place scripts in main/bin directory
		#install -Dm 755 $srcdir/iowolfet.sh $pkgdir/$optdir/iowolfet
		#install -Dm 755 $srcdir/iowolfet-ded.sh $pkgdir/$optdir/iowolfet-ded
		mkdir -p $pkgdir/usr/bin
		install -Dm 755 $srcdir/iowolfet.sh $pkgdir/usr/bin/iowolfet
		install -Dm 755 $srcdir/iowolfet-ded.sh $pkgdir/usr/bin/iowolfd


		# Install rc.d script
		install -Dm 755 $srcdir/iowolfet-ded.rc $pkgdir/etc/rc.d/iowolfet-ded

		# Install desktop file and icon
		install -Dm 644 $srcdir/iowolfet.desktop $pkgdir/usr/share/applications/iowolfet.desktop
		#    install -Dm 644 $pkgdir/opt/$pkgname/ET.xpm $pkgdir/usr/share/pixmaps/$pkgname.xpm

		# Fix for x86_64
		if [[ "$CARCH" == "x86_64" ]]; then
			cd $pkgdir
			patch -p1 < ../scripts-x86_64.patch
		fi


		# Make symlinks to main scripts
		#mkdir -p $pkgdir/usr/bin
		#ln -sf $pkgdir/$optdir/iowolfet $pkgdir/usr/bin/iowolfet
		#ln -sf $pkgdir/$optdir/iowolfet-ded $pkgdir/usr/bin/iowolfetd

		# Make symlinks to pak and video files from enemy-territory package
		ln -sf /opt/enemy-territory/etmain/pak{0,1,2}.pk3 $pkgdir/$optdir/etmain/
		ln -sf /opt/enemy-territory/etmain/mp_bin.pk3 $pkgdir/$optdir/etmain/
		ln -sf /opt/enemy-territory/etmain/video/etintro.roq $pkgdir/$optdir/etmain/video

}
