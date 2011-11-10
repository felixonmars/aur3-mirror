# Maintainer: Ivy Foster <joyfulgirl@archlinux.us>
pkgname=luapdf-git
pkgver=20111110
pkgrel=1
pkgdesc="Micro-PDF framework extensible in lua"
arch=('i686' 'x86_64')
url="https://github.com/karottenreibe/luapdf"
license=('GPL3')
depends=('lua' 'luafilesystem' 'poppler-glib' 'gtk2' 'libunique')
makedepends=('git' 'help2man')
optdepends=('luajit: just-in-time compilation')
provides=('luapdf')
backup=('etc/xdg/luapdf/binds.lua'
        'etc/xdg/luapdf/document.lua'
        'etc/xdg/luapdf/globals.lua'
        'etc/xdg/luapdf/modes.lua'
        'etc/xdg/luapdf/rc.lua'
        'etc/xdg/luapdf/theme.lua'
        'etc/xdg/luapdf/window.lua')
changelog=ChangeLog
source=()
md5sums=()

_gitroot=git://github.com/karottenreibe/luapdf.git
_gitname=luapdf

_makeopts="DEVELOPMENT_PATHS=0 PREFIX=/usr"
#_makeopts="DEVELOPMENT_PATHS=0 PREFIX=/usr USE_LUAJIT=1"

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

  chmod +x build-utils/{getversion.sh,gentokens.lua}
  make $_makeopts all
}

package() {
  cd "$srcdir/$_gitname-build"
  make $_makeopts DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
