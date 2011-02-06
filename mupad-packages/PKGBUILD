# Contributor: b52 <dotb52@gmail.com>
pkgname=mupad-packages
pkgver=4.0.6
pkgrel=1
pkgdesc="Several MuPAD Pro packages (eplot v22b, agla v2, elektro, geometrie, schrittrechner)."
arch=('i686')
url="http://www.sciface.com/"
license=('custom')
depends=('mupad=4.0.6')
makedepends=('unzip')
source=('http://www.mupad.de/download/data/packages/mupadpro4/eplot/eplot.zip' 'http://www.mupad.de/download/data/packages/mupadpro4/agla/agla.zip' 'http://www.mupad.de/download/data/packages/mupadpro4/elektro/elektro.zip' 'http://www.mupad.de/download/data/packages/mupadpro4/geometrie/geometrie.zip' 'http://www.mupad.de/download/data/packages/mupadpro4/schrittrechner/schrittrechner.zip' 'http://www.mupad.de/download/data/mupadpro4/FixedLicense_en.txt')
md5sums=('5b3119cf0d5dc1cdfd4a227546ea10d2' '9fae587a98ff0b46c4cd0aabba1a294d' 'a6c1b3323312b091664099cf9fe30d42' '2c31c599b6fddaf1c9fe7dac9a6c7e77' '3ad3f0750922aad9f6ef15205775655d' '893540cce2a06f28f64f87d9cacce5d7')

build() {
  mkdir -p $startdir/pkg/opt/MuPAD-4.0.6/packages/
  mkdir -p $startdir/pkg/usr/share/licenses/mupad-packages/

  cp $startdir/FixedLicense_en.txt $startdir/pkg/usr/share/licenses/mupad-packages/COPYING

  unzip -qq $startdir/eplot.zip -d $startdir/pkg/opt/MuPAD-4.0.6/packages/
  unzip -qq $startdir/agla.zip -d $startdir/pkg/opt/MuPAD-4.0.6/packages/
  unzip -qq $startdir/elektro.zip -d $startdir/pkg/opt/MuPAD-4.0.6/packages/elektro/
  unzip -qq $startdir/geometrie.zip -d $startdir/pkg/opt/MuPAD-4.0.6/packages/geometrie/
  unzip -qq $startdir/schrittrechner.zip -d $startdir/pkg/opt/MuPAD-4.0.6/packages/
}
