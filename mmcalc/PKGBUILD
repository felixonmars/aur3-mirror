# Author: Denis G. Samsonenko <d (dot) g (dot) samsonenko [at] gmail (dot) com>
# Maintainer: Konstantin  A. Kovalenko <k (dot) a (dot) kovalenko [at] gmail (dot) com>
pkgname=mmcalc
pkgver=20130514
pkgrel=1
epoch=
pkgdesc="Perform calculation of molar mass and percent of each element for the given chemical formula"
arch=('any')
url="http://www.ogion76.name/home/mmcalc"
license=('LGPL')
groups=()
depends=('perl>=5.8.9' 'hicolor-icon-theme')
makedepends=('perl-locale-msgfmt>=0.15')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www.ogion76.name/home/mmcalc/$pkgname-$pkgver.tar.gz mmcalc.install)
noextract=()
md5sums=('606ca92cee25527bdaf493af13f95cc7'
         '0a8baf724d4c367eef70a46eb87b8d82')
package() {
  cd "$srcdir/$pkgname-$pkgver"
# Setting these env variables overwrites any command-line-options we don't want...
 export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
   PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
   PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
   PERL5LIB="" PERL_LOCAL_LIB_ROOT="" \
   MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL || return 1
  /usr/bin/perl Build || return 1
  /usr/bin/perl Build install || return 1
}
