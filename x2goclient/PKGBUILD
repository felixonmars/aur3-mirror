# Contributor: Gerhard Brauer <gerbra@archlinux.de>
# Contributor: Richard Murri <admin@richardmurri.com>
pkgname=x2goclient
pkgver=4.0.0.0
pkgrel=1
pkgdesc="x2go qt4 client"
arch=(i686 x86_64 arm)
license=('GPL')
url="http://www.x2go.org"
depends=(qt libldap libcups nxproxy libssh libxpm)
source=(http://code.x2go.org/releases/source/${pkgname}/${pkgname}-${pkgver}.tar.gz)
groups=('x2go' 'alts')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ln -s ${srcdir}/${pkgname}-${pkgver}/x2go-logos/x2go-logo.svg ${srcdir}/${pkgname}-${pkgver}/svg/x2gologo.svg

  # build package
  #patch -Np1 < ../gcc4.3.patch

  #sed -i 's/linux-g++/unix/g' x2goclient.pro
  qmake x2goclient.pro
  make clean
  make

  # install client binary
  install -D -m755 x2goclient $pkgdir/usr/bin/x2goclient

  # install icons
  install -D -m644 icons/128x128/x2goclient.png $pkgdir/usr/share/x2goclient/icons/x2goclient.png
  install -D -m644 icons/128x128/x2goclient.png $pkgdir/usr/share/pixmaps/x2goclient.png
  install -D -m644 icons/16x16/x2goclient.png $pkgdir/usr/share/icons/hicolor/16x16/apps/x2goclient.png
  install -D -m644 icons/32x32/x2goclient.png $pkgdir/usr/share/icons/hicolor/32x32/apps/x2goclient.png
  install -D -m644 icons/64x64/x2goclient.png $pkgdir/usr/share/icons/hicolor/64x64/apps/x2goclient.png
  install -D -m644 icons/128x128/x2goclient.png $pkgdir/usr/share/icons/hicolor/128x128/apps/x2goclient.png

  # install desktop entry
  install -D -m644 desktop/x2goclient.desktop $pkgdir/usr/share/applications/x2goclient.desktop
}
md5sums=('ae47e22ea9a3804e304ab037dff00378')
