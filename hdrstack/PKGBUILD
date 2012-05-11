# Maintainer: Alexandre GENIN <bellette *pwet* tuxfamily[dot]org>
pkgname=hdrstack
pkgver=1.4
pkgrel=2
pkgdesc="Align and stack raw and non-raw images for exposure blending in GIMP"
url="http://bellette.tuxfamily.org/carnets/?p=444"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('hugin' 'gimp' 'imagemagick' 'zenity' 'gimp-ufraw')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://bellette.tuxfamily.org/files/HDRstack/${pkgname}-${pkgver}.tar.gz")
md5sums=('657e51f73a96801d434445f3a90aa6bb')


build() {
  cd $srcdir
  
  install -D -m 755 HDRstack $pkgdir/usr/bin/HDRstack
  install -D HDRstack.desktop $pkgdir/usr/share/applications/HDRstack.desktop
}