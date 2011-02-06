# Contributor: b52 <dotb52@gmail.com>
pkgname=mupad
pkgver=4.0.6
pkgrel=1
pkgdesc="MuPAD Pro is an open development environment for solving mathematical and technical difficulties, also known as computer algebra system (CAS)."
arch=('i686')
url="http://www.sciface.com"
license=('custom')
depends=('qt' 'libtiff' 'nvidia-utils')
makedepends=('rpmextract')
install=mupad.install
source=('http://www.mupad.de/download/data/mupadpro4/mupad-4.0.6-1-linux-i386.rpm' 'http://www.mupad.de/download/data/mupadpro4/FixedLicense_en.txt')
md5sums=('5a997990100a2ff6b894cb64de76bc53' '893540cce2a06f28f64f87d9cacce5d7')

build() {
  rpmextract.sh mupad-4.0.6-1-linux-i386.rpm

  mkdir -p $startdir/pkg/usr/share/licenses/mupad/

  cp $startdir/FixedLicense_en.txt $startdir/pkg/usr/share/licenses/mupad/COPYING

  cp -R $startdir/src/opt/ $startdir/pkg/
  cp -R $startdir/src/usr/share/ $startdir/pkg/usr/
  cp -R $startdir/src/usr/local/bin/ $startdir/pkg/usr/

  chmod 755 $startdir/pkg/usr/bin/*
}