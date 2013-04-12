# SANE (Dev): Installer: Arch
# Maintainer: Jeremy M. <jskier (at) gmail (dot) com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributed by Sarah Hay <sarahhay@mb.sympatico.ca>, Tobias Powalowski <t.powa@gmx.de>, Simo L. <neotuli@yahoo.com>, eric <eric@archlinux.org>
# Contributed: Andrew Panchenko <panchenkoac at gmail>
pkgname='sane-dev'
_gitname='sane-backends'
pkgver=10232.255.8565
pkgrel=1
pkgdesc="Scanner Access Now Easy.  This is git version with mustek_usb2"
arch=("i686" "x86_64")
url="http://www.sane-project.org"
license=("GPL")
provides=("sane" "sane-git" "sane-mustek_usb2")
depends=("libtiff>=4.0.0" "libgphoto2" "libjpeg>=8" "libieee1284" "libusb-compat" "libcups" 'libieee1284' 'v4l-utils' 'avahi' 'bash' 'net-snmp')
conflicts=("sane" "sane-git" "sane-mustek_usb2")
backup=(etc/sane.d/{abaton.conf,agfafocus.conf,apple.conf,artec.conf,artec_eplus48u.conf,avision.conf,bh.conf,canon.conf,canon630u.conf,canon_dr.conf,canon_pp.conf,cardscan.conf,coolscan2.conf,coolscan3.conf,coolscan.conf,dc25.conf,dc210.conf,dc240.conf,dell1600n_net.conf,dll.conf,dmc.conf,epjitsu.conf,epson.conf,epson2.conf,fujitsu.conf,genesys.conf,gphoto2.conf,gt68xx.conf,hp.conf,hp3900.conf,hp4200.conf,hp5400.conf,hpsj5s.conf,hs2p.conf,ibm.conf,kodak.conf,kodakaio.conf,leo.conf,lexmark.conf,ma1509.conf,magicolor.conf,matsushita.conf,microtek.conf,microtek2.conf,mustek.conf,mustek_pp.conf,mustek_usb.conf,nec.conf,net.conf,p5.conf,pie.conf,pixma.conf,plustek.conf,plustek_pp.conf,qcam.conf,ricoh.conf,rts8891.conf,s9036.conf,saned.conf,sceptre.conf,sharp.conf,sm3840.conf,snapscan.conf,sp15c.conf,st400.conf,stv680.conf,tamarack.conf,teco1.conf,teco2.conf,teco3.conf,test.conf,u12.conf,umax.conf,umax1220u.conf,umax_pp.conf,xerox_mfp.conf,v4l.conf} etc/xinetd.d/sane)
options=(!libtool)
install="sane.install"
#source=(http://www.sane-project.org/snapshots/sane-backends-git${pkgver}.tar.gz)
source=(${_gitname}::git://git.debian.org/sane/sane-backends.git 
		'sane.xinetd'
        'saned.socket'
        'saned.service')
md5sums=('SKIP' 
		'da946cc36fb83612162cf9505986d4b2'
		'e57e9e15528f47f5f1b3f1411135ed5d'
		'e44bd4c994a52d6f472463d1eb0a03be')

pkgver() {
	cd $srcdir/${_gitname}
	git describe --always | sed 's|-|.|g' | tr -d [A-z]
}

build() {
	cd $srcdir/${_gitname}

	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--with-docdir=/usr/share/doc/sane \
		--enable-avahi \
		--enable-pthread \
		--disable-rpath \
		--disable-locking || return 1
	make
}

package () {
	cd $srcdir/${_gitname}
	make DESTDIR="${pkgdir}" install || return 1
	# fix hp officejets
	echo "#hpaio" >> "${pkgdir}/etc/sane.d/dll.conf"
	# install udev files
	install -D -m0644 tools/udev/libsane.rules \
		"${pkgdir}/usr/lib/udev/rules.d/53-sane.rules"
	# fix udev rules
	sed -i 's|NAME="%k", ||g' "${pkgdir}/usr/lib/udev/rules.d/53-sane.rules"
	
	# install xinetd file
	install -D -m644 "${srcdir}/sane.xinetd" "${pkgdir}/etc/xinetd.d/sane"
	
	# Install the pkg-config file
	install -D -m644 tools/sane-backends.pc \
		"${pkgdir}/usr/lib/pkgconfig/sane-backends.pc"
	# install systemd files
	install -D -m644 ${srcdir}/saned.socket \
		"${pkgdir}/usr/lib/systemd/system/saned.socket"
	install -D -m644 ${srcdir}/saned.service \
		"${pkgdir}/usr/lib/systemd/system/saned@.service"
}
