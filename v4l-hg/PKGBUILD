pkgname=v4l-hg
pkgver=20070512
pkgrel=2
pkgdesc="X.org v4l video driver"
makepends=('mercurial')
conflicts=('v4l-cvs')
url="http://mcentral.de/wiki/index.php/Em2880"
source=( \
	'config' \
	'Makefile-depmod.patch' \
	'Makefile-lsmod.patch'\
)
md5sums=( \
	'334ac08d9980f5130d09b36137f64e0f' \
	'40084693888a7105adf4c0fbcb8afb03' \
	'efcd91a0464ea471dc182a902d87cf4d'\
)
install=v4l-hg.install
license=('GPL')
arch=('i686')

_hgroot=http://mcentral.de/hg/~mrec/
_hgrepo=v4l-dvb-experimental
#_hgrepo=v4l-dvb-kernel

build() {
	_kver=`uname -r`
	cd $startdir/src
	if [ -d ${_hgrepo} ]; then
		cd $startdir/src/${_hgrepo}/v4l
		hg pull -u
	else
		hg clone ${_hgroot}${_hgrepo} || return 1
		cd $startdir/src/${_hgrepo}/v4l
	fi

	if [[ "grep `uname -r` src/v4l-dvb-experimental/v4l/oss/.version" == "" ]]; then
		make distclean || return 1
	fi

	#cp $startdir/src/config ./.config
	make menuconfig

	msg `pwd`
	patch -Np0 -i $startdir/src/Makefile-lsmod.patch

	make
	patch -Np0 -i $startdir/src/Makefile-depmod.patch
	make \
		DEST=$startdir/pkg/lib/modules/${_kver} \
		KDIR=$startdir/pkg/lib/modules/${_kver}/build \
		KDIR26=$startdir/pkg/lib/modules/${_kver}/kernel/drivers/media \
		install
}
