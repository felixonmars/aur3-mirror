packager="Thore P. C. Kragelund <thore at e-id dot dk>"
pkgname=wimp-dk
pkgver=3.2.0.1863
license='custom'
pkgrel=1
arch=('i686' 'x86_64')
url="https://wimp.dk/wweb/iwannarock"
pkgdesc="The Adobe Air based streaming client for the Telenor WiMP service (danish version)."
source=("http://wimpmusic.com/wweb/resources/wimp_files/release/WiMP-$pkgver-DK.air"
        'wimp.desktop')
depends=('bash'
         'adobe-air-sdk'
         'unzip')
conflicts=('wimp'
           'wimp-no'
           'wimp-pl'
           'wimp-se')
sha256sums=('29a9002816845931a3994d6cc8ea8310d546b5004f5267e6a18dd27a89159fa4'
            'd0497160728b9b5db3915b3280d322d4159946799cf2f7549f641f163b20eb41')
noextract=("WiMP-$pkgver-DK.air")
package() {
  mkdir -p $pkgdir/opt/airapps/wimp
  cd $pkgdir/opt/airapps/wimp
  unzip $srcdir/WiMP-$pkgver-DK.air
  sed -i 's/application\/14.0/application\/2.6/g' META-INF/AIR/application.xml
  mkdir -p $pkgdir/usr/bin
  cd $pkgdir/usr/bin
  echo "#!/bin/bash" >wimp
  echo "/opt/adobe-air-sdk/bin/adl -nodebug /opt/airapps/wimp/META-INF/AIR/application.xml /opt/airapps/wimp/" >>wimp
  chmod +x wimp
  mkdir -p $pkgdir/usr/share/applications
  cp $srcdir/wimp.desktop $pkgdir/usr/share/applications
}
