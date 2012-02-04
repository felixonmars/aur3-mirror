# Maintainer: wandrian <wandrian@tuxfamily.org>
# Contributor: wandrian <wandrian@tuxfamily.org>
# You could find binary package for i686 on the "remmirath" repository
# Add this lines to your /etc/pacman.conf
# [remmirath]
# http://download.tuxfamily.org/remmirath/"

pkgname=ffcs
pkgver=9.10
pkgrel=1
pkgdesc="freefem++-cs and integrated environment for FreeFem++"
arch=(i686 x86_64)
url="http://www.ann.jussieu.fr/~lehyaric/ffcs/"
license=('GPL')
#depends=()
#conflicts=()
source=('http://www.ann.jussieu.fr/~lehyaric/ffcs/packs/ffcs-9.10-32.tgz' 'ffcs.desktop')
md5sums=('65a1b27f499f21196cdf8f4de8262862' '901d4efb988fde7051318cb91aa2f9d3')

build() {
  cd $srcdir
  mv "FreeFem++-cs v9.10" ffcs

  mkdir -p $pkgdir/usr
  cp -r -a $srcdir"/ffcs" $pkgdir"/usr/ffcs"

  mkdir -p $pkgdir/usr/bin
  ln -s -f /usr/ffcs/FreeFem++-cs $pkgdir/usr/bin/FreeFem++-cs

  mkdir -p $pkgdir/usr/share/applications
  cp $srcdir/ffcs.desktop $pkgdir/usr/share/applications
}
