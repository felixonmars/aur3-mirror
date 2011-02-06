# Maintainer: Adrian Carpenter <adriatic.c@gmail.com>

pkgname=festival-us-jmk-multisyn
_pkgnameorig=festvox_cstr_us_jmk_arctic_multisyn
pkgver=1.0
pkgrel=1
pkgdesc="Canadian English male (JMK) using unit selection concatenative synthesis with high quality 'multisyn' database."
url="http://www.cstr.ed.ac.uk/projects/festival/"
arch=('i686' 'x86_64')
license=""
depends=('festival')
replaces=('festival-jmk-arctic')
source=("http://festvox.org/packed/festival/1.96/$_pkgnameorig-$pkgver.tar.gz")
md5sums=('070acc374e8ce7bec8525432cc65e4fd')

build() {
  cd $startdir/src

  #This package has been broken for years.
  sed -i '2i(defvar voice_jmk_multisyn_configure_pre nil)' \
  festival/lib/voices-multisyn/english/cstr_us_jmk_arctic_multisyn/festvox/cstr_us_jmk_arctic_multisyn.scm \
  || return 1

  mkdir -p $startdir/pkg/usr/share/festival
  mv festival/lib/voices-multisyn $startdir/pkg/usr/share/festival
}
