# Contributor: Markus Golser <elmargol@googlemail.com>
pkgname=brother-fax1940cn-lpr
_printer=fax1940cn
pkgver=1.0.2_1
pkgrel=2
pkgdesc="Brother LPR driver for FAX 1940CNC printer"
arch=('i686')
url="http://solutions.brother.com/linux/en_us/download_prn.html#FAX-1940CN"
license=('custom:Brother_Software_Open_License_Agreement')
depends=('a2ps' 'gcc-libs')
optdepends=("brother-$_printer-cupswrapper: For printing via CUPS.")
provides=("brother-$_printer=${pkgver%_*}")
conflicts=("brother-$_printer")
install=$pkgname.install
source=(http://solutions.brother.com/Library/sol/printer/linux/rpmfiles/lpr_debian/${_printer}lpr-${pkgver//_/-}.i386.deb
        $pkgname.patch license.txt)
md5sums=('007c5cfbad2c167c730ec75117a31f36'
         'c81a66db97f18874a923037f74ce4aa8')

build() {
  # extract the deb archive
  cd $srcdir
  ar x ${_printer}lpr-${pkgver//_/-}.i386.deb || return 1
  mkdir data
  tar -xvzf data.tar.gz -C data || return 1
  patch -Np1 -d data < $pkgname.patch || return 1

  install -d -m755 $pkgdir/usr/{local,bin,lib/brother/printer} || return 1
  # install the config tool
  install -m755 $srcdir/data/usr/bin/brprintconfij2 $pkgdir/usr/bin/ || return 1

  # copy the rest
  cp -R $srcdir/data/usr/local/Brother/ $pkgdir/usr/Brother || return 1
  cp -R $srcdir/data/usr/lib/ $pkgdir/usr/ || return 1
  ln -s /usr/Brother $pkgdir/usr/local/Brother || return 1

  # install the license
  install -D -m644 license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt || return 1
}
