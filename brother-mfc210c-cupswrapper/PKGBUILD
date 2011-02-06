# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: untseac <emanuel.amaral.couto(at)gmail(dot).com>
# Contributor: element74 <don_palme@gmx.de>
pkgname=brother-mfc210c-cupswrapper
pkgver=1.0.2_3
pkgrel=4
pkgdesc="Brother LPR-to-CUPS wrapper for MFC-210C, MFC-215C, MFC-425CN, MFC-640CW, MFC-820CW, DCP-115C, DCP-117C, DCP-120C, DCP-315CN, DCP-340CW printers"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#MFC-210C"
license=('GPL2')
depends=('brother-mfc210c-lpr>=1.0.2' 'cups' 'tcsh')
install=$pkgname.install
provides=('brother-mfc210c=1.0.0')
source=(http://www.brother.com/pub/bsc/linux/dlf/cupswrapperMFC210C-${pkgver//_/-}.i386.deb $pkgname.patch)
md5sums=('23f49dd7ebdb96bede08da66906e727f'
         '99ebe0ec09ea714c59b13a86417782bb')

build() {
  # extract and patch deb sources
  cd $srcdir
  ar x cupswrapperMFC210C-${pkgver//_/-}.i386.deb || return 1
  mkdir data
  tar -xvzf data.tar.gz -C data || return 1
  patch -Np0 < $pkgname.patch || return 1

  # install the cupswrapper
  install -D -m755 $srcdir/data/usr/local/Brother/cupswrapper/cupswrapperMFC210C-1.0.2 $pkgdir/usr/share/brother/cupswrapper/cupswrapperMFC210C-1.0.2 || return 1
}
