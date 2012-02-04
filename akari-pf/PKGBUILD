# Adapted for kernel26-pf: Christos Nouskas <nous at archlinux.us>
# Maintainer: Jamie Nguyen <jamie AT tomoyolinux.co.uk>

pkgname=akari-pf
_pkgname=akari
pkgver=1.0.11
_timestamp=20110401
_basever=2.6.37
_kernpkgver=-pf
_kernver=${_basever}-pf
_ccstoolsver=1.8.1.20110401
pkgrel=1
pkgdesc='TOMOYO Linux 1.8.x Linux Kernel Module for kernel26-pf'
arch=('i686' 'x86_64')
url='http://akari.sourceforge.jp/'
license=('GPL')
depends=('kernel26-pf>=2.6.37' 'kernel26-pf<2.6.38')
optdepends=("ccs-tools>=${_ccstoolsver}")
install=akari.install
source=("http://sourceforge.jp/frs/redir.php?f=/akari/49272/${_pkgname}-${pkgver}-${_timestamp}.tar.gz")
noextract=("${_pkgname}-${pkgver}-${_timestamp}.tar.gz")
sha256sums=('ab718cf3415c49bbf3dbe42240c6f336cd70e8f7549d3c261c02b6d14744b6b3')

build()
{
# use kernel26-pf headers
  cp -a /usr/src/linux-${_kernver} $srcdir/
  cd "${srcdir}/linux-${_kernver}"
# extract akari into the kernel source
  tar -xf "${srcdir}/${_pkgname}-${pkgver}-${_timestamp}.tar.gz"
# echo
# msg "You must select \"Enable dirrerent security models\" and \"TOMOYO Linux support\" under"
# msg  "\"Security options\" in the main options configuration menu. Press <ENTER> to continue."
# read
# make menuconfig
# dirty work around failing but necessary make prepare
# make prepare || make SUBDIRS=akari modules
  make SUBDIRS=akari SYSSRC=/lib/modules/${_kernver}/build modules || return 1
}

package()
{
  install -D -m644 "${srcdir}/linux-${_kernver}/akari/akari.ko" \
	"${pkgdir}/lib/modules/${_kernver}/kernel/extra/akari.ko"
  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" "${startdir}/akari.install"
}
