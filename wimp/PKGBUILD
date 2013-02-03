packager="slaveriq <arch@plassmann.biz>"
pkgname=wimp
pkgver=2.3.2
license='custom'
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="The Adobe Air based Streaming Client for the Telenor Wimp Service. This package is currently DK only."
url=('http://getwimp.com')
source=("http://wimp.aspiro.com/wweb/resources/wimp_files/DK_55/release/Wimp-2.3.2.air"
	'WiMP.desktop')
depends=('bash'
	'adobe-air-sdk'
	'unzip')
conflicts=('wimp-no')
md5sums=('f70fd7e15bc5c245aeb845b264bf7e60'
         '17d42e980e7f37e6bbf9eb39e304e1ef')
noextract=(Wimp-${pkgver}.air)
build() {
  cd $srcdir
  mkdir -p  $pkgdir/opt/airapps
  mkdir -p $pkgdir/usr/bin
  #mv $srcdir/Wimp-$pkgver.air  $pkgdir/opt/airapps/wimp.air
  mkdir $pkgdir/opt/airapps/wimp
  cd $pkgdir/opt/airapps/wimp
  unzip $srcdir/Wimp-$pkgver.air
  echo "#!/bin/bash" >> $pkgdir/usr/bin/wimp
  echo "/opt/adobe-air-sdk/bin/adl -nodebug /opt/airapps/wimp/META-INF/AIR/application.xml /opt/airapps/wimp/" >> $pkgdir/usr/bin/wimp
  chmod +x $pkgdir/usr/bin/wimp
}
