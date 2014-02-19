packager="matick <matelusz1@gmail.com>"
pkgname=wimp-pl
pkgver=2.6.1
license='custom'
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="The Adobe Air based Streaming Client for the Telenor Wimp Service. This package is currently PL only."
url=('http://getwimp.com')
airfile=Wimp-${pkgver}.air
source=("http://wimpmusic.com/wweb/resources/wimp_files/PL_74/release/${airfile}"
	'WiMP.desktop')
depends=('bash'
	'adobe-air-sdk'
	'unzip')
conflicts=('wimp-pl')
md5sums=('d3cdaa539d179ce37c0664142f5f2412'
         'debbd40fafb05987e5a1b9d32f696a9a')
noextract=(${airfile})
build() {
  cd $srcdir
  mkdir -p  $pkgdir/opt/airapps/wimp
  mkdir -p $pkgdir/usr/bin
  
  cd $pkgdir/opt/airapps/wimp
  unzip $srcdir/${airfile}
  echo "#!/bin/bash" >> $pkgdir/usr/bin/wimp
  echo "/opt/adobe-air-sdk/bin/adl -nodebug /opt/airapps/wimp/META-INF/AIR/application.xml /opt/airapps/wimp/" >> $pkgdir/usr/bin/wimp
  chmod +x $pkgdir/usr/bin/wimp
}
