# Maintainer: Adrian Carpenter <adriatic.c@gmail.com>

pkgname=festival-us-awb-multisyn
_pkgnameorig=festvox_cstr_us_awb_arctic_multisyn
pkgver=1.0
pkgrel=2
pkgdesc="Scottish English male (AWB) using unit selection concatenative synthesis with high quality 'multisyn' database."
url="http://www.cstr.ed.ac.uk/projects/festival/"
arch=('i686' 'x86_64')
license=""
depends=('festival')
replaces=('festival-awb-arctic')
source=("http://www.cstr.ed.ac.uk/downloads/festival/1.95/$_pkgnameorig-$pkgver.tar.gz")
md5sums=('880c20efb5baf0532671b46ac28545d0')

build() {
  cd "$srcdir"

  #This package has been broken for years
  sed -i '2i(defvar voice_us_awb_multisyn_configure_pre nil)' \
      festival/lib/voices-multisyn/english/cstr_us_awb_arctic_multisyn/festvox/cstr_us_awb_arctic_multisyn.scm
}
package() {
  cd "$srcdir"

  mkdir -p $pkgdir/usr/share/festival
  mv festival/lib/voices-multisyn $pkgdir/usr/share/festival
}
