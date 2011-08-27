# Maintainer: mickele <mimocciola@yahoo.com>
pkgname=colbea
pkgver=0.55.1
pkgrel=1
pkgdesc="Colbea is a program for the calculation of 2D structures"
url="http://www.driemeyer.net/colbea/"
arch=(i686 x86_64)
license=('GPL')
depends=('wxgtk-2.6-ansi')
makedepends=('autoconf')
replaces=()
conflicts=()
provides=()
source=(http://www.driemeyer.net/colbea/download/noarch/stable/${pkgname}-${pkgver}.tar.gz
	acinclude.m4 ${pkgname}.desktop)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  cp ${srcdir}/acinclude.m4 ${srcdir}/${pkgname}-${pkgver}
  sed -e "s|\$(prefix)|\$(DESTDIR)\$(prefix)|g" -i Makefile.am
  sed -e "s|wx-config|wx-config-2.6|g" \
      -i ${srcdir}/${pkgname}-${pkgver}/configure.in
  autoreconf -f -i
  ./configure --prefix=/opt \
  	      --with-wx-config=wx-config-2.6 || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  install -D -m755 $srcdir/$pkgname-$pkgver/src/editor/rc/colbea.png $pkgdir/usr/share/pixmaps/$pkgname.png || return 1

  desktop-file-install 	--dir=$pkgdir/usr/share/applications \
    	$srcdir/${pkgname}.desktop || return 1
}
md5sums=('93914e176b3e1439b7f68ec96d319fc3'
         '246535a5cd10cbd2a8fd0bb204029965'
         '0314d010ab763362cfb1209ddca1f16d')
