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

pkgname=lib32-catalyst-utils-test
pkgver=13.11_betaV9.95
_pkgver=`echo "$pkgver" | cut -d'_' -f1`
_betaver=`echo "$pkgver" | cut -d'V' -f2`
_reldate="01/08/2014"
_amdver=13.25.18
pkgrel=5
pkgdesc="AMD/ATI proprietary beta driver (32-bit \"multilib\" utilities, libraries, and OpenCL) (${_pkgver} beta V${_betaver} - ${_reldate}) -- Radeon HD 2xxx, 3xxx, 4xxx NOT SUPPORTED"
url="http://support.amd.com/en-us/kb-articles/Pages/latest-linux-beta-driver.aspx"
license=('custom')
options=('staticlibs' 'libtool' '!strip' '!upx')

arch=('x86_64')

groups=('lib32')

depends=('lib32-libxext'
         'lib32-libdrm')

conflicts=('catalyst-test'
           'catalyst-test-pxp'
           'catalyst-total'
           'catalyst-total-hd234k'
           'catalyst-total-pxp'
           'lib32-catalyst-utils'
           'lib32-libgl'
           'lib32-nvidia-utils'
           'lib32-ati-dri'
           'lib32-catalyst-utils-pxp')
           
provides=('lib32-libgl'
          'lib32-dri'
          'lib32-libtxc_dxtn'
          "lib32-catalyst-utils=${pkgver}")
source=("http://www2.ati.com/drivers/beta/amd-catalyst-${pkgver//_/-}-linux-x86.x86_64.zip"
        'lib32-catalyst.sh')
        
sha256sums=('f9332672b5ffdb7deb92043aa7b740954bb13d4c71d2c50076eea7522f52862b'
            '1f4f611ed80e2626ef39486020a06c328c15dad76e1365a4bd553342060ff409')
            
install=${pkgname}.install

# AMD changed the way we need to download our package, we now have to pass a referer.
url_ref="http://support.amd.com/en-us/kb-articles/Pages/latest-linux-beta-driver.aspx"
DLAGENTS="http::/usr/bin/curl --referer ${url_ref} -o %o %u"

prepare() {
  # add dependency on catalyst-utils-test
  depends=(${depends[@]} "catalyst-utils-test=${pkgver}")

  # extract files from installer
  /bin/sh ./amd-catalyst-${pkgver//_/-}-linux-x86.x86_64.run --extract fglrx_installer-files
}

package() {
  cd ${srcdir}

  install -D -m755 lib32-catalyst.sh ${pkgdir}/etc/profile.d/lib32-catalyst.sh

  cd ${srcdir}/fglrx_installer-files/arch/x86/usr
  install -dm755 ${pkgdir}/usr/lib32
  install -dm755 ${pkgdir}/usr/lib32/fglrx
  install -dm755 ${pkgdir}/usr/lib32/xorg/modules/dri
  install -dm755 ${pkgdir}/usr/lib32/hsa
  install -m755 lib/*.so* ${pkgdir}/usr/lib32
  install -m755 lib/hsa/* ${pkgdir}/usr/lib32/hsa
  install -m755 X11R6/lib/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib32/fglrx
  ln -sf /usr/lib32/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib32/fglrx/libGL.so.1.2
  ln -sf /usr/lib32/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib32/fglrx-libGL.so.1.2
  ln -sf /usr/lib32/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib32/libGL.so.1.2
  ln -sf /usr/lib32/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib32/libGL.so.1
  ln -sf /usr/lib32/fglrx/fglrx-libGL.so.1.2 ${pkgdir}/usr/lib32/libGL.so
  install -m755 X11R6/lib/libAMDXvBA.so.1.0 ${pkgdir}/usr/lib32
  install -m755 X11R6/lib/libatiadlxx.so ${pkgdir}/usr/lib32
  install -m755 X11R6/lib/libfglrx_dm.so.1.0 ${pkgdir}/usr/lib32
  install -m755 X11R6/lib/libXvBAW.so.1.0 ${pkgdir}/usr/lib32
  install -m755 X11R6/lib/modules/dri/*.so ${pkgdir}/usr/lib32/xorg/modules/dri
  ln -snf /usr/lib32/xorg/modules/dri ${pkgdir}/usr/lib32/dri

  cd $pkgdir/usr/lib32
  ln -sf libfglrx_dm.so.1.0 libfglrx_dm.so.1
  ln -sf libAMDXvBA.so.1.0 libAMDXvBA.so.1
  ln -sf libAMDXvBA.so.1.0 libAMDXvBA.so
  ln -sf libXvBAW.so.1.0 libXvBAW.so.1
  ln -sf libXvBAW.so.1.0 libXvBAW.so
  ln -sf libatiuki.so.1.0 libatiuki.so.1
  ln -sf libatiuki.so.1.0 libatiuki.so
  ln -sf libOpenCL.so.1 libOpenCL.so

  # install OpenCL files
  install -m755 -d ${pkgdir}/etc/OpenCL/vendors
  install -m644 ${srcdir}/fglrx_installer-files/arch/x86/etc/OpenCL/vendors/amdocl32.icd ${pkgdir}/etc/OpenCL/vendors

  # install license
  install -m755 -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 ${srcdir}/fglrx_installer-files/LICENSE.TXT ${pkgdir}/usr/share/licenses/${pkgname}
}
