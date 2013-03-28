# Contributor: Eugen Dahm <eugen.dahm@gmail.com>

#due to stupid naming conventions of the source package
_zippkgname=Linux_PCE_N53_1008
_srctarname=DPO_GPL_RT5592STA_LinuxSTA_v2.6.0.0_20120326.tar.bz2

pkgname=rt5592sta_linux
pkgver=2.6.0.0
pkgrel=2
pkgdesc="A linux device driver for the Ralink RT2860 ABGN WLAN Card"
arch=('i686', 'x86_64')
url="http://asus.com"
license=('GPL')
depends=()
makedepends=(make linux-headers)
optdepends=()
options=()
changelog=
source=("http://dlcdnet.asus.com/pub/ASUS/wireless/PCE-N53/${_zippkgname}.zip"
	'arch_build_preparation.patch'
	'rt5592sta_fix_64bit_3.8.patch')

sha1sums=('955b29d74fd66576b86dd1feee107f73b4605e3e'
          'd938f53945eb5e6c88eb58a942c451c61122cec1'
          '7a11b444f9861463bdfbbafe95c7443d9e1767aa')

build() {
cd "${srcdir}/Linux"
   tar -xjf ${_srctarname}
   cd $(basename -s .tar.bz2 $_srctarname)
   # patch the moronic makefile
   patch -p1 -i "${srcdir}/arch_build_preparation.patch"
   # patching for 3.8 kernel compatibility
   patch -p1 -i "${srcdir}/rt5592sta_fix_64bit_3.8.patch"
   make
}

package() {
  cd "$srcdir/Linux/$(basename -s .tar.bz2 $_srctarname)"
  make DESTDIR="$pkgdir/" install
  install=RT5592STA_LinuxSTA.install
}

# vim:set ts=2 sw=2 et:

