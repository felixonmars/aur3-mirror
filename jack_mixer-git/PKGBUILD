# Maintainer: orbisvicis <''.join(chr(ord(c)-1) for c in "pscjtwjdjtAhnbjm/dpn")>
# Contributor: Tom Vincent <http://www.tlvince.com/>

pkgname=jack_mixer-git
_pkg="${pkgname%-git}"
pkgver=20110930
pkgrel=1
pkgdesc="A GTK+ JACK audio mixer app with a look similar to its hardware counterpart"
arch=("i686" "x86_64")
url="http://home.gna.org/jackmixer/"
license=("GPL2")
depends=("python-fpconst" "jack" "hicolor-icon-theme" "desktop-file-utils" "gconf")
makedepends=("git" "swig")
optdepends=("lash: session support"
            "gnome-python: GConf settings preservation")
provides=("$_pkg")
conflicts=("$_pkg")
options=("!libtool")
install="${pkgname}.install"
source=("${pkgname}.install")
sha256sums=("e727108203d82cda7cd13cf43fe46701a4aa99271df435965e335bd218624976")

_gitroot="git://repo.or.cz/${pkgname/-/.}"
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

  #
  # BUILD
  #

  # use python2
  export PYTHON="/usr/bin/python2"

  # fix the hashbang in python scripts
  sed -i 's|env python|&2|' jack_mixer.py

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --sysconfdir="/etc" \
    --disable-schemas-install \
    --with-gconf-schema-file-dir="/usr/share/gconf/schemas"
  make
}

package() {
  local _gitdir="${srcdir}/${_gitname}"
  cd "$_gitdir"

  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
