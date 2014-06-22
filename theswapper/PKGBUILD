# Maintainer: Joel Pedraza <pkgs@joelpedraza.com>

pkgname=theswapper
pkgver=1.24
pkgrel=1
pkgdesc="An atmospheric brain teaser with a sense of existential crisis"
arch=('i686' 'x86_64')
url="http://facepalmgames.com/the-swapper/"
license=('custom:commercial')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
depends=('glibc' 'libxext' 'libxrender' 'libx11' 'libgl' 'libxcursor')
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver')
options=('!strip')
source=("hib://the-swapper-linux-$pkgver.sh"
        "theswapper"
        "theswapper.png"
        "theswapper.desktop")
md5sums=('4f9627d245388edc320f61fae7cbd29f'
         '0585b157117935f5d8f08c59c516529e'
         'b95becdcb569769d10a0931064cf100e'
         'cf1b61d7bba9f1fcb1e02a0dbd28a954')

package() {
  # Copy game files
  install -dm755 "$pkgdir/opt"
  cp -dpr --no-preserve=ownership "$srcdir/data/noarch" "$pkgdir/opt/$pkgname"
  
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  
  # Remove unnecessary files
  cd "$pkgdir/opt/$pkgname"
  if [ $CARCH == "i686" ]; then
    rm -r "lib64" "TheSwapper.bin.x86_64"
  fi
}
