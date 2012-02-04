# Maintainer: Isaac Dupree <id@isaac.cedarswampstudios.org>
# Contributor: orbisvicis <''.join(chr(ord(c)-1) for c in "pscjtwjdjtAhnbjm/dpn")>
# Contributor: yannsen <ynnsen@gmail.com>
pkgname=geoclue-git
_pkg="${pkgname%-git}"
pkgver=20111001
pkgrel=1
pkgdesc="A modular geoinformation service built on top of the D-Bus messaging system."
arch=("i686" "x86_64")
url="http://geoclue.freedesktop.org/"
license=("LGPL")
depends=("libsoup" "networkmanager" "dconf")
makedepends=("git" "gtk-doc")
optdepends=()
provides=("$_pkg")
conflicts=("$_pkg")
options=(!libtool)
install="${_pkg}.install"
source=("${_pkg}.install")
sha1sums=("24bfe423fd63cf15353f9fed8af43cef3507b2ad")

_gitroot="git://anongit.freedesktop.org/git/${_pkg}"
_gitname="$_pkg"

build() {
  local _gitdir="${srcdir}/${_gitname}"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitdir" ]]; then
    cd "$_gitdir" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitdir"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  cd "$_gitdir"
  git clean -dfx
  git reset --hard HEAD

  # Build
  ./autogen.sh
  # geoclue-gpsd provider is not yet compatible with the GPSd 3.x API
  ./configure \
    --prefix=/usr \
    --libexecdir="/usr/lib/${_pkg}" \
    --disable-schemas-compile \
    --disable-static \
    --enable-gpsd=no
  make
}

package() {
  local _gitdir="${srcdir}/${_gitname}"
  cd "${_gitdir}"

  make DESTDIR="$pkgdir" install
} 
