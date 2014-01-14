# Maintainer: Gerad Munsch <gmunsch@unforgivendevelopment.com>
# Great contributor: Vi0L0 <vi0l093@gmail.com>
#                    (maintainer of main "catalyst" package(s), which this is
#                     largely based upon)
# Old maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: wonder, Eduardo "kensai" Romero
# Contributor: aidanlinz, Rip-Rip, OvsInc, Sebastian Siebert
# Other contributors: Any contributors mentioned in the main "catalyst" package
#                     as provided by Vi0L0 at http://goo.gl/fAKzx)

pkgname=catalyst-utils-test
pkgver=13.11_betaV9.95
_pkgver=`echo "$pkgver" | cut -d'_' -f1`
_betaver=`echo "$pkgver" | cut -d'V' -f2`
_reldate="01/08/2014"
_amdver=13.25.18
pkgrel=5
pkgdesc="AMD/ATI proprietary beta driver (utilities, libraries, and OpenCL) (${_pkgver} beta V${_betaver} - ${_reldate}) -- Radeon HD 2xxx, 3xxx, 4xxx NOT SUPPORTED"
url="http://support.amd.com/en-us/kb-articles/Pages/latest-linux-beta-driver.aspx"
license=('custom')
options=('staticlibs' 'libtool' '!strip' '!upx')

arch=('i686' 'x86_64')

depends=('xorg-server>=1.7.0'
         'xorg-server<1.15.0'
         'libxrandr'
         'libsm'
         'fontconfig'
         'libxcursor'
         'libxi'
         'gcc-libs'
         'libxinerama')
optdepends=('qt: to run ATi Catalyst Control Center (amdcccle)'
            'libxxf86vm: to run ATi Catalyst Control Center (amdcccle)'
            'opencl-headers: headers necessary for OpenCL development'
            'acpid: acpi event support / atieventsd')

conflicts=('libgl'
           'libcl'
           'catalyst'
           'catalyst-legacy-utils'
           'catalyst-test'
           'catalyst-test-pxp'
           'catalyst-total'
           'catalyst-total-hd234k'
           'catalyst-total-pxp'
           'catalyst-utils')

provides=('libgl'
          'libcl'
          "libatical=${pkgver}"
          'dri'
          'libtxc_dxtn'
          "catalyst-utils=${pkgver}")

source=("http://www2.ati.com/drivers/beta/amd-catalyst-${pkgver//_/-}-linux-x86.x86_64.zip"
        'catalyst.sh'
        'atieventsd.sh'
        'atieventsd.service'
        'catalyst.conf'
        'arch-fglrx-authatieventsd.patch'
        'temp_links_catalyst'
        'temp-links-catalyst.service'
        'zoqaeski_lightdm.patch')

sha256sums=('f9332672b5ffdb7deb92043aa7b740954bb13d4c71d2c50076eea7522f52862b'
            'd5583bfb5977f73b4ca65533030f490350daca9e0ed10aefe517ffb70817531e'
            '9b347c3f518ddf12bb08a3cf09afcc3096e5dd4488e7ca3445df97b392985e8b'
            '398bade6ea2cb084043d87f6580569dd54b769055cdb518e2a074124c20f2606'
            'fa043641b48f3fbd0ae22f8b9bce48d756878e2b955158fc9ad272c0db3da07a'
            'f6f520249e359d01590423c9347e61ef600342af331111c23aae475cf2a038a5'
            'efd26980888943293a7cf1d8d781b96b3bc7a5cdf23f926aa68ac4bc348b7691'
            'c97a2735f80416151b2a71504e42385c4d8d95cf42aa8f90a6c7bd5a966c54e1'
            'ec30ad592a550a64ecc85be22209af77605a629e0c84660f8ba779d9199b3325')

install=catalyst-utils.install

# AMD changed the way we need to download our package, we now have to pass a referer.
url_ref="http://support.amd.com/en-us/kb-articles/Pages/latest-linux-beta-driver.aspx"
DLAGENTS="http::/usr/bin/curl --referer ${url_ref} -o %o %u"

