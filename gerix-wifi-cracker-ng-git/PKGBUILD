# Maintainer: lssjbrolli <lssjbrolli@gmail.com>
pkgname=gerix-wifi-cracker-ng-git
pkgver=20111025
pkgrel=2
pkgdesc="A really complete GUI for Aircrack-NG which includes useful extras, git version"
arch=('any')
url="https://github.com/TigerSecurity"
license=('GPL')
groups=()
depends=('aircrack-ng' 'xterm' 'pyqt3')
makedepends=('git')
provides=(gerix-wifi-cracker-ng)
conflicts=(gerix-wifi-cracker-ng)
source=(gerix)
noextract=()
md5sums=('2c984e86130b1b479280affc1e4575c5')

_gitroot=git://github.com/TigerSecurity/gerix-wifi-cracker
_gitname=gerix-wifi-cracker

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
  make
}

package() {
  mkdir -p $pkgdir/usr/share/$pkgname/ | return 0
  mkdir -p $pkgdir/usr/bin/ | return 0
  install -D -m755 $srcdir/gerix $pkgdir/usr/bin/
  install -D -m755 $srcdir/$_gitname-build/gerix*.py $pkgdir/usr/share/$pkgname/ | return 0
  install -D -m644 $srcdir/$_gitname-build/gerix*.ui $pkgdir/usr/share/$pkgname/ | return 0
  install -D -m644 $srcdir/$_gitname-build/gerix*.ui.h $pkgdir/usr/share/$pkgname/ | return 0
  install -D -m644 $srcdir/$_gitname-build/gerix*.png $pkgdir/usr/share/$pkgname/ | return 0
  return 0
}

