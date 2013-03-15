# Maintainer: qwitwa  <qwitwa@gmail.com>
pkgname=pemacs-git
pkgver=20130315
pkgrel=1
epoch=
pkgdesc="An implementation of microemacs"
arch=('any')
url="https://github.com/hughbarney/pEmacs"
license=('custom')
groups=()
depends=('ncurses')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
md5sums=('SKIP')

_gitroot="https://github.com/hughbarney/pEmacs.git"
_gitname="pemacs"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."
  if [ -d "$_gitname" ] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 "$_gitroot" "$_gitname"
  fi
  msg "GIT checkout done or server timeout"

  cd "$srcdir/$_gitname"
  msg "Starting make..."
  make LFLAGS='-lcurses'
}

package() {
  cd "$srcdir/$_gitname"
  install -d "$pkgdir/usr/bin" 
  install -m 755 pe "$pkgdir/usr/bin/pemacs" 
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  echo "pEmacs is released into the public domain." > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
