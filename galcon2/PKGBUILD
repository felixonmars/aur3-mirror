#Maintainer: geosmin <geosmin104@gmail.com>
pkgname=galcon2
pkgver=1.1.0
pkgrel=2
pkgdesc="The F2P sequel to the realtime high-paced multiplayer galactic arcade strategy game."
url="https://www.galcon.com/g2/"
arch=('i686' 'x86_64')
license=('custom:freetoplay')
source=("Galcon2-$pkgver.tgz::https://www.galcon.com/g2/files/latest/Galcon2.tgz" "galcon2.desktop" "license" "launchscript")
depends_i686=('libgl')
depends_x86_64=('lib32-libgl')
md5sums=('0021E28CAD1214ECD577BA4B88B159A4'
         '62dc4049e42630c47147baad062da669'
         'aeb8dae27380a403cde762928d050f2e'
         '2ca7aeeb81b56ab93b322647635ea901')

# Note: launchscript in source=(...) is a rewritten launch script to offer better integration into GNOME desktop and the like, the developer's original launch script can still be used by uncommenting build() and in package() switching the commented out line from the one that references run_me to the one that references launchscript.

#build() {
#  sed -i '2s:bin:/opt/galcon2/bin:' "$srcdir/Galcon2/run_me"
#}

package() {
  mkdir -p "$pkgdir"/{usr/share/{licenses,applications},usr/{bin,share/pixmaps},opt/galcon2}
  cp "$srcdir"/license "$pkgdir"/usr/share/licenses/galcon2
  cp "$srcdir"/galcon2.desktop "$pkgdir"/usr/share/applications/galcon2.desktop
  cp "$srcdir"/Galcon2/data/icon.png "$pkgdir"/usr/share/pixmaps/galcon2.png
  cp "$srcdir"/Galcon2/data/icon.png "$pkgdir"/usr/share/pixmaps/galcon2.png
#  cp "$srcdir"/Galcon2/run_me "$pkgdir"/usr/bin/galcon2
  cp "$srcdir"/launchscript "$pkgdir"/usr/bin/galcon2
  cp -r "$srcdir"/Galcon2/{bin,data} "$pkgdir"/opt/galcon2
  chmod 755 "$pkgfir"/usr/bin/galcon2
}
