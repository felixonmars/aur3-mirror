# Maintainer: Dylan Lloyd <dylan@dylansserver.com>
pkgname=rotomatic
pkgver=20130108
pkgrel=1
pkgdesc="control audio and music with a griffin powermate"
url="http://github.com/nospampleasemam/rotomatic"
arch=('any')
license=('GPL')
install="$pkgname.install"
makedepends=('gcc')
depends=('libnotify' 'alsa-utils')

_gitroot=git://github.com/nospampleasemam/rotomatic.git
_gitname=rotomatic
_gitbranch=arch-package

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname" --branch "$_gitbranch"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  install -D -m755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}

  install -D -m755 scripts/music-next $pkgdir/usr/bin/music-next
  install -D -m755 scripts/music-previous $pkgdir/usr/bin/music-previous
  install -D -m755 scripts/music-toggle $pkgdir/usr/bin/music-toggle
  install -D -m755 scripts/pianobar-toggle $pkgdir/usr/bin/pianobar-toggle
  install -D -m755 scripts/pianobar-next $pkgdir/usr/bin/pianobar-next

  install -D -m644 icons/volume-up.png \
      $pkgdir/usr/share/icons/rotomatic/volume-up.png
  install -D -m644 icons/volume-down.png \
      $pkgdir/usr/share/icons/rotomatic/volume-down.png
  install -D -m644 icons/volume-mute.png \
      $pkgdir/usr/share/icons/rotomatic/volume-mute.png
  install -D -m644 icons/volume-on.png \
      $pkgdir/usr/share/icons/rotomatic/volume-on.png
  install -D -m644 icons/skip-forward.png \
      $pkgdir/usr/share/icons/rotomatic/skip-forward.png
  install -D -m644 icons/skip-backward.png \
      $pkgdir/usr/share/icons/rotomatic/skip-backward.png

  install -D -m644 99-powermate.rules $pkgdir/lib/udev/rules.d/99-powermate.rules

  install -D -m644 ${pkgname}.1 $pkgdir/usr/share/man/man1/${pkgname}.1
}
