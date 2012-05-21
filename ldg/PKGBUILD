# Maintainer: Michal Walczak <magikmw@michalwalczak.eu>

pkgname=ldg
pkgver=20120521
pkgrel=1
pkgdesc="A small laz0r dodging game"
arch=('i686' 'x86_64')
url="http://michalwalczak.eu"
license=('BSD')
if test "$CARCH" == i686; then
  depends=('python2' 'sdl' 'libgl' 'libpng12')
elif test "$CARCH" == x86_64; then
  depends=('python2' 'sdl' 'libgl' 'libpng12')
fi
makedepends=('git')
provides=('ldg')

_gitroot="git://github.com/magikmw/ldg.git"
_gitname="ldg"

build() {
  _dest_dir="$pkgdir/usr/share/$pkgname"
  cd "${srcdir}"

  msg "connecting to github.org git server"
  if [ -d ${srcdir}/$_gitname ] ; then
    rm -rf $_gitname && git clone $_gitroot $_gitname || return 1
  else
    git clone $_gitroot $_gitname || return 1
  fi
  msg "git checkout done"
  msg "removing unnessesary files..."

  cd $_gitname
  rm .gitignore
  rm -rf .git
  rm SDL.dll
  rm ldg_windows.bat
  rm notes
  rm main/libtcod-mingw.dll
  rm main/setup.py

  if test "$CARCH" == i686; then
    rm main/libtcod64.so
  elif test "$CARCH" == x86_64; then
    rm main/libtcod32.so
  fi

  touch ldg.log
  touch ldg.log_old

  chmod 666 ldg.log
  chmod 666 ldg.log_old

  msg "installing..."

  mkdir -p "$_dest_dir"
  cp -a "$srcdir/$pkgname/." "$_dest_dir"

  mkdir -p "$pkgdir/usr/bin"
  ln -sfr "$_dest_dir/ldg_linux.sh" "$pkgdir/usr/bin/$pkgname"
}
