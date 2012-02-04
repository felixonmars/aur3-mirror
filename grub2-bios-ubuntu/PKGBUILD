# Contributor: Maloy <daniel.go.mon@gmail.com>

_grub2_lua_ver=20
_grub2_gpxe_ver=12
_grub2_ntldr_ver=17
_grub2_915_ver=7

pkgname='grub2-bios-ubuntu'
pkgbase="grub2-ubuntu"

# required by AUR
(( 1 )) && pkgname=("grub2-common-ubuntu" "grub2-bios-ubuntu")

pkgver='1.99'
pkgrel=6
pkgdesc="A less verbose GRUB2 with Ubuntu patches"
url="http://www.gnu.org/software/grub/"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('bdf-unifont' 'python2' 'xz' 'autogen' 'texinfo' 'help2man' 'gettext' 'device-mapper')
options=(strip purge docs zipman !emptydirs)
replaces=('grub2-common' 'grub2-bios')

#	"http://alpha.gnu.org/gnu/grub/grub-${pkgver}.tar.xz"
source=("http://archive.ubuntu.com/ubuntu/pool/main/g/grub2/grub2_1.99.orig.tar.gz"
	"ftp://ftp.archlinux.org/other/grub2/grub2_extras_lua_r${_grub2_lua_ver}.tar.xz"
	"ftp://ftp.archlinux.org/other/grub2/grub2_extras_gpxe_r${_grub2_gpxe_ver}.tar.xz"
	"ftp://ftp.archlinux.org/other/grub2/grub2_extras_ntldr-img_r${_grub2_ntldr_ver}.tar.xz"
	"ftp://ftp.archlinux.org/other/grub2/grub2_extras_915resolution_r${_grub2_915_ver}.tar.xz"
	'grub.default'
	'grub.cfg'
	'20_memtest86+'
	'grub2_bzr_export.sh'
	"ubuntu_linux_quiet.patch"
	"ubuntu_normal_quiet.patch"
	"ubuntu_quick_boot.patch"
	"ubuntu_quiet_grub_loading.patch"
	"ubuntu_really_quiet.patch"
	"ubuntu_crashkernel.patch")

noextract=("grub2_extras_lua_r${_grub2_lua_ver}.tar.xz"
	"grub2_extras_gpxe_r${_grub2_gpxe_ver}.tar.xz"
	"grub2_extras_ntldr-img_r${_grub2_ntldr_ver}.tar.xz"
	"grub2_extras_915resolution_r${_grub2_915_ver}.tar.xz")

sha1sums=('6d0536da38224e7caf94cf2531a5f921ac057b9b'
          '9f2dbf7a3faab24ca92266400aa513fecd3895c8'
          'b04994c005910b4bf123f034b30109d5c8d6fd86'
          'e0c1a97770cc23226cf4535c029ef50b17f67974'
          '8bcaed545956bb33581e1b97ac96a2c3717ec793'
          '8f2bd9939cb4865ad91e61167c6828585e51dbbb'
          '8948d89537c12a4202df7c001e65a77030bbe5a3'
          '82a27eca5277218cf57c6c5767e0b17a72f62229'
          'beb31419045db70fee7401aa6448c220a491e2a3'
          '49d3e2901473e343449ed9dfc5f73f803fb952be'
          '3e43de881928884bf2395be97309cc8fb709d481'
          '83eccf691480df07bb9f3bbbc8de86462cf697de'
          '58d06e86303d58b24cd284c02585c958d89d8f21'
          'c1001640a40be7f047b7a6bcab1a1fadbbc85950'
          'b0554a97089f4bd57c9a349f63a7ee0030551078')

build() {
	# set architecture dependent variables
	if [ "${CARCH}" = "x86_64" ] ; then
		_EFIEMU="--enable-efiemu"
	else
		_EFIEMU="--disable-efiemu"
	fi
	_HOST="${CARCH}"

	build_grub2-common_and_bios-ubuntu
}

