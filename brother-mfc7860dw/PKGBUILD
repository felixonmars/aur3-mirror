# Maintainer: Andy Mikhaylenko <neithere@gmail.com>
# Contributor: brenton <brenton@taylorbyte.com>
#
# TODO: split into LPR and cupswrapper (as some other packages in AUR are)
#
pkgname=brother-mfc7860dw
_printername=MFC7860DW
pkgver="2.0.4"
lprpkgver="2.1.0"
pkgrel=2
pkgdesc="CUPS and LPR driver for Brother MFC7860 printer"
arch=('i686' 'x86_64')
license=('custom:Brother Industries')
depends=('cups' 'tcsh')
makedepends=('rpmextract')
url="http://solutions.brother.com/linux/en_us/index.html"
source=(http://www.brother.com/pub/bsc/linux/dlf/cupswrapper${_printername}-$pkgver-$pkgrel.i386.rpm \
        http://www.brother.com/pub/bsc/linux/dlf/mfc7860dwlpr-$lprpkgver-1.i386.rpm)
md5sums=('9cf9fb55b6972d1b897205295029c17d'
         'd321ad6ca699a19a6aa608d67ae41198')
install=mfc7860dw.install

build() {
   cd "$startdir/pkg" || return 1
   for n in $startdir/src/*.rpm; do
   rpmextract.sh "$n" || return 1
   done

   sed -i 's|/etc/init.d|/etc/rc.d|' $pkgdir/usr/local/Brother/Printer/MFC7860DW/cupswrapper/cupswrapperMFC7860DW-2.0.4
}
