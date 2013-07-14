# Mantainer Jens Staal <staal1978@gmail.com>

pkgbase=llvmlinux
pkgname=${pkgbase}-git-git

pkgdesc="The Linux Kernel built with (trunk) LLVM/Clang"
depends=('coreutils' 'linux-firmware' 'mkinitcpio')
optdepends=('crda: to set the correct wireless channels of your country')
backup=("etc/mkinitcpio.d/${pkgbase}.preset")
install=llvmlinux.install

pkgver=3.10.10131.g63345b4

pkgrel=1
url="http://llvm.linuxfoundation.org/index.php/Main_Page"
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('git' 'quilt' 'python2' 'cmake' 'llvm' 'clang') 
options=(!strip)

#add the source checkouts in sources to avoid having to repeat them.
source=('llvmlinux'::'git://git.linuxfoundation.org/llvmlinux.git' \
'kernel'::'git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git' 'https://projects.archlinux.org/svntogit/packages.git/snapshot/packages-packages/linux.tar.gz' \
'llvm'::'git+http://llvm.org/git/llvm.git' \
'clang'::'git+http://llvm.org/git/clang.git' 'compiler-rt'::'git+http://llvm.org/git/compiler-rt.git' \
'llvmlinux.preset')
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' '435f343ded7f588d4120a70496eb0f6f')

export CC=clang
export CXX=clang++
export KARCH=x86
#export USE_ARCH_CONFIG="yes"
export USE_ARCH_PATCH="yes"

#32-bit build assume i586, so we need a variable for that
if [ ${CARCH} == i686 ]; then
	_lll_target=i586
else
	_lll_target=x86_64
fi

pkgver() {
	cd "${srcdir}/kernel"
	git describe | sed 's/^v//;s/-/./g'
}

prepare() {
	#ok some hacking needed to get this working...
	ln -s ${srcdir}/kernel ${srcdir}/llvmlinux/arch/all/kernel.git
	mkdir -p ${srcdir}/llvmlinux/toolchain/clang/src
	ln -s ${srcdir}/llvm ${srcdir}/llvmlinux/toolchain/clang/src/llvm
	ln -s ${srcdir}/clang ${srcdir}/llvmlinux/toolchain/clang/src/clang
	ln -s ${srcdir}/compiler-rt ${srcdir}/llvmlinux/toolchain/clang/src/compiler-rt

	_archstuff="${srcdir}/packages-packages/linux/trunk"

############################## ARCH config ####################################
	if [ ${USE_ARCH_CONFIG} == yes ]; then
	
	#add Arch linux kernel config to build
	#32-bit and 64-bit configs for the latest Arch linux kernel
	if [ ${CARCH} == i686 ]; then
		cp ${_archstuff}/config ${srcdir}/llvmlinux/targets/${_lll_target}/config_i586
		_config=${srcdir}/llvmlinux/targets/${_lll_target}/config_i586
	else
		cp ${_archstuff}/config.x86_64 ${srcdir}/llvmlinux/targets/${_lll_target}/config_x86_64
		_config=${srcdir}/llvmlinux/targets/${_lll_target}/config_x86_64
	fi

	#fixing some configuration options
	sed -i 's|CONFIG_LOCALVERSION="-ARCH"|CONFIG_LOCALVERSION="-llvmlinux"|g' ${_config}

	fi
################################################################################

############################## ARCH patch ######################################
	if [ ${USE_ARCH_PATCH} == yes ]; then

	#patch kernel sources with Arch linux kernel patches
	cp ${_archstuff}/*.patch ${srcdir}/llvmlinux/targets/${_lll_target}/patches/

	fi
################################################################################

	rm -rf ${srcdir}/bin
	mkdir -p ${srcdir}/bin
	ln -s /usr/bin/python2 ${srcdir}/bin/python
	export PATH=${srcdir}/bin:${PATH}

	#todo: import ideas from linux-git to easily add alternative config and patches
	#to the build...
}

build() {
	cd ${srcdir}/llvmlinux/targets/${_lll_target}/
	make kernel-build
}

package() {
	cd ${srcdir}/llvmlinux/targets/${_lll_target}/src/linux

	# get kernel version
	_kernver="$(make LOCALVERSION= kernelrelease)"
	_basekernel=${_kernver%%-*}
	_basekernel=${_basekernel%.*}

	mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
	make LOCALVERSION= INSTALL_MOD_PATH="$pkgdir" modules_install
	cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgbase}"

	# add vmlinux
  	install -D -m644 vmlinux "${pkgdir}/usr/src/linux-${_kernver}/vmlinux"

  	# set correct depmod command for install
  	cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
  	true && install=${install}.pkg
  	sed \
    	 -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/" \
    	 -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/" \
    	 -i "${startdir}/${install}"

  	# install mkinitcpio preset file for kernel
  	install -D -m644 "${srcdir}/llvmlinux.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"
  	sed \
    	 -e "1s|'linux.*'|'${pkgbase}'|" \
    	 -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-${pkgbase}\"|" \
    	 -e "s|default_image=.*|default_image=\"/boot/initramfs-${pkgbase}.img\"|" \
    	 -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-${pkgbase}-fallback.img\"|" \
    	 -i "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  	# remove build and source links
  	rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
  	# remove the firmware
  	rm -rf "${pkgdir}/lib/firmware"
  	# gzip -9 all modules to save 100MB of space
  	find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;

  	# Now we call depmod...
  	depmod -b "$pkgdir" -F System.map "$_kernver"

  	# move module tree /lib -> /usr/lib
  	mv "$pkgdir/lib" "$pkgdir/usr"

	#ensure that up-to-date Arch linux patches + config are downloaded next time
	rm ${startdir}/linux.tar.gz
	rm -rf ${srcdir}/packages-packages
}