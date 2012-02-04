# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=brother-mfc260c-lpr
_printer=mfc260c
pkgver=1.0.1_1
pkgrel=2
pkgdesc="Brother LPR driver for MFC-260C printer"
arch=('i686')
url="http://solutions.brother.com/linux/en_us/download_prn.html#MFC-260C"
license=('custom:Brother_Software_Open_License_Agreement')
depends=('a2ps')
optdepends=("brother-$_printer-cupswrapper: For printing via CUPS.")
provides=("brother-$_printer=${pkgver%_*}")
conflicts=("brother-$_printer")
backup=("usr/share/brother/printer/$_printer/inf/br${_printer}rc")
install=$pkgname.install
source=(http://solutions.brother.com/Library/sol/printer/linux/rpmfiles/lpr_debian/${_printer}lpr-${pkgver//_/-}.i386.deb
        license.txt $pkgname.patch)
md5sums=('fbcea862b62b95cabbdd4f4ac31015c5'
         'c420ebb7d3431fec700a855ff0aa266b'
         '78f2a0a34fe9e9ab47ea79dbaf19d769')

build() {
  # extract the deb archive
  cd $srcdir
  ar x ${_printer}lpr-${pkgver//_/-}.i386.deb || return 1
  mkdir data
  tar -xvzf data.tar.gz -C data || return 1
  patch -Np0 < $pkgname.patch || return 1

  install -d -m755 $pkgdir/usr/{bin,share/brother/printer} || return 1

  # install the config tool
  install -m755 data/usr/bin/brprintconf_$_printer $pkgdir/usr/bin/ || return 1
  sed -e 's|usr/local/Brother/Printer|usr/share/brother/printer|g' -i $pkgdir/usr/bin/brprintconf_$_printer || return 1

  # copy the rest
  cp -R data/usr/local/Brother/Printer/$_printer $pkgdir/usr/share/brother/printer/ || return 1
  rm $pkgdir/usr/share/brother/printer/$_printer/inf/setupPrintcapij

  # make config file editable by members of the "lp" group
  cd $pkgdir/usr/share/brother/printer/$_printer/inf
  chown :lp br${_printer}rc || return 1
  chmod 664 br${_printer}rc || return 1
#  chown :lp . || return 1
#  chmod 775 . || return 1
  cd $srcdir

  # install the license
  install -D -m644 license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt || return 1
}
