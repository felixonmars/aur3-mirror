# Maintainer: divinesheet <divinesheet at yahoo dot com>
# This PKGBUILD is a modified xen and xen-git PKGBUILD. Most credits go to these maintainers (kantras and tritron).

pkgname=xen-4.5-git
pkgver=r30113.75ac8cf
pkgrel=3
pkgdesc="Xen 4.5 Staging (untested)"
provides="xen"
arch=(
	i686
	x86_64
)
url="http://www.xenproject.org/"
license=(GPL2)
depends=(
	bluez-libs
	bridge-utils
	bzip2
	curl
	e2fsprogs
	glibc
	gnutls
	iasl
	inetutils
	iproute2
	libaio
	libcap-ng
	libiscsi
	libjpeg-turbo
	libpng
	libseccomp
	lzo2
	nss
	pixman
	pciutils
	pkg-config
	python
	python2
	sdl
	yajl
	spice
	spice-protocol
	urlgrabber
	usbredir
	usleep
	xz
	zlib
)
[[ "$CARCH" == "x86_64" ]] && depends+=(lib32-glibc)
makedepends=(
	bin86
	cmake
	dev86
	dtc
	git
	ghostscript
	libcacard
	iasl
	markdown
	transfig
	texi2html
	ocaml
	ocaml-findlib
	figlet
	wget
)
optdepends=(
	'xen-docs: Official Xen Documentation'
	'openvswitch: Optional Networking support'
)
conflicts=(
	xen-4.2{,-git}
	xen-4.3{,-git}
	xen-4.4{,-git}
	xen-4.5
	xen{,-rc,-git,-gdbsx}
)
backup=(
etc/xen/xl.conf
etc/xen/grub.conf
)
options=(
	!buildflags
	!strip
)
install=$pkgname.install
changelog=ChangeLog
source=(
	09_xen
	grub.conf
	efi-xen.cfg
)
sha256sums=(
	'06c9f6140f7ef4ccfc4b1a7d9732a673313e269733180f53afcd9e43bf6c26bb'
	'3f0af16958c3e057b9baa5afc47050d9adf7dd553274dd97ae4f35938fefb568'
	'592f9ed540adbe94095071e4c327aefe85ee5ca057a086a9935847f36aca3be8'
)

_gitroot="git://xenbits.xen.org/xen.git"
_gitname="xen"

prepare() {
	cd "$srcdir"
	if [ -d $srcdir/$_gitname ] ; then
		msg "Git checkout:  Updating existing tree"
		cd $_gitname && git pull origin
		msg "Git checkout:  Tree has been updated"
	else
		msg "Git checkout:  Retrieving sources"
		git clone $_gitroot --branch staging-4.5
	fi
	rm -rf "$srcdir/$_gitname-build"
	cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"

	cd "$srcdir/$_gitname-build"

	# Fix Install Paths
	sed -i 's:/sbin:/bin:' config/StdGNU.mk
	sed -i 's:/var/lock:/run/lock:' config/StdGNU.mk
	sed -i 's:/var/run:/run:' config/StdGNU.mk
	
	# Bypass distribution auto-discovery
	echo "CONFIG_LEAF_DIR=default" >> .config
	echo "XEN_RUN_DIR=/run/xen" >> .config
	echo "XEN_LOCK_DIR=/run/lock" >> .config
	echo "SUBSYS_DIR=/run" >> .config
	echo "INITD_DIR=/etc/init.d/" >> .config

}

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	unset CFLAGS
	cd "$srcdir/$_gitname-build"
	./autogen.sh
	./configure PYTHON=/usr/bin/python2 \
	--prefix=/usr \
	--localstatedir=/run \
	--with-extra-qemuu-configure-args=" \
	--enable-spice \
	--enable-usb-redir \
	--audio-drv-list=oss,alsa,sdl,pa "
	make LANG=C PYTHON=python2 dist
}

package() {
	cd "$srcdir/$_gitname-build"

	make DESTDIR="$pkgdir" LANG=C PYTHON=python2 install

	# Install files from AUR package
	cd ../
	install -Dm644 grub.conf "$pkgdir"/etc/xen/grub.conf
	install -Dm755 09_xen "$pkgdir"/etc/grub.d/09_xen
	install -Dm644 efi-xen.cfg "$pkgdir"/etc/xen/efi-xen.cfg

	cd "$pkgdir"

	# Fix paths in scripts
	for file in usr/lib/systemd/system/* ; do
		sed -i 's:/run/run/:/run/:' $file
		sed -i 's:/run/lib/xenstored:/var/lib/xenstored:' $file
	done

	sed -i '/^xen/!d;/xen-scsibk/d' "$pkgdir"/usr/lib/modules-load.d/xen.conf

	mv etc/init.d/* etc/xen/scripts/

	mv var/xen/dump var/lib/xen/
	mkdir var/log/xen/console

	# Sanitize library path (if lib64 exists)
	if [[ -d usr/lib64 ]]; then
		cd usr/
		cp -r lib64/* lib/
		rm -rf lib64
		cd ../
	fi

	# If EFI binaries build, move to /boot
	if [[ -f usr/lib/efi/xen.efi ]]; then
		mv usr/lib/efi/xen-4.5.*.efi "$pkgdir"/boot/
		rm -rf usr/lib/efi
	fi

	# Compress syms file and move to a share location
	gzip boot/xen-syms-*
	mv boot/xen-syms-*.gz usr/share/xen

	##### Kill unwanted stuff #####
	# hypervisor symlinks
	rm -f boot/xen{,-4,-4.5}.gz

	# Documentation cleanup ( see xen-docs package )
	rm -rf usr/share/doc
	rm -rf usr/share/man

	# Pointless helper cleanup
	rm -f usr/bin/xen-python-path

	# Unnecessary qemu support files
	rm -rf usr/bin/qemu-*-xen
	rm -rf usr/etc
	rm -rf usr/libexec
	rm usr/share/qemu-xen/qemu/{palcode,openbios}-*
	rm usr/share/xen/qemu/openbios-*

	# Clean up udev rules naming
	mv etc/udev/rules.d/xen-backend.rules etc/udev/rules.d/40-xen-backend.rules

	# Cleanup additional leftover files
	rm -rf usr/include/cacard 
	rm -f usr/lib/libcacard*
	rm -f usr/lib/pkgconfig/libcacard.pc

	# Clean up left over empty directories
	rm -rf var/lock var/xen etc/init.d

	# adhere to Static Library Packaging Guidelines
	rm -rf usr/lib/*.a
	
	if [[ -e usr/sbin ]]; then
		mv usr/sbin/* usr/bin/
		rmdir usr/sbin/
	fi

	if [[ -e sbin ]]; then
		mv sbin/* usr/bin/
		rmdir sbin/
	fi

	if [[ -e bin ]]; then
		mv bin/* usr/bin/
		rmdir bin/
	fi
}