# Contributor: blasse <koralik(at)gmail(dot)com>
# Contributor: webjdm
# Contributor: kensai

pkgname=catalyst-ice
pkgver=9.5
pkgrel=1
_kernver=2.6.29-ice
pkgdesc="Proprietary AMD/ATI kernel drivers for Radeon brand cards. For Kernel26-ice"
arch=('i686' 'x86_64')
url="http://www.ati.amd.com"
license=('custom') 
depends=("catalyst-utils>=${pkgver}" "kernel26>=2.6.29" "kernel26<2.6.30")
replaces=('ati-fglrx' 'fglrx') # Yay rebranding
conflicts=('catalyst')
provides=('catalyst')
install=catalyst.install
source=(http://www2.ati.com/drivers/linux/ati-driver-installer-${pkgver/./-}-x86.x86_64.run \
       2.6.29.diff)
md5sums=('5b6cf76693b66d84d75255f93b18c518'
         '3a5896c62b6a37f0f1f752017d95762d')

build() {
  /bin/sh ./ati-driver-installer-${pkgver/./-}-x86.x86_64.run --extract archive_files

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