prepare() {
  # extract files from installer
  /bin/sh ./amd-catalyst-${pkgver//_/-}-linux-x86.x86_64.run --extract fglrx_installer-files
}

package() {
  ## Install userspace tools and libraries
  # Create directories
  install -m755 -d ${pkgdir}/etc/ati
  install -m755 -d ${pkgdir}/etc/rc.d
  install -m755 -d ${pkgdir}/etc/profile.d
  install -m755 -d ${pkgdir}/etc/acpi/events
  install -m755 -d ${pkgdir}/etc/security/console.apps
  install -m755 -d ${pkgdir}/etc/OpenCL/vendors

  install -m755 -d ${pkgdir}/usr/lib/xorg/modules/dri
  install -m755 -d ${pkgdir}/usr/lib/xorg/modules/drivers
  install -m755 -d ${pkgdir}/usr/lib/xorg/modules/extensions
  install -m755 -d ${pkgdir}/usr/lib/xorg/modules/extensions/fglrx
  install -m755 -d ${pkgdir}/usr/lib/xorg/modules/linux
  install -m755 -d ${pkgdir}/usr/lib/dri
  install -m755 -d ${pkgdir}/usr/lib/fglrx
  install -m755 -d ${pkgdir}/usr/lib/systemd/system
  install -m755 -d ${pkgdir}/usr/lib/hsa

  install -m755 -d ${pkgdir}/usr/bin

  install -m755 -d ${pkgdir}/usr/include/GL

  install -m755 -d ${pkgdir}/usr/share/applications
  install -m755 -d ${pkgdir}/usr/share/ati/amdcccle
  install -m755 -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -m755 -d ${pkgdir}/usr/share/man/man8
  install -m755 -d ${pkgdir}/usr/share/pixmaps

  # X.org driver
  if [ "${CARCH}" = "i686" ]; then
    cd ${srcdir}/fglrx_installer-files/xpic/usr/X11R6/lib/modules
  elif [ "${CARCH}" = "x86_64" ]; then
    cd ${srcdir}/fglrx_installer-files/xpic_64a/usr/X11R6/lib64/modules
  fi

  install -m755 *.so ${pkgdir}/usr/lib/xorg/modules
  install -m755 drivers/*.so ${pkgdir}/usr/lib/xorg/modules/drivers
  install -m755 linux/*.so ${pkgdir}/usr/lib/xorg/modules/linux
  install -m755 extensions/fglrx/fglrx-libglx.so ${pkgdir}/usr/lib/xorg/modules/extensions/fglrx/fglrx-libglx.so
  ln -snf /usr/lib/xorg/modules/extensions/fglrx/fglrx-libglx.so ${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so

  # Controlcenter / libraries
  if [ "${CARCH}" = "i686" ]; then
    cd ${srcdir}/fglrx_installer-files/arch/x86/usr
    _lib=lib
  elif [ "${CARCH}" = "x86_64" ]; then
    cd ${srcdir}/fglrx_installer-files/arch/x86_64/usr
    _lib=lib64
  fi

  install -m755 X11R6/bin/* ${pkgdir}/usr/bin
  install -m755 sbin/* ${pkgdir}/usr/bin
  install -m755 X11R6/${_lib}/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib/fglrx
  ln -snf /usr/lib/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib/fglrx/libGL.so.1.2
  ln -snf /usr/lib/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib/fglrx-libGL.so.1.2
  ln -snf /usr/lib/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib/libGL.so.1.2
  ln -snf /usr/lib/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib/libGL.so.1
  ln -snf /usr/lib/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib/libGL.so
  install -m755 X11R6/${_lib}/libAMDXvBA.so.1.0 ${pkgdir}/usr/lib
  ln -snf libAMDXvBA.so.1.0 ${pkgdir}/usr/lib/libAMDXvBA.so.1
  ln -snf libAMDXvBA.so.1.0 ${pkgdir}/usr/lib/libAMDXvBA.so
  install -m755 X11R6/${_lib}/libatiadlxx.so ${pkgdir}/usr/lib
  install -m755 X11R6/${_lib}/libfglrx_dm.so.1.0 ${pkgdir}/usr/lib
  install -m755 X11R6/${_lib}/libXvBAW.so.1.0 ${pkgdir}/usr/lib
  ln -snf libXvBAW.so.1.0 ${pkgdir}/usr/lib/libXvBAW.so.1
  ln -snf libXvBAW.so.1.0 ${pkgdir}/usr/lib/libXvBAW.so
  install -m644 X11R6/${_lib}/*.a ${pkgdir}/usr/lib
  install -m644 X11R6/${_lib}/*.cap ${pkgdir}/usr/lib
  install -m755 X11R6/${_lib}/modules/dri/*.so ${pkgdir}/usr/lib/xorg/modules/dri
  install -m755 ${_lib}/*.so* ${pkgdir}/usr/lib
  install -m755 ${_lib}/hsa/* ${pkgdir}/usr/lib/hsa

  ## QT libs (only 2 files) - un-comment 2 lines below if you don't want to install qt package
#  install -m755 -d ${pkgdir}/usr/share/ati/${_lib}
#  install -m755 share/ati/${_lib}/*.so* ${pkgdir}/usr/share/ati/${_lib}

  ln -snf /usr/lib/xorg/modules/dri/fglrx_dri.so ${pkgdir}/usr/lib/dri/fglrx_dri.so
  ln -snf libfglrx_dm.so.1.0 ${pkgdir}/usr/lib/libfglrx_dm.so.1
  ln -snf libfglrx_dm.so.1.0 ${pkgdir}/usr/lib/libfglrx_dm.so
  ln -snf libatiuki.so.1.0 ${pkgdir}/usr/lib/libatiuki.so.1
  ln -snf libatiuki.so.1.0 ${pkgdir}/usr/lib/libatiuki.so
  ln -snf libOpenCL.so.1 ${pkgdir}/usr/lib/libOpenCL.so

  cd ${srcdir}/fglrx_installer-files/common
  patch -Np2 -i ${srcdir}/arch-fglrx-authatieventsd.patch
  patch -Np2 -i ${srcdir}/zoqaeski_lightdm.patch
  install -m644 etc/ati/* ${pkgdir}/etc/ati
  chmod 755 ${pkgdir}/etc/ati/authatieventsd.sh

  install -m644 etc/security/console.apps/amdcccle-su ${pkgdir}/etc/security/console.apps

  install -m755 usr/X11R6/bin/* ${pkgdir}/usr/bin
  install -m644 usr/include/GL/*.h ${pkgdir}/usr/include/GL
  install -m755 usr/sbin/*.sh ${pkgdir}/usr/bin
  install -m644 usr/share/ati/amdcccle/* ${pkgdir}/usr/share/ati/amdcccle
  install -m644 usr/share/icons/*.xpm ${pkgdir}/usr/share/pixmaps
  install -m644 usr/share/man/man8/*.8 ${pkgdir}/usr/share/man/man8
  install -m644 usr/share/applications/*.desktop ${pkgdir}/usr/share/applications

  # ACPI example files
  install -m755 usr/share/doc/fglrx/examples/etc/acpi/*.sh ${pkgdir}/etc/acpi
  sed -i -e "s/usr\/X11R6/usr/g" ${pkgdir}/etc/acpi/ati-powermode.sh
  install -m644 usr/share/doc/fglrx/examples/etc/acpi/events/* ${pkgdir}/etc/acpi/events

  # Add ATI Events Daemon launcher
  install -m755 ${srcdir}/atieventsd.sh ${pkgdir}/etc/rc.d/atieventsd
  install -m644 ${srcdir}/atieventsd.service ${pkgdir}/usr/lib/systemd/system

  # thanks to cerebral, we dont need that damned symlink
  install -m755 ${srcdir}/catalyst.sh ${pkgdir}/etc/profile.d

  # install license
  install -m644 ${srcdir}/fglrx_installer-files/LICENSE.TXT ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 ${srcdir}/fglrx_installer-files/common/usr/share/doc/amdcccle/ccc_copyrights.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/amdcccle_copyrights.txt

  # install OpenCL files
  if [ "${CARCH}" = "i686" ]; then
    cd ${srcdir}/fglrx_installer-files/arch/x86
    _arc=32
  elif [ "${CARCH}" = "x86_64" ]; then
    cd ${srcdir}/fglrx_installer-files/arch/x86_64
    _arc=64
  fi

  install -m644 etc/OpenCL/vendors/amdocl${_arc}.icd ${pkgdir}/etc/OpenCL/vendors
  install -m755 usr/bin/clinfo ${pkgdir}/usr/bin
  install -m755 -d ${pkgdir}/etc/modules-load.d
  install -m644 ${srcdir}/catalyst.conf ${pkgdir}/etc/modules-load.d

  # workaround for the high io bug , thanks to lano1106 for finding this ugly bug! https://bbs.archlinux.org/viewtopic.php?pid=1279977#p1279977
  install -m755 ${srcdir}/temp_links_catalyst ${pkgdir}/usr/bin
  install -m644 ${srcdir}/temp-links-catalyst.service ${pkgdir}/usr/lib/systemd/system
}
