# Maintainer: Alexandrov Artyom "qk4l" <tema@tem4uk.ru>
# Contributor: Giuseppe Marco "zeld" Randazzo <gmrandazzo@gmail.com>
# Great Contributor: Vi0L0 (maintainer of other catalyst drivers)

pkgname=lib32-catalyst-legacy-utils
pkgver=13.1
pkgrel=2
pkgdesc="AMD/ATI catalyst driver utilities and libraries. (32-bit) SUPPORTED RADEONS: HD 2 3 4 xxx"
arch=('i686' 'x86_64')
url="http://www.ati.amd.com"
license=('custom')
groups=('lib32')
depends=('catalyst-legacy-utils=13.1' 'xorg-server1.12>=1.7.0' 'xorg-server1.12<1.13.0' 'netkit-bsd-finger' 'libxrandr' 'libsm' 'fontconfig' 'libxcursor' 'libxi' 'gcc-libs' 'libxinerama')
optdepends=('qt: to run ATi Catalyst Control Center (amdcccle)'
	    'libxxf86vm: to run ATi Catalyst Control Center (amdcccle)'
	    'opencl-headers: headers necessary for OpenCL development')
conflicts=('lib32-libgl' 'lib32-nvidia-utils' 'lib32-ati-dri' 'lib32-catalyst-utils-pxp')
provides=('lib32-libgl' 'lib32-dri' 'lib32-libtxc_dxtn' 'lib32-libatical=${pkgver}')
install=${pkgname}.install


source=(
	#http://www2.ati.com/drivers/legacy/amd-driver-installer-catalyst-13.1-legacy-linux-x86.x86_64.zip
	http://www2.ati.com/drivers/legacy/amd-driver-installer-catalyst-${pkgver}-legacy-linux-x86.x86_64.zip
    lib32-catalyst.sh)

md5sums=('c07fd1332abe4c742a9a0d0e0d0a90de'
         'af7fb8ee4fc96fd54c5b483e33dc71c4')
build() {
  ## Unpack archive
  /bin/sh ./amd-driver-installer-catalyst-${pkgver}-legacy-linux-x86.x86_64.run --extract archive_files
}

