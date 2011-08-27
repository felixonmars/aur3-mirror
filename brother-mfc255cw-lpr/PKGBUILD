# Contributor: melyadon
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: untseac <emanuel.amaral.couto(at)gmail(dot).com>
# Contributor: element74 <don_palme@gmx.de>
pkgname=brother-mfc255cw-lpr
pkgver=1.1.2_1
pkgrel=1
pkgdesc="Brother LPR driver for MFC-255CW printer"
arch=('i686')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#MFC-255CW"
license=('custom:Brother open license')
provides=('brother-mfc255cw-cupswrapper')
source=(http://www.brother.com/pub/bsc/linux/dlf/mfc255cwlpr-${pkgver//_/-}.i386.deb license.txt)
md5sums=('372440117893c6ad49acdd312c264c3b'
         '0ef9ca226622b9b49acf9d4208c8bd61')

build() {
  # extract the deb archive
  cd $srcdir
  ar x mfc255cwlpr-${pkgver//_/-}.i386.deb || return 1
  mkdir data
  tar -xvzf data.tar.gz -C data || return 1

  # create directories
  install -d -m755 $pkgdir/usr/{bin,share,local/Brother/Printer/mfc255cw/{inf,lpd}} || return 1

  #install the config tool
  install -m755 data/usr/bin/brprintconf_mfc255cw $pkgdir/usr/bin/ || return 1

  # copy the rest
  cp -R data/usr/local/Brother/Printer/mfc255cw/{inf,lpd} $pkgdir/usr/local/Brother/Printer/mfc255cw || return 1

  # install the license
  install -D -m644 license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt || return 1
}
