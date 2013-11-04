# Maintainer: Lantald < lantald at gmx.com
# Contributor: Stéphane Gaudreault <stephane.gaudreault@gmail.com>
pkgname=udig
pkgver=1.4.0
pkgrel=1
pkgdesc="User-friendly Desktop Internet GIS"
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
url="http://udig.refractions.net"
license=('LGPL')
source=(http://udig.refractions.net/files/downloads/${pkgname}-${pkgver}.linux.gtk.${ARCH}.zip)
md5sums=('116b7f577ba08b1e2b7d0100588f5259')
[ "$CARCH" = "x86_64" ] && md5sums=('b401a3fc48b33888dcf894104b4f903e')
#depends=('openjdk6')

build() {
   cd $startdir
   mkdir -p $pkgdir/opt/ $pkgdir/usr/bin
   cp -ar $srcdir/${pkgname} $pkgdir/opt/
   # Link udig exec script and gem binary in /usr/bin under a custom name.
   ln -sf "/opt/${pkgname}/udig.sh" "${pkgdir}/usr/bin/${pkgname}"
}
