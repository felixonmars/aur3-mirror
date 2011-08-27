# Contributor: Ronny Radke <ronnymichaelradke at web point de>

pkgname=catan-cow-client-de
pkgver=3.728
pkgrel=1
pkgdesc="Catan Online World Linux Client"
arch=('i686' 'x86_64')
url="http://www.playcatan.com/"
license="custom:eula"
install="catan-cow-client.install"
source=('http://www.catan.de/de/download/?onlinewelt_3_728_deu_linux.tgz')
depends=('libx11' 'java-runtime')
md5sums=('f24af2da6c2aced02f0f0b980c64ba4d')

build() {
return 0
}

package() {
  mkdir -p $pkgdir/usr/{share/{COW-Client,applications},bin}
  cd $srcdir/COW-Client
  /bin/tar cf - * | ( cd ../../pkg/usr/share/COW-Client/; tar xfp - )
  chgrp -R games .
  chmod -R g+w .

echo "[Desktop Entry]
Exec=/usr/share/COW-Client/COWStarter.sh
Icon=/usr/share/COW-Client/COW-Logo_256x256.png
Name=Catan Online World
Path=/usr/share/COW-Client
StartupNotify=true
Terminal=false
Type=Application
Categories=Game;StrategicGame;
" > $pkgdir/usr/share/applications/Catan_Online_World.desktop
  ln -s /usr/share/COW-Client/COWStarter.sh $pkgdir/usr/bin/cow.sh
}