build_grub2-common_and_bios-ubuntu() {
    ## Apply Ubuntu specific fixes make grub2 more quiet
   	cd ${srcdir}/grub-${pkgver}
   	patch -p1 -i ${srcdir}/ubuntu_crashkernel.patch
   	patch -p1 -i ${srcdir}/ubuntu_quick_boot.patch
    patch -p1 -i ${srcdir}/ubuntu_normal_quiet.patch
    patch -p1 -i ${srcdir}/ubuntu_really_quiet.patch
    patch -p1 -i ${srcdir}/ubuntu_linux_quiet.patch
    patch -p1 -i ${srcdir}/ubuntu_quiet_grub_loading.patch
	
	# copy the source for building the common/bios package
	cp -r ${srcdir}/grub-${pkgver} ${srcdir}/grub2_bios-${pkgver}
  
	## Apply Archlinux specific fixes to enable grub2-mkconfig detect Arch kernels and initramfs
	#cd ${srcdir}/grub2_bios-${pkgver}
	#patch -p1 -i ${srcdir}/archlinux_grub2_mkconfig_fixes.patch
    
	# add the grub-extra sources
	export GRUB_CONTRIB=${srcdir}/grub2_bios-${pkgver}/grub2-extras/  
	install -d ${srcdir}/grub2_bios-${pkgver}/grub2-extras 
	bsdtar xf ${srcdir}/grub2_extras_lua_r${_grub2_lua_ver}.tar.xz \
		-C ${srcdir}/grub2_bios-${pkgver}/grub2-extras
	bsdtar xf ${srcdir}/grub2_extras_gpxe_r${_grub2_gpxe_ver}.tar.xz \
		-C ${srcdir}/grub2_bios-${pkgver}/grub2-extras
	bsdtar xf ${srcdir}/grub2_extras_ntldr-img_r${_grub2_ntldr_ver}.tar.xz \
		-C ${srcdir}/grub2_bios-${pkgver}/grub2-extras
	bsdtar xf ${srcdir}/grub2_extras_915resolution_r${_grub2_915_ver}.tar.xz \
		-C ${srcdir}/grub2_bios-${pkgver}/grub2-extras
  
	## Need to use python2
	sed -i 's|python|python2|' ${srcdir}/grub2_bios-${pkgver}/autogen.sh

	# start the actual build process
	cd ${srcdir}/grub2_bios-${pkgver}
	./autogen.sh
  
	## fix unifont.bdf location so grub-mkfont can create *.pf2 files
	sed -i 's|/usr/share/fonts/unifont|/usr/share/fonts/misc|' ${srcdir}/grub2_bios-${pkgver}/configure
  
#	mkdir ${srcdir}/grub2_bios-${pkgver}/BUILD_BIOS
#	cd ${srcdir}/grub2_bios-${pkgver}/BUILD_BIOS
  
	CFLAGS="" ./configure \
		--with-platform=pc --enable-mm-debug \
		${_EFIEMU} --host=${CARCH}-unknown-linux-gnu \
		--enable-grub-mkfont --prefix=/usr \
		--bindir=/bin --sbindir=/sbin \
		--mandir=/usr/share/man --infodir=/usr/share/info \
		--sysconfdir=/etc --enable-nls \
		--program-transform-name=s,grub,grub,
	CFLAGS="" make 
}

package_grub2-common-ubuntu() {
	pkgdesc="A less verbose GRUB2 with Ubuntu patches"
	install="grub2.install"
	depends=('xz' 'freetype2' 'device-mapper' 'gettext' 'texinfo')
	conflicts=('grub')
	backup=('boot/grub/grub.cfg' 'etc/default/grub' 'etc/grub.d/40_custom')
	cd ${srcdir}/grub2_bios-${pkgver}
	make DESTDIR=${pkgdir} install
  
	install -Dm755 ${pkgdir}/sbin/grub-install ${pkgdir}/sbin/grub_bios-install
	install -Dm755 ${pkgdir}/sbin/grub-install ${pkgdir}/sbin/grub_efi_x86_64-install
	install -Dm755 ${pkgdir}/sbin/grub-install ${pkgdir}/sbin/grub_efi_i386-install
    
	sed -i "s|^\(target_cpu\)=.*|\1=i386|; \
		s|^\(platform\)=.*|\1=pc|" \
		${pkgdir}/sbin/grub_bios-install

	sed -i "s|^\(target_cpu\)=.*|\1=x86_64|; \
		s|^\(platform\)=.*|\1=efi|" \
		${pkgdir}/sbin/grub_efi_x86_64-install

	sed -i "s|^\(target_cpu\)=.*|\1=i386|; \
		s|^\(platform\)=.*|\1=efi|" \
		${pkgdir}/sbin/grub_efi_i386-install
  
	## install extra /etc/grub.d/ files
	install -Dm755 ${srcdir}/20_memtest86+ ${pkgdir}/etc/grub.d/20_memtest86+
    
	## install /etc/default/grub (used by grub-mkconfig)
	install -Dm644 ${srcdir}/grub.default ${pkgdir}/etc/default/grub

	## install grub.cfg (needed so it doesn't get removed on upgrading because it was previously here)
	install -Dm644 ${srcdir}/grub.cfg ${pkgdir}/boot/grub/grub.cfg

	# remove platform specific files
	rm -rf ${pkgdir}/usr/lib/grub/i386-pc/
}

package_grub2-bios-ubuntu() {
	pkgdesc="A less verbose GRUB2 with Ubuntu patches"
	replaces=('grub2')
	provides=('grub2')
  
	cd ${srcdir}/grub2_bios-${pkgver}
	make DESTDIR=${pkgdir} install 

	## remove non platform-specific files
	rm -rf ${pkgdir}/{boot,bin,sbin,etc,usr/share}
	rm ${pkgdir}/usr/lib/grub/{grub-mkconfig_lib,update-grub_lib}
}
