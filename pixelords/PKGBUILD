# Contributor: Lauri Niskanen <ape@ape3000.com>

pkgname=pixelords
pkgver=20091213
pkgrel=2
pkgdesc="Multiplayer shooter game"
arch=('any')
url="http://pixelords.sourceforge.net/"
license=('GPL')
depends=('python2' 'python-pygame')
makedepends=('git')
optdepends=('mutagen: nicer "Now Playing" messages')
provides=('pixelords')

_gitroot="git://pixelords.git.sourceforge.net/gitroot/pixelords/pixelords"
_gitname="pixelords"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --depth 1 $_gitroot
  fi

  msg "GIT checkout done or server timeout"

  # INSTALL

  install -m755 -D $srcdir/$_gitname/scripts/pixelords $pkgdir/usr/bin/pixelords || return 1
  install -m644 -D $srcdir/$_gitname/scripts/pixelords.desktop $pkgdir/usr/share/applications/pixelords.desktop || return 1
  
  install -m755 -d $pkgdir/usr/share/games/pixelords || return 1
  cp -r $srcdir/$_gitname/* $pkgdir/usr/share/games/pixelords || return 1

  # Remove unnecessary files:
  rm -rf $pkgdir/usr/share/games/pixelords/scripts/
  rm -rf $pkgdir/usr/share/games/pixelords/resources/extra/

  find ${pkgdir}/usr/share/games/pixelords -type d -exec chmod 755 "{}" \; || return 1
  find ${pkgdir}/usr/share/games/pixelords -type f -exec chmod 644 "{}" \; || return 1

}
