packager="luser32 <anriseth@gmail.com>"
pkgname=wimp-no
pkgver=3.2.0
build=1863
license='custom'
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="The Adobe Air based Streaming Client for the Telenor Wimp Service.The NO version "
url=('http://getwimp.com')
#airfile=WiMP.${pkgver}.${build}.production.NO.air
airfile=WiMP-${pkgver}.${build}-NO.air
source=("https://wimp.no/wweb/resources/wimp_files/release/${airfile}"
	'WiMP.desktop')
depends=('bash'
	'adobe-air-sdk'
	'unzip')
conflicts=('wimp')
md5sums=('90ae8d38271c48ca899eb45c90831a6e'
	'17d42e980e7f37e6bbf9eb39e304e1ef')
#install=$pkgname.install
noextract=(${airfile})
build() {
  cd $srcdir
  mkdir -p $pkgdir/opt/airapps/wimp
  mkdir -p $pkgdir/usr/bin
  cd $pkgdir/opt/airapps/wimp
  unzip $srcdir/${airfile}
  echo "#!/bin/bash" >> $pkgdir/usr/bin/wimp
  echo "/opt/adobe-air-sdk/bin/adl -nodebug /opt/airapps/wimp/META-INF/AIR/application.xml /opt/airapps/wimp/" >> $pkgdir/usr/bin/wimp

  sed -i 's/application\/14.0/application\/2.6/g' META-INF/AIR/application.xml 
  
  chmod +x $pkgdir/usr/bin/wimp
}


