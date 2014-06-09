# Maintainer: simon1573 <simon at tuxflux dot se>
packager="simon1573 <simon at tuxflux dot se>"
pkgname=wimp-se
pkgver=3.1.0.1858
#build=1022
license='custom'
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="The Adobe Air based Streaming Client for the Telenor Wimp Service. The Swedish version. I simply modified slaveriq's package to work with the Swedish version."
url=('http://getwimp.com')
#airfile=seWiMP.${pkgver}.${build}.air
airfile=WiMP-${pkgver}-SE.air
source=("https://wimp.no/wweb/resources/wimp_files/release/${airfile}"
	'WiMP.desktop')
depends=('bash'
	'adobe-air-sdk'
	'unzip')
conflicts=('wimp')
md5sums=('2de37e7560f3bd0eaf17560c2dc9527e'
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

  sed -i 's/application\/3.5/application\/2.6/g' META-INF/AIR/application.xml 
  
  chmod +x $pkgdir/usr/bin/wimp
}
