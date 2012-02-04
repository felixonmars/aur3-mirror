# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
pkgname=zelda-sound-theme
pkgver=1.1
pkgrel=2
pkgdesc="Sound theme based on The Legend of Zelda: Ocarina of Time."
arch=(any)
url="http://gnome-look.org/content/show.php?content=100023"
license=(unknown)
changelog=ChangeLog
source=(http://eqisow.org/misc/green_mod/zelda_sounds.tar.gz
        index.theme)
md5sums=('96822221c8db58f3c0a5bc98c0c79890'
         '506d71a5e7ce5503ac2cdcf6a28705ec')

package() {
  cd "$srcdir/zelda"
  _sounddir="$pkgdir/usr/share/sounds/zelda/stereo"
  install -d "$_sounddir"
  install -m644 -t "$_sounddir/.." $srcdir/index.theme
  install -m644 -t "$_sounddir" *.wav
}

# vim:set ts=2 sw=2 et:
