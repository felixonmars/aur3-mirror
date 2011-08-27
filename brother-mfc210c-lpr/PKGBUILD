# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: untseac <emanuel.amaral.couto(at)gmail(dot).com>
# Contributor: element74 <don_palme@gmx.de>
pkgname=brother-mfc210c-lpr
pkgver=1.0.2_1
pkgrel=3
pkgdesc="Brother LPR driver for MFC-210C, MFC-215C, MFC-425CN, MFC-640CW, MFC-820CW, DCP-115C, DCP-117C, DCP-120C, DCP-315CN, DCP-340CW printers"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#MFC-210C"
license=('custom:Brother open license')
provides=('brother-mfc210c-cupswrapper')
install=$pkgname.install
[[ $CARCH = i686 ]] && depends=('a2ps')
[[ $CARCH = x86_64 ]] && depends=('a2ps' 'lib32-gcc-libs')
conflicts=('brother-mfc210c-fixed-version')
source=(http://www.brother.com/pub/bsc/linux/dlf/mfc210clpr-${pkgver//_/-}.i386.deb license.txt)
md5sums=('d52d3e85b5a619bf5743e60fa0d06365'
         '24b8e6d2210cec1f1db3a3592fdc4cb3')

build() {
  # extract the deb archive
  cd $srcdir
  ar x mfc210clpr-${pkgver//_/-}.i386.deb || return 1
  mkdir data
  tar -xvzf data.tar.gz -C data || return 1
#  patch -Np0 < $pkgname.patch || return 1

  # create directorys
  install -d -m755 $pkgdir/usr/{bin,lib,share/brother/{inf,lpd}} || return 1

  #install the config tool
  install -m755 data/usr/bin/brprintconfij2 $pkgdir/usr/bin/ || return 1
  echo "patching $pkgdir/usr/bin/brprintconfij2"
  sed -e 's|usr/local/Brother|usr/share/brother|g' -i $pkgdir/usr/bin/brprintconfij2 || return 1

  # install libs and create symlinks
  install -m644 data/usr/lib/* $pkgdir/usr/lib/ || return 1
  echo "patching $pkgdir/usr/lib/libbrcompij2.so.1.0.2"
  sed -e 's|usr/local/Brother|usr/share/brother|g' -i $pkgdir/usr/lib/libbrcompij2.so.1.0.2 || return 1
  ln -s libbrcompij2.so.1.0.2 $pkgdir/usr/lib/libbrcompij2.so.1.0 || return 1
  ln -s libbrcompij2.so.1.0.2 $pkgdir/usr/lib/libbrcompij2.so.1 || return 1
  ln -s libbrcompij2.so.1.0.2 $pkgdir/usr/lib/libbrcompij2.so || return 1

  # copy the rest
  cp -R data/usr/local/Brother/{inf,lpd} $pkgdir/usr/share/brother/ || return 1
  echo "patching $pkgdir/usr/share/brother/inf/setupPrintcapij"
  sed -e 's|usr/local/Brother|usr/share/brother|g' -i $pkgdir/usr/share/brother/inf/setupPrintcapij || return 1
  echo "patching $pkgdir/usr/share/brother/lpd/filterMFC210C"
  sed -e 's|usr/local/Brother|usr/share/brother|g' -i $pkgdir/usr/share/brother/lpd/filterMFC210C || return 1


  # install the license
  install -D -m644 license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt || return 1
}
