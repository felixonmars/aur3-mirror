_kernver=2.6.29-ARCH

pkgname=catalyst-old
pkgver=9.3
pkgrel=2
pkgdesc="Old proprietary AMD/ATI kernel drivers for Radeon brand cards. Support for R300/R700 chipsets."
arch=('i686' 'x86_64')
url="http://www.ati.amd.com"
license=('custom') 
depends=("catalyst-utils-old>=${pkgver}" "kernel26>=2.6.29" "kernel26<2.6.30")
replaces=('ati-fglrx' 'fglrx') # Yay rebranding
conflicts=('catalyst')
provides=('catalyst')
install=catalyst.install
source=(http://www2.ati.com/drivers/linux/ati-driver-installer-${pkgver/./-}-x86.x86_64.run \
	flush_tlb_page.patch 2.6.29.diff)
md5sums=('3875441c1e6f9bd7e0c2d006eb0708b3'
         'e743aab05f6cb815b2ebc5cf8ea2886a'
         '3a5896c62b6a37f0f1f752017d95762d')

build() {
  /bin/sh ./ati-driver-installer-${pkgver/./-}-x86.x86_64.run --extract archive_files

  # Fix flush_tlb_page
  patch -Np0 -i ${srcdir}/flush_tlb_page.patch || return 1

  # Fix 2.6.29 kernel
  cd ${srcdir}/archive_files/common
  patch -p0 <${srcdir}/2.6.29.diff || return 1

  if [ "${CARCH}" = "x86_64" ]; then
    BUILDARCH=x86_64
    _archdir=x86_64
  fi
  if [ "${CARCH}" = "i686" ]; then
    BUILDARCH=i386
    _archdir=x86
  fi

  cd "${srcdir}/archive_files/common/lib/modules/fglrx/build_mod"
  cp "${srcdir}/archive_files/arch/${_archdir}/lib/modules/fglrx/build_mod/libfglrx_ip.a.GCC4" . || return 1
  cp 2.6.x/Makefile . || return 1

  make -C /lib/modules/${_kernver}/build SUBDIRS="`pwd`" ARCH=${BUILDARCH} modules || return 1

  install -m755 -d "${pkgdir}/lib/modules/${_kernver}/video/"
  install -m644 fglrx.ko "${pkgdir}/lib/modules/${_kernver}/video/" || return 1
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"

  # License
  install -m644 "${srcdir}/archive_files/ATI_LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/" || return 1

  sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/" $startdir/*.install
}