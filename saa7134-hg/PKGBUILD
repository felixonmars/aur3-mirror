# Contributor: Aidan Taniane <aidanjt@gmail.com>
# Notes: this PKGBUILD should be suitable for any card in the v4l-dvb SCM tree
# with only some trivial changes
pkgname="saa7134-hg"
pkgver=8063
pkgrel=1
pkgdesc="Kernel V4L modules for Phillips SAA7134 cards"
arch=(i686 x86_64)
url="http://linuxtv.org/hg/v4l-dvb"
license=('GPL')
makedepends=('mercurial' 'gcc' 'make' 'which' 'module-init-tools' 'grep')
optdepends=('linuxtv-dvb-apps: Useful tools for configuring your DVB card'
	    'mplayer: A V4l/DVB capable media player'
	    'mythtv: mplayer on steroids, a fully complete PVR system')
source=('saa7134-hg.install' 'saa7134-hg.kconfig')
md5sums=('8b57019c8bd9da816d7460375306c591' 'a32743f1fcf99406a72e7884c1a7a390')
install=('saa7134-hg.install')
_hgroot=('http://linuxtv.org/hg/v4l-dvb')
_hgrepo=('v4l-dvb/')

build() {
	local _treedir="${startdir}/src/v4l-dvb"
	local _kdir="/lib/modules/$(uname -r)/updates/"
	local _docdir="${startdir}/pkg/usr/share/${pkgname}"

	# Step into the v4l tree
	cd ${_treedir}

	# Copy config in place
	cp ${startdir}/${pkgname}.kconfig ${_treedir}/v4l/.config  || return 1

	# Compile
	make || return 1

	# Install modules
	make DESTDIR=$startdir/pkg/ KDIR26=$_kdir install
	rm ${startdir}/pkg/lib/modules/$(uname -r)/modules.*

	# Install Documentation
	mkdir -p ${_docdir}
	cp -Rf ${_treedir}/linux/Documentation/video4linux/{CARDLIST,README}.saa7134 ${_docdir}/
	echo "The module_parm* lines in saa7134-core.c have been dumped here for your convieniance,
they should be useful when dealing with troublesome cards that need certain
settings when being modprobed or insmod'ed.

Also note that for Medion MD8800 cards, you need to add 'use_frontend=1' to get
DVB-S support.  Enjoy.

saa7134.ko:
===========
$(egrep "module_param\(|MODULE_PARM_DESC\(" ${_treedir}/v4l/saa7134-core.c)

saa7134_dvb.ko:
===============
$(egrep "module_param\(|MODULE_PARM_DESC\(" ${_treedir}/v4l/saa7134-dvb.c)
" &> ${_docdir}/${pkgname}.parms

}

