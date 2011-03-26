# Maintainer: Mika Hynnä <mika d hynna at iki d fi>
# The IEGD_10_3_Linux.tgz archive is extracted from
# IEGD_10_3_1_GOLD_1550.exe packed in IEGD_10_3_1_GOLD.zip.
# The files can be downloaded from url below after registeration.

pkgname=iegd
pkgver=10.3.1
pkgrel=1
pkgdesc="Intel Embedded Graphics Drivers for US15W"
arch=(i686)
url="http://edc.intel.com/Software/Downloads/IEGD/"
license=(unknown)
install=('iegd.install')
depends=('xorg-server' 'libgl')
#provides=('libgl')
#conflicts=('libgl')
source=(http://www.ihku.biz/joggler/iegd/IEGD_10_3_Linux.tgz)
md5sums=('cfa9383ea4349a69698677abae3486b0')

build() {
	cd ${srcdir}/IEGD_10_3_Linux/
	
	IEGDSRC=$srcdir/IEGD_10_3_Linux/driver/Xorg-xserver-1.6.4.901/
	mkdir -p $pkgdir/etc/profile.d/ || return 1
	mkdir -p $pkgdir/lib
	mkdir -p $pkgdir/usr/lib
	mkdir -p $pkgdir/usr/lib/dri/
	mkdir -p $pkgdir/usr/lib/xorg/modules || return 1
	mkdir -p $pkgdir/usr/lib/xorg/modules/drivers || return 1
	mkdir -p $pkgdir/usr/share/man/man4
	mkdir -p $pkgdir/usr/share/man/man3x

	cd $IEGDSRC || return 1

	# Install basic driver
	install -m 755 iegd_drv.so $pkgdir/usr/lib/xorg/modules/drivers/ || return 1
	install -m 755 iegd_drv_video.so $pkgdir/usr/lib/xorg/modules/drivers/ || return 1
	install -m 755 lvds.so $pkgdir/usr/lib/xorg/modules/ || return 1
	install -m 755 sdvo.so $pkgdir/usr/lib/xorg/modules/ || return 1
	install -m 755 libXiegd_escape.so.2.0.0 $pkgdir/usr/lib/ || return 1

	# Manpages
	install -m 644 iegd.4.gz $pkgdir/usr/share/man/man4 || return 1
	install -m 644 iegd_escape.3x.gz $pkgdir/usr/share/man/man3x/ || return 1

	# OpenGL stuff
	install -m 755 iegd_dri.so $pkgdir/usr/lib/dri/ || return 1
	install -m 755 libGL_ga.so.1.2 $pkgdir/usr/lib/ || return 1

#	install -m 755 libEGL.so.1.0 $pkgdir/usr/lib/ || return 1
#	install -m 755 libEGLdri.so.1.0 $pkgdir/usr/lib/ || return 1
#	install -m 755 libGLESv1_CM.so.1.1.0 $pkgdir/usr/lib/ || return 1
#	install -m 755 libGLESv2.so.2.0.0 $pkgdir/usr/lib/ || return 1
#	install -m 755 egl_xdri.so $pkgdir/usr/lib/ || return 1
#	install -m 755 egl_iegd_dri.so $pkgdir/usr/lib/ || return 1


	# Video driver
#	install -m 755 libva.so.0.29.0 $pkgdir/usr/lib/ || return 1

	# Create symlinks
	cd $pkgdir/usr/lib || return 1
	ln -sfv libXiegd_escape.so.2.0.0 libXiegd_escape.so || return 1
	ln -sfv libXiegd_escape.so.2.0.0 libXiegd_escape.so.2 || return 1

#	ln -sfv ligGL_ga.so.1.2 libGL.so.1.2 || return 1
#	ln -sfv libGL_ga.so.1.2 libGL.so || return 1
#	ln -sfv libGL_ga.so.1.2 libGL.so.1 || return 1

#	ln -s libva.so.0.29.0 libva.so.0 || return 1
#	ln -s libva.so.0.29.0 libva.so || return 1

#	ln -sfv libexpat.so.1.5.2 libexpat.so.0 || return 1

	#install profile for VA driver path
	cd $srcdir || return 1
	echo "export LIBVA_DRIVERS_PATH=/usr/lib/xorg/modules/drivers/" >> iegd.sh || return 1
	install -m 755 iegd.sh $pkgdir/etc/profile.d/ || return 1

	#If you would like to enable or disable Multi-Sample Anti-Aliasing on the Intel US15W,
	#enter the following commands into the terminal:
	#• Enable: export _GL_FSAA_MODE=4
	#• Disable: export _GL_FSAA_MODE=0 or export _GL_FSAA_MODE=1

}
