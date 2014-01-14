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

pkgname=catalyst-dkms-test
pkgver=13.11_betaV9.95
_pkgver=`echo "$pkgver" | cut -d'_' -f1`
_betaver=`echo "$pkgver" | cut -d'V' -f2`
_reldate="01/08/2014"
_amdver=13.25.18
pkgrel=5
pkgdesc="AMD/ATI proprietary beta driver (DKMS module) (${_pkgver} beta V${_betaver} - ${_reldate}) -- Radeon HD 2xxx, 3xxx, 4xxx NOT SUPPORTED"
arch=('i686' 'x86_64')
url="http://support.amd.com/en-us/kb-articles/Pages/latest-linux-beta-driver.aspx"
license=('custom')
options=('staticlibs' 'libtool' '!strip' '!upx')
depends=('dkms')
optdepends=('linux-headers: build the module against Arch kernel'
            'linux-ck-headers: build the module against Linux-ck kernel'
            'linux-lts-headers: build the module against LTS Arch kernel')

# try to ensure that this package cannot be installed concurrently with any of
# the other 'catalyst'-series packages
conflicts=('catalyst'
           'catalyst-dkms'
           'catalyst-test'
           'catalyst-test-pxp'
           'catalyst-total'
           'catalyst-total-pxp')
#provides=('catalyst' 'catalyst-test')

source=("http://www2.ati.com/drivers/beta/amd-catalyst-${pkgver//_/-}-linux-x86.x86_64.zip"
        'dkms.conf'
        'makefile_compat.patch'
        'lano1106_fglrx_intel_iommu.patch'
        'lano1106_kcl_agp_13_4.patch'
        'lano1106_fglrx-13.8_proc.patch'
        'arch_3.13_kernel_acpi_node.patch')

sha256sums=('f9332672b5ffdb7deb92043aa7b740954bb13d4c71d2c50076eea7522f52862b'
            '6b304e0b826ccd11942b3d4993063eaf41879f38b9eccce90e69253f6ec64816'
            'd344df75ffbe9bd899e288862f41983c2e24b5eff3e7e8cf02d4891eeb137fff'
            'd7ab220204976b5802dbfa7cbd05ec0c5a9ff3524a2020b1b8deff4f601a05fa'
            '37344e6949b391a54491bcba68c2239393e442a00114ee36fe25d775d9656520'
            '67504f6dbf9f880d0dda7e85e372abb86088fc033ba2c30d28c425c36950985b'
            '61d223007c03b1bbdaf22509aeeb60113b0f528d6d5153fe1d7471223a1b0126')

install=catalyst.install

# AMD changed the way we need to download our package, we now have to pass a referer.
url_ref="http://support.amd.com/en-us/kb-articles/Pages/latest-linux-beta-driver.aspx"
DLAGENTS="http::/usr/bin/curl --referer ${url_ref} -o %o %u"

prepare() {
  # add dependency on catalyst-utils-test
  depends=(${depends[@]} "catalyst-utils-test=${pkgver}")
}

package() {
  cd ${srcdir}

  # determine architecture
  if [ "${CARCH}" = "x86_64" ]; then
    _archdir=x86_64
  else
    _archdir=x86
  fi

  # extract files from installer
  /bin/sh ./amd-catalyst-${pkgver//_/-}-linux-x86.x86_64.run --extract fglrx_installer-files

  cd fglrx_installer-files

  # patch sources
  #patch -Np1 -i ../makefile_compat.patch # XXX: not sure if we need this...
  patch -Np1 -i ../lano1106_fglrx_intel_iommu.patch
  patch -Np1 -i ../lano1106_kcl_agp_13_4.patch
  patch -Np1 -i ../lano1106_fglrx-13.8_proc.patch
  patch -Np1 -i ../arch_3.13_kernel_acpi_node.patch

  # install some directories
  install -dm755 "${pkgdir}/usr/lib/modprobe.d"
  install -dm755 "${pkgdir}/usr/src/fglrx-${pkgver}-${pkgrel}"

  # copy sources
  cp -r common/lib/modules/fglrx/build_mod/* "${pkgdir}/usr/src/fglrx-${pkgver}-${pkgrel}/"
  cp "arch/${_archdir}/lib/modules/fglrx/build_mod/libfglrx_ip.a" "${pkgdir}/usr/src/fglrx-${pkgver}-${pkgrel}/"

  # copy dkms.conf and set version
  cp ${srcdir}/dkms.conf "${pkgdir}/usr/src/fglrx-${pkgver}-${pkgrel}/"
  sed -i -e "s/@VERSION@/${pkgver}-${pkgrel}/" "${pkgdir}/usr/src/fglrx-${pkgver}-${pkgrel}/dkms.conf"

  # blacklist open-source radeon module from loading
  echo "blacklist radeon" >> "${pkgdir}/usr/lib/modprobe.d/catalyst.conf"

  # install license
  install -Dm644 "common/usr/share/doc/fglrx/LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.TXT"
}
