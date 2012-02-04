# Maintainer: Gerardo Marset <gammer1994@gmail.com>

pkgname=cave-story-plus
pkgver=4
pkgrel=1
pkgdesc="The extended version of Cave Story, a side-scrolling platformer game"
arch=('i686' 'x86_64')
url="http://www.nicalis.com/"
license=('custom')
depends=('sdl' 'mesa')
source=(cavestoryplus-linux-1324519044.tar.gz
        $pkgname
        $pkgname.png
        $pkgname.desktop)
md5sums=('af4ddd7457af307bf4567a955173e633'
         '5ab10e98223a35700be65c206daa0103'
         'adcc3ca581a90018074747d1dc00e2b4'
         '426350078c2d76dbc42112f10cf59d35')
options=(!strip)

build() {
  cd CaveStory+

  # Create the game directory.
  mkdir -p $pkgdir/opt/$pkgname

  # Copy the data directory.
  cp -r data $pkgdir/opt/$pkgname

  # Are these needed in the new version?
  # Work around a bug in the game.
  #ln -s {L,$pkgdir/opt/$pkgname/data/base/Stage/l}ounge.pxm
  #ln -s {L,$pkgdir/opt/$pkgname/data/base/Stage/l}ounge.pxe
  #ln -s {L,$pkgdir/opt/$pkgname/data/base/Stage/l}ounge.tsc

  # Work around some other seemingly not-so-important "not found" errors.
  #ln -s {b,$pkgdir/opt/$pkgname/data/base/B}k0.bmp
  #ln -s {b,$pkgdir/opt/$pkgname/data/base/ogph/B}k0.bmp

  # Install the binary.
  if [ "$CARCH" == "i686" ] ; then
    install -Dm755 CaveStory+ $pkgdir/opt/$pkgname
  else
    install -Dm755 CaveStory+_64 $pkgdir/opt/$pkgname/CaveStory+
  fi

  # Install the startup script.
  mkdir -p $pkgdir/usr/bin
  install -m755 $srcdir/$pkgname $pkgdir/usr/bin

  # Install icons and .desktop files.
  mkdir -p $pkgdir/usr/share/{icons,applications}
  install -m644 $startdir/$pkgname.png $pkgdir/usr/share/icons
  install -m644 $startdir/$pkgname.desktop $pkgdir/usr/share/applications
}

# vim: set sts=2 sw=2 et:
