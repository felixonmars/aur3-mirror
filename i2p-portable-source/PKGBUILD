# Maintainer: coolkehon <coolkehon at gmail dot com>
# Contributor: veox <veox at wre dot ath dot cx>
# Contributor: Rorschach <r0rschach@lavabit.com>
# Contributor: Cedric Chabanois <cchabanois@gmail.com>

pkgname=i2p-portable-source
_pkgname=i2p
pkgver=0.8.12
pkgrel=1
pkgdesc="A distributed anonymous network, compile from source"
url="http://www.i2p2.de"
license=('GPL')
depends=('bash' 'java-runtime')
makedepends=('apache-ant')
arch=('i686' 'x86_64')
install=i2p.install
provides=('i2p' 'i2p-source' 'i2p-portable')
conflicts=('i2p')
source=("http://mirror.i2p2.de/i2psource_${pkgver}.tar.bz2" 'i2prouter')
sha256sums=('019d6018e7093650cf67fd883b0cf0f12aa2f4f0cddc5ef6a08e6147af07f142'
            'f66173fbaa372e5b82b8dcc000a1b03b5f7d029a19f0bcffbb9ce300af25acd1')

build() {
  cd $srcdir/${_pkgname}-${pkgver}
  cat > install.properties << EOC
INSTALL_PATH=$pkgdir/opt/i2p
EOC
  # yes, download jetty (version 5)
  echo "y" | ant pkg
  java -jar install.jar -options install.properties || return 1

  sed -i "s|$pkgdir/opt/i2p|/opt/i2p|g" $pkgdir/opt/i2p/i2prouter $pkgdir/opt/i2p/wrapper.config $pkgdir/opt/i2p/runplain.sh $pkgdir/opt/i2p/eepget || return 1
  sed -i 's/#RUN_AS_USER=/RUN_AS_USER=i2p/' $pkgdir/opt/i2p/i2prouter || return 1

  # make this a portable setup ( all files in /opt/i2p instead of /opt/i2p/.i2p/ )
  for file in $pkgdir/opt/i2p/wrapper.config;
  do
      sed -i 's|#wrapper.java.additional.5=-Di2p.dir.pid="/opt/i2p"|wrapper.java.additional.5=-Di2p.dir.pid="/opt/i2p"|g' $file
      sed -i 's|#wrapper.java.additional.5.stripquotes=TRUE|wrapper.java.additional.5.stripquotes=TRUE|g' $file
      sed -i 's|#wrapper.java.additional.6=-Di2p.dir.temp="/opt/i2p"|wrapper.java.additional.6=-Di2p.dir.temp="/opt/i2p"|g' $file
      sed -i 's|#wrapper.java.additional.6.stripquotes=TRUE|wrapper.java.additional.6.stripquotes=TRUE|g' $file
      sed -i 's|#wrapper.java.additional.7=-Di2p.dir.config="/opt/i2p"|wrapper.java.additional.7=-Di2p.dir.config="/opt/i2p"|g' $file
      sed -i 's|#wrapper.java.additional.7.stripquotes=TRUE|wrapper.java.additional.7.stripquotes=TRUE|g' $file
      sed -i 's|#wrapper.logfile=/opt/i2p/wrapper.log|wrapper.logfile=/opt/i2p/wrapper.log|g' $file
      sed -i 's|#wrapper.java.pidfile=/opt/i2p/routerjvm.pid|wrapper.java.pidfile=/opt/i2p/routerjvm.pid|g' $file
      sed -i 's|#wrapper.pidfile=/opt/i2p/i2p.pid|wrapper.pidfile=/opt/i2p/i2p.pid|g' $file
  done

  sed -i 's|#I2PTEMP="/opt/i2p"|I2PTEMP="/opt/i2p"|g' $pkgdir/opt/i2p/i2prouter

  rm $pkgdir/opt/i2p/.installationinformation || return 1
  rm -r $pkgdir/opt/i2p/Uninstaller || return 1
  install -Dm755 $srcdir/i2prouter $pkgdir/etc/rc.d/i2prouter || return 1
  install -Dm755 $pkgdir/opt/i2p/eepget $pkgdir/usr/bin/eepget
}


