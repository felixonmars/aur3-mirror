# Author: Syed Adnan Kamili <adnan.kamili@gmail.com>
# Maintainer: Marc Rozanc <marc@rozanc.fr>

pkgname=flaremonitor
_rel=1.0
_subrel=2
pkgver=${_rel}.${_subrel}
pkgrel=7
pkgdesc="flaremonitor is an advanced browser integration helper module of flareGet"
arch=('i686' 'x86_64')
url="http://flareget.com"
license=('GPL')
depends=('flareget>=1.4.7' 'libnetfilter_queue>=0.0.17-1')
makedepends=('rpmextract')
install=${pkgname}.install
_flareget_rel=2.3
_flareget_subrel=24

if  [ "${CARCH}" = "i686" ]; then
    _arch1="i386"
    _arch2=$_arch1
    md5sums=('1c43be7a78654479297b5c63a931c6e3')
elif [ "${CARCH}" = "x86_64" ]; then
    _arch1="x86_64"
    _arch2="amd64"
    md5sums=('b6b0d6b1d5f3c6f34cc235dc250736e3')
fi

source=("http://www.flareget.com/files/flareget/rpm/${_arch2}/flareget_${_flareget_rel}-${_flareget_subrel}_${_arch1}(stable)_rpm.tar.gz")

package() {
   cd $srcdir

   mv "$srcdir/flareget_${_flareget_rel}-${_flareget_subrel}_${_arch1}(stable)_rpm/Browser Integration/Opera(version < 13 only)/${pkgname}-${_rel}-${_subrel}.${_arch1}.rpm" $srcdir
   
   # Extract .rpm package
   cd $pkgdir
   rpmextract.sh "$srcdir/${pkgname}-${_rel}-${_subrel}.${_arch1}.rpm"

   cd $srcdir
   # License
   install -Dm644 $pkgdir/usr/share/doc/$pkgname/COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE

   mv $pkgdir/usr/sbin $pkgdir/usr/bin

   rm $pkgdir/usr/share/doc/$pkgname/COPYING
}

