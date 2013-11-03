# Contributor: Jelle van der Waa <jelle@vdwaa.nl>

_ibver=ib2012
pkgname=belastingdienst-$_ibver
pkgver=1.0
pkgrel=3
pkgdesc="Elektronische aangifte IB 2012 voor Linux, Nederlandse belastingdienst."
arch=('i686' 'x86_64')
url="http://www.belastingdienst.nl"
license=('custom')

depends=(libsm libxext)
if test "$CARCH" == x86_64; then
  depends=(lib32-libsm lib32-libxext lib32-gcc-libs)
fi

options=('!strip')
source=("http://download.belastingdienst.nl/belastingdienst/apps/linux/${_ibver}_linux.tar.gz")
md5sums=('6106ff630dab234467aa3c3a35e372a2')

package() 
{
  install -d $pkgdir/opt/belastingdienst/$_ibver 
  install -d  $pkgdir/usr/bin

  cp -a $srcdir/$_ibver/* $pkgdir/opt/belastingdienst/$_ibver
  ln -s /opt/belastingdienst/$_ibver/bin/${_ibver}ux $pkgdir/usr/bin/${_ibver}ux
}
