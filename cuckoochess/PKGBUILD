# Maintainer: scorici <scorici AT yahoo DOT com>
pkgname=cuckoochess
pkgver=1.12
pkgrel=1
pkgdesc="A Java Chess Program, GUI and TUI"
arch=(any)
url="http://web.comhem.se/petero2home/javachess/"
license=('GPL3')
depends=(java-runtime)
source=(http://web.comhem.se/petero2home/javachess/cuckoo112.jar
https://upload.wikimedia.org/wikipedia/commons/c/c7/Chess_pdt45.svg)
md5sums=('caf28bd54512068b9d5b057825b9c864'
         '1c52d8c48822d6d34d8930244159e6f3')
package() {
mkdir -p $pkgdir/usr/{bin,share/{$pkgname,applications}}
cp cuckoo112.jar $pkgdir/usr/share/$pkgname
cp *.svg $pkgdir/usr/share/$pkgname/$pkgname.svg
echo "#!/bin/bash
java -jar /usr/share/$pkgname/cuckoo112.jar gui
exit" > $pkgdir/usr/bin/cuckoo-gui
echo "#!/bin/bash
java -jar /usr/share/$pkgname/cuckoo112.jar txt
exit" > $pkgdir/usr/bin/cuckoo-tui
echo "[Desktop Entry]
Version=1.0
Name=CuckooChess
Comment=A Java Chess Program
Exec=cuckoo-gui
Icon=/usr/share/$pkgname/$pkgname.svg
Categories=Game;BoardGame;
Type=Application
Terminal=false
StartupNotify=false" > $pkgdir/usr/share/applications/$pkgname.desktop
chmod +x $pkgdir/usr/bin/cuckoo*
}
