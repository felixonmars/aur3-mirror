# Original Contributor & Maintainer: machoo02 <ichthyoboy@gmail.com>
# Maintainer: beatyrm <beatyrm@gmail.com>

pkgname=beersmith2
pkgver=2.2.12
pkgrel=1
pkgdesc="Beer homebrewing recipe formulation and calculator"
url="http://www.beersmith.com"
license=('custom')
arch=('i686' 'x86_64')
depends=('libpng12' 'webkitgtk2')
optdepends=()
install=${pkgname}.install


if [ "$CARCH" = "i686" ]; then
    source=("https://s3.amazonaws.com/BeerSmith2-2/BeerSmith-2.2.12.deb")
    md5sums=('94b3e36a264fb36b2547dfb85da1a3ad')
elif [ "$CARCH" = "x86_64" ]; then
    source=("https://s3.amazonaws.com/BeerSmith2-2/BeerSmith-2.2.12_amd64.deb")
    md5sums=('f23b2a4d64bed4e6edb2c9d33f605a85')
fi

package() {
  msg "Converting debian package"
  cd "${srcdir}"
  tar zxpf data.tar.gz
  tar zxpf control.tar.gz
  
  for i in 16x16 24x24 32x32 48x48 64x64 128x128; do
    install -Dm644 usr/share/icons/hicolor/$i/apps/beersmith.png "${pkgdir}/usr/share/icons/hicolor/$i/apps/beersmith.png"
  done
  
  install -Dm644 usr/share/menu/beersmith2 "${pkgdir}/usr/share/menu/beersmith2"
  install -Dm644 usr/share/applications/beersmith2.desktop "${pkgdir}/usr/share/applications/beersmith2.desktop"
  cp -a usr/share/BeerSmith2 "${pkgdir}/usr/share"
  install -Dm755 usr/bin/beersmith2 "${pkgdir}/usr/bin/beersmith2"
  install -Dm644 copyright "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}

