# Maintainer: Dylan Lloyd <dylan@dylansserver.com>
pkgname=powermate
pkgver=20120313
pkgrel=1
pkgdesc="haskell bindings and bash scripts to control alsa/pianobar/mpd"
url="http://dylansserver.com/git/powermate.git"
arch=('any')
license=('GPL')
install="$pkgname.install"
makedepends=('ghc')
depends=('haskell-powermate' 'haskell-regex-posix')

_gitroot=git://dylansserver.com/powermate.git
_gitname=powermate

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  ghc powermate.hs -o powermate
}

package() {
  cd "$srcdir/$_gitname-build"

  install -D -m755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}

  install -D -m755 scripts/next $pkgdir/usr/bin/next
  install -D -m755 scripts/back $pkgdir/usr/bin/back
  install -D -m755 scripts/music-toggle $pkgdir/usr/bin/music-toggle
  install -D -m755 scripts/volume-up $pkgdir/usr/bin/volume-up
  install -D -m755 scripts/volume-down $pkgdir/usr/bin/volume-down
  install -D -m755 scripts/volume-toggle $pkgdir/usr/bin/volume-toggle
  install -D -m755 scripts/pianobar-toggle $pkgdir/usr/bin/pianobar-toggle
  install -D -m755 scripts/pianobar-next $pkgdir/usr/bin/pianobar-next

  install -D -m644 icons/volume-up.png \
      $pkgdir/usr/share/icons/powermate/volume-up.png
  install -D -m644 icons/volume-down.png \
      $pkgdir/usr/share/icons/powermate/volume-down.png
  install -D -m644 icons/volume-mute.png \
      $pkgdir/usr/share/icons/powermate/volume-mute.png
  install -D -m644 icons/volume-on.png \
      $pkgdir/usr/share/icons/powermate/volume-on.png
  install -D -m644 icons/volume-mute.png \
      $pkgdir/usr/share/icons/powermate/volume-mute.png
  install -D -m644 icons/skip-forward.png \
      $pkgdir/usr/share/icons/powermate/skip-forward.png
  install -D -m644 icons/skip-backward.png \
      $pkgdir/usr/share/icons/powermate/skip-backward.png

  install -D -m644 99-${pkgname}.rules $pkgdir/lib/udev/rules.d/99-${pkgname}.rules

  install -D -m644 ${pkgname}.1 $pkgdir/usr/share/man/man1/${pkgname}.1
#  install -D -m644 ${pkgname}.rc $pkgdir/usr/share/doc/${pkgname}/${pkgname}.rc
}
