# Maintainer: K900 <k0009000@gmail.com>
pkgname=teleglitch-demo
pkgver=r62
pkgrel=1
pkgdesc="Teleglitch is a roguelike top-down shooter with pixel graphics"
arch=("i686" "x86_64")
url=("http://teleglitch.com/")
license=("custom")

depends=("glu" "openal" "sdl_image")

if [[ "$CARCH" == "x86_64" ]]; then
  target=Teleglitch_${pkgver}_demo_linux64
  filename=teleglitch64
  md5sums=("3d9211fcee09e96b682f408da31de128")
else
  filename=teleglitch32
  target=Teleglitch_${pkgver}_demo_linux32
  md5sums=("be3df380c9cce9175a053ade690a10cb")
fi
source=("http://teleglitch.com/${target}.tar.gz" "teleglitch.png")
md5sums+=("dd4f72ce5c9a9b7ebffe0353ea8887e4")

build() {
  cd $srcdir/$target

  mkdir -p $pkgdir/usr/{bin,lib/$pkgname,share/{$pkgname,applications,pixmaps}}
  cp -r * $pkgdir/usr/share/$pkgname
  rm -rf $pkgdir/usr/share/$pkgname/{so,$filename}

  cp $filename $pkgdir/usr/lib/$pkgname/teleglitch

  cat > $pkgdir/usr/bin/$pkgname <<EOF
#!/bin/sh
cd /usr/share/$pkgname
/usr/lib/$pkgname/teleglitch
EOF
  chmod +x $pkgdir/usr/bin/$pkgname

  cat > $pkgdir/usr/share/applications/$pkgname.desktop <<EOF
[Desktop Entry]
Type=Application
Version=2.5
Encoding=UTF-8
Name=Teleglitch Demo
Comment=A roguelike top-down shooter with pixel graphics
Icon=$pkgname
Exec=/usr/bin/$pkgname
Terminal=false
StartupNotify=false
Categories=Game;
EOF

  install -Dm644 $srcdir/teleglitch.png $pkgdir/usr/share/pixmaps/${pkgname}.png

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  echo "None (email permission)" > $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
