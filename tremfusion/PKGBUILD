# Maintainer: Jan Keith Darunday <jkcdarunday@uplb.edu.ph>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Dario `dax` Vilardi <dax@deelab.org>
# Contributor: Frozen Fox <frozenfoxz@gmail.com>

pkgname=tremfusion
pkgver=0.99r3
pkgrel=14
pkgdesc='Community updated Tremulous client.'
url='http://tremfusion.net'
arch=('i686' 'x86_64')
license=('GPL')
depends=('tremulous' 'curl' 'directfb' 'freetype2' 'libogg' 'ncurses' 'sdl')
optdepends=("openal: OpenAL audio support")
install=tremfusion.install
conflicts=('tremfusion-hg')
source=("http://dl.tremfusion.net/files/0.99/r3/Tremfusion-0.99r3-linux32.tar.bz2"
        'tremfusion.png'
        'tremfusion.desktop'
        'tremfusion.sh'
        'tremfusion-tty.sh'
        'tremfusionded.sh')
md5sums=('3d6df33585ad406d7ebde8ef23c1826a'
         '1dd34741fd50422f8103da142afddcc7'
         'f49d5326d4fdfde01730dbdf0338e360'
         'd6d6147de0a6ef7d1c994f3d109b98af'
         'd6d6147de0a6ef7d1c994f3d109b98af'
         'd6d6147de0a6ef7d1c994f3d109b98af')
[ "$CARCH" = "x86_64" ] && \
  source[0]="http://dl.tremfusion.net/files/0.99/r3/Tremfusion-0.99r3-linux64.tar.bz2" && \
  md5sums[0]="c58c97bb9f1b99e683e1c35d6c1b1a51"

build() {
  # Install the .desktop and icon files
  install -Dm644 "$srcdir/tremfusion.desktop" "$pkgdir/usr/share/applications/tremfusion.desktop"
  install -Dm644 "$srcdir/tremfusion.png" "$pkgdir/usr/share/pixmaps/tremfusion.png"

  # Copy the executable files
  # Note: The binaries are compiled against /usr/local/bin
  #       So, this is the simplest and cleanest workaround
  install -Dm755 "$srcdir/tremulous" "$pkgdir/opt/tremulous/tremfusion/tremfusion"
  install -Dm755 "$srcdir/tremulous-tty" "$pkgdir/opt/tremulous/tremfusion/tremfusion-tty"
  install -Dm755 "$srcdir/tremded" "$pkgdir/opt/tremulous/tremfusion/tremfusionded"
  install -Dm755 "$srcdir/tremfusion.sh" "$pkgdir/usr/bin/tremfusion"
  install -Dm755 "$srcdir/tremfusion-tty.sh" "$pkgdir/usr/bin/tremfusion-tty"
  install -Dm755 "$srcdir/tremfusionded.sh" "$pkgdir/usr/bin/tremfusionded"

  # Copy game data files
  install -Dm644 "$srcdir/z-tremfusion-menu-0.99r3.pk3" "$pkgdir/opt/tremulous/tremfusion/z-tremfusion-menu-0.99r3.pk3"
  if [ $CARCH = "x86_64" ] ; then
     install -Dm644 "$srcdir/gamex86_64.so" "$pkgdir/opt/tremulous/tremfusion/gamex86_64.so"
  else
     install -Dm644 "$srcdir/gamex86.so" "$pkgdir/opt/tremulous/tremfusion/gamex86.so"
  fi
}