package() {
    install -D -m755 lib32-catalyst.sh ${pkgdir}/etc/profile.d/lib32-catalyst.sh || return 1
  ## Install userspace tools and libraries
    # Create directories
      install -m755 -d "${pkgdir}/etc/OpenCL/vendors"  # since 11.11
      install -m755 -d "${pkgdir}/usr/lib32/xorg/modules/dri"
      install -m755 -d "${pkgdir}/usr/lib32/xorg/modules/drivers"
      install -m755 -d "${pkgdir}/usr/lib32/xorg/modules/extensions"
      install -m755 -d "${pkgdir}/usr/lib32/xorg/modules/extensions/fglrx" # since 11.4
      install -m755 -d "${pkgdir}/usr/lib32/xorg/modules/linux"
      install -m755 -d "${pkgdir}/usr/lib32/dri"
      install -m755 -d "${pkgdir}/usr/lib32/fglrx" # since 11.4

    # X.org driver
	cd "${srcdir}/archive_files/xpic/usr/X11R6/lib/modules" || return 1

      install -m755 *.so "${pkgdir}/usr/lib32/xorg/modules/" || return 1
      install -m755 drivers/*.so "${pkgdir}/usr/lib32/xorg/modules/drivers/" || return 1
      install -m755 linux/*.so "${pkgdir}/usr/lib32/xorg/modules/linux/" || return 1
      #install -m755 extensions/libglx.so "${pkgdir}/usr/lib/xorg/modules/extensions/" || return 1 #before 11.4
      install -m755 extensions/fglrx/fglrx-libglx.so "${pkgdir}/usr/lib32/xorg/modules/extensions/fglrx/fglrx-libglx.so" || return 1 # since 11.5
      ln -snf /usr/lib32/xorg/modules/extensions/fglrx/fglrx-libglx.so "${pkgdir}/usr/lib32/xorg/modules/extensions/libglx.so" # since 11.4
      #install -m755 extensions/libdri.so "${pkgdir}/usr/lib/xorg/modules/extensions/libdri.ati" || return 1

    # Controlcenter / libraries
	cd "${srcdir}/archive_files/arch/x86/usr" || return 1
	_lib=lib

      install -m755 X11R6/${_lib}/fglrx/fglrx-libGL.so.1.2 "${pkgdir}/usr/lib32/fglrx" || return 1 # since 11.5
      ln -snf /usr/lib32/fglrx/fglrx-libGL.so.1.2 "${pkgdir}/usr/lib32/fglrx/libGL.so.1.2" # since 11.4
      ln -snf /usr/lib32/fglrx/fglrx-libGL.so.1.2 "${pkgdir}/usr/lib32/fglrx-libGL.so.1.2" # since 11.4
      ln -snf /usr/lib32/fglrx/fglrx-libGL.so.1.2 "${pkgdir}/usr/lib32/libGL.so.1.2" # since 11.4
      ln -snf /usr/lib32/fglrx/fglrx-libGL.so.1.2 "${pkgdir}/usr/lib32/libGL.so.1" # since 11.4
      ln -snf /usr/lib32/fglrx/fglrx-libGL.so.1.2 "${pkgdir}/usr/lib32/libGL.so" # since 11.4
      install -m755 X11R6/${_lib}/libAMDXvBA.so.1.0 "${pkgdir}/usr/lib32/" || return 1 # since 11.4
      install -m755 X11R6/${_lib}/libatiadlxx.so "${pkgdir}/usr/lib32/" || return 1 # since 11.4
      install -m755 X11R6/${_lib}/libfglrx_dm.so.1.0 "${pkgdir}/usr/lib32/" || return 1 # since 11.4
      install -m755 X11R6/${_lib}/libXvBAW.so.1.0 "${pkgdir}/usr/lib32/" || return 1 # since 11.4
      install -m644 X11R6/${_lib}/*.a "${pkgdir}/usr/lib32/" || return 1 # really needed?
      install -m644 X11R6/${_lib}/*.cap "${pkgdir}/usr/lib32/" || return 1
      install -m755 X11R6/${_lib}/modules/dri/*.so "${pkgdir}/usr/lib32/xorg/modules/dri/" || return 1
      install -m755 ${_lib}/*.so* "${pkgdir}/usr/lib32/" || return 1

      ln -snf /usr/lib32/xorg/modules/dri/fglrx_dri.so ${pkgdir}/usr/lib32/dri/fglrx_dri.so
	# Create symlinks	
      cd "$pkgdir/usr/lib32/" || return 1
      ln -snf XvBAW.so.1.0 "${pkgdir}/usr/lib32/libXvBAW.so.1" # since 11.4
      ln -snf libXvBAW.so.1.0 "${pkgdir}/usr/lib32/libXvBAW.so" # since 11.4
      ln -snf libAMDXvBA.so.1.0 "${pkgdir}/usr/lib32/libAMDXvBA.so.1" # since 11.4
      ln -snf libAMDXvBA.so.1.0 "${pkgdir}/usr/lib32/libAMDXvBA.so" # since 11.4
      ln -snf libfglrx_dm.so.1.0 "${pkgdir}/usr/lib32/libfglrx_dm.so.1"
      ln -snf libfglrx_dm.so.1.0 "${pkgdir}/usr/lib32/libfglrx_dm.so"
      ln -snf libatiuki.so.1.0 "${pkgdir}/usr/lib32/libatiuki.so.1"
      ln -snf libatiuki.so.1.0 "${pkgdir}/usr/lib32/libatiuki.so"
      ln -snf libOpenCL.so.1 "${pkgdir}/usr/lib32/libOpenCL.so" # since 11.11


    # since 11.11 : opencl files
	cd "${srcdir}/archive_files/arch/x86" || return 1
	_arc=32

      # since 11.11: amd's vendor file for it's opencl library
      install -m644 etc/OpenCL/vendors/amdocl${_arc}.icd "${pkgdir}/etc/OpenCL/vendors/" || return 1

}
