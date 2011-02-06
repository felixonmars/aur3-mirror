# Contributor: Ilya Galushko <helloy-ilya@yandex.ru>
# Contributor: M Rawash <mrawash@gmail.com>
# Contributer: N30N <archlinux@alunamation.com>
# Contributer: FrozenFox <FinalCrisisSX@Hotmail.com>

pkgname=linuxwacom-cvs
pkgver=20091107
pkgrel=2
pkgdesc="Latest development drivers for Wacom tablets"
arch=("i686" "x86_64")
url="http://linuxwacom.sourceforge.net/"
license=("GPL" "LGPL")
conflicts=("linuxwacom" "linuxwacom-dev")
provides=("linuxwacom" "linuxwacom-dev")
depends=("libxi" "ncurses" "pixman" "inputproto")
makedepends=("cvs" "tk")
optdepends=("tk: for use of wacomcpl")
options=("!libtool" "!emptydirs")
source=("10-wacom.rules" "10-wacom.fdi" "xorg-1.7.patch")
md5sums=("02d3262b7dd10791b0c74abbaac1b933" \
	"1e558d31fb6eea4b6a8486f5882b168d" \
	"638c8fde9f6bf15e364d46ed31be6994")

if [ $(uname -r) = "2.6.31-ARCH" ]; then
	source+=("http://kernel.ubuntu.com/git-repos/ubuntu/linux-2.6/drivers/hid/hid-ids.h")
	md5sums+=("284ee7a33afe6d5e853b8cf67ade2d03")
fi

_cvsroot=":pserver:anonymous@linuxwacom.cvs.sourceforge.net:/cvsroot/linuxwacom"
_cvsmod="linuxwacom-dev"

build() {
	cd ${srcdir}
	msg "Connecting to linuxwacom CVS server......."
	if [ -d ${_cvsmod}/CVS ]; then
		(cd ${_cvsmod} && cvs -z3 update -D ${pkgver} -d) || return 1
		rm -rf ${_cvsmod}-build
	else
		cvs -z3 -d ${_cvsroot} co -D ${pkgver} -f ${_cvsmod} || return 1
	fi
	cp -rf ${_cvsmod} ${_cvsmod}-build
	cd ${_cvsmod}-build

	patch -p1 -i ${srcdir}/xorg-1.7.patch || return 1

	if [ $(uname -r) = "2.6.31-ARCH" ]; then
		sed -e "s|\$(WCM_KERNEL_DIR)/drivers/hid|../../..|" \
			-i src/2.6.31/Makefile.in
	fi

	./bootstrap
	./configure \
		--x-includes=/usr/include/pixman-1 \
		--libexecdir="/usr/lib/hal" \
		--prefix=/usr \
		--enable-wacom

	make || return 1
	make DESTDIR=${pkgdir} install

	# Install udev rules
	install -D -m644 ${srcdir}/10-wacom.rules \
		${pkgdir}/etc/udev/rules.d/10-wacom.rules
	# Install hal rules
	install -D -m644 ${srcdir}/10-wacom.fdi \
		${pkgdir}/etc/hal/fdi/policy/10-wacom.fdi
}

# vim: set noet ff=unix
