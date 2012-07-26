# Maintainer: Sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg== | base64 -d>
# Contributor: Isaac Dupree <id@isaac.cedarswampstudios.org>
# Contributor: yannsen <ynnsen@gmail.com>
# Contributor: orbisvicis <orbisvicis@gmail.com>
pkgname=emerillon-git
pkgver=20120604
pkgrel=1
pkgdesc="OpenStreetMap viewer"
arch=("i686" "x86_64")
url="http://projects.gnome.org/emerillon/"
license=("GPL" "LGPL")
depends=("geoclue" "libchamplain" "rest" "libpeas" "dconf" "desktop-file-utils")
makedepends=("git" "gnome-common" "vala" "gtk-doc" "intltool")
provides=("emerillon")
conflicts=("emerillon")
options=("!libtool")
install="${pkgname}.install"
source=("${pkgname}.install")
sha256sums=('5843901ce1b5ff81f4712e96310781dd1ce06c0868b0ac6766e5f8e552e7dee9')

_gitroot="git://git.gnome.org/emerillon"
_gitname="emerillon"

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

  # "--disable-schemas-compile" unnecessary: configure does not run
  # "glib-compile-schemas" if DESTDIR is given during "make install"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  local _gitdir="${srcdir}/${_gitname}"
  cd "${_gitdir}"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et: