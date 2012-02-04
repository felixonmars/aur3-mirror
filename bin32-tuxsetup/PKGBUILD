# Contributor: Christophe Gueret <tolgam@homegnu.net>
pkgname=bin32-tuxsetup
pkgver=1.2.2
pkgrel=1
pkgdesc="All-in-one setup package for the TuxDroid"
arch=('x86_64')
url="http://www.tuxisalive.com"
license=('custom')
groups=()
depends=('dfu-programmer' 'lib32-libusb' 'lib32-glibc' 'lib32-glib2' 'lib32-alsa-lib' 'lib32-libstdc++5' 'lib32-pcre' 'lib32-ncurses')
makedepends=()
provides=('tuxsetup')
conflicts=()
replaces=()
backup=()
options=('docs')
install=
source=(http://www.tuxisalive.com/developer-corner/software/tuxsetup/releases/1.2.2/tuxsetup-1.2.2.tar.gz 
		  http://www.tuxisalive.com/tux-droid-forum/copy_of_forumtopic1/768974438/122927179/dtw_so_test-tar.gz
		  gcc-fpic.diff)
md5sums=('93cd7c46c7fdaa0d03fbae0b9541c49f'
         '34d6b93d29873c4288c39a230661cbf1'
         '9f3d77a33a196acfbd4f2abf06a4afe0')

build() {
	mkdir -p $startdir/pkg/usr/share/licenses/tuxsetup

	# Copy the mirror
	cd $startdir/src/tuxsetup-1.2.2-final
	cp -rf mirror/* $startdir/pkg

	# Take care of licenses
	cp ACAPELALICENSE $startdir/pkg/usr/share/licenses/tuxsetup
	cp COPYING $startdir/pkg/usr/share/licenses/tuxsetup

	# Fix some rights
	rm $startdir/pkg/opt/tuxdroid/bin/dfu-programmer
	chmod a+r $startdir/pkg/usr/share/pixmaps/tuxmanager.png
	chmod a+r $startdir/pkg/usr/share/pixmaps/gadgetmaker.png
	chmod a+r $startdir/pkg/usr/share/pixmaps/tuxshell.png
	chmod a+r $startdir/pkg/opt/tuxdroid/apps/tux_framework/SDK/gadget_maker/maker.png
	chmod a+w $startdir/pkg/opt/tuxdroid/apps/tux_framework/
	chmod a+w -R $startdir/pkg/opt/tuxdroid/apps/tux_manager/gadgets/ 

	# Recompile _DTW.so
	cd $startdir/src/DTW_SO_Test
	patch -p1 < ../gcc-fpic.diff
	make || return 1
	mv _DTW.so $startdir/pkg/opt/tuxdroid/apps/tux_framework/libs/_DTW.so

	# Cleanup
	mv $startdir/pkg/usr/local/bin $startdir/pkg/usr/bin
	rmdir $startdir/pkg/usr/local
}

