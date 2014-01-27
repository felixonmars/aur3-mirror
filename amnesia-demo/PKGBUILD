
# Contributor: J. W. Birdsong  <jwbirdsong AT gmail DOT com>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Maintainer: Ben R <thebenj88 *AT* gmail *DOT* com>

pkgname=amnesia-demo
pkgver=1.0
pkgrel=5
pkgdesc="Demo version of 'Amnesia: The Dark Descent', a horror adventure game"
arch=('i686' 'x86_64')
url="http://www.amnesiagame.com/"
license=('custom')
install=$pkgname.install
# doesn't need more dependencies, automatically falls back to included libs
depends=('libxft')
source=(http://breed808.com/archlinux_aur/amnesia_tdd_demo_$pkgver.sh.zip
		amnesia.launcher)
sha1sums=('3ddcedf4de614715cedfde6355adda8bfe203738'
          '02c00f96e39e036c50a228870f472bd4912abe49')
  
package() {
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


