# Maintainer: Babets

pkgname=etxreal-etfiles
pkgver=2.60
pkgrel=1
pkgdesc="Enemy Territory's files needed by ET:XreaL"
arch=('any')
url="http://www.moddb.com/mods/etxreal"
license=('custom: enemy territory')
source=(http://ftp.gwdg.de/pub/misc/ftp.idsoftware.com/idstuff/et/linux/et-linux-$pkgver.x86.run)
md5sums=('2d2373f29f02e18d365d7f1860eee435')

build() {
  cd $srcdir
  chmod +x et-linux-$pkgver.x86.run
  ./et-linux-2.60.x86.run --noexec --target $srcdir
}


package() {
  cd "$srcdir"

  # create destination directories
  install -d $pkgdir/usr/share/etxreal/etmain
  install -d $pkgdir/usr/share/licenses/$pkgname
  install -d $pkgdir/usr/share/pixmaps

  # copy enemy-territory's pk3 files
  install -Dm 644 etmain/{pak0,pak1,pak2}.pk3 $pkgdir/usr/share/etxreal/etmain

  # install enemy territory license
  install -Dm 644 Docs/EULA_Wolfenstein_Enemy_Territory.txt $pkgdir/usr/share/licenses/$pkgname

  # install icon file
  install -Dm 644 ET.xpm $pkgdir/usr/share/pixmaps/etxreal.xpm

}

# vim:set ts=2 sw=2 et:

