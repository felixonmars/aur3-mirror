
# Maintainer: J. W. Birdsong  <jwbirdsong AT gmail DOT com>
# Contributor: Marti Raudsepp <marti@juffo.org>

pkgname=amnesia-demo
pkgver=1.0
pkgrel=4
pkgdesc="Demo version of 'Amnesia: The Dark Descent', a horror adventure game"
arch=('i686' 'x86_64')
url="http://www.amnesiagame.com/"
license=('custom')
install=($pkgname.install)
# doesn't need more dependencies, automatically falls back to included libs
depends=('libxft')
source=(http://gamedaily.newaol.com/pub/amnesia_tdd_demo_$pkgver.sh.zip $pkgname.install amnesia.launcher)
md5sums=('8c0e062a69e46f1a290a06e919daaf08'
         '5f373e82e8260b706c417317ecf45679'
         'ebcd4cb1a4175cf35e6fd30a6c195a95')
  
build() {
  cd "$srcdir"

  #mkdir -p "$srcdir/pkgname-$pkgver"
  #sh amnesia_tdd_demo_$pkgver.sh --tar xf -C "$srcdir/pkgname-$pkgver"

  # This time around, it seems that the auto-extractor is intelligent enough
  sh amnesia_tdd_demo_$pkgver.sh --target "$srcdir/tmp" --unattended --accept-license --destdir "$srcdir"

  rm AmnesiaDemo/uninstall.sh
  sed -i "s|$srcdir/|/opt/|" AmnesiaDemo/*.desktop

[[ "$CARCH" == "x86_64" ]] && sed -i "s|Launcher.bin|Launcher.bin64|"  amnesia.launcher


  install -dm 755 -g games  $pkgdir/opt
  install -dm 755   $pkgdir/usr/share/applications $pkgdir/usr/share/licenses/$pkgname
  install -Dm 755   $srcdir/amnesia.launcher $pkgdir/usr/bin/amnesia
  mv AmnesiaDemo/*.desktop $pkgdir/usr/share/applications/
  mv AmnesiaDemo/EULA_*.rtf $pkgdir/usr/share/licenses/$pkgname/
  mv AmnesiaDemo $pkgdir/opt/
  chown root:games -R $pkgdir/opt/AmnesiaDemo
}

# vim:set ts=2 sw=2 et:

