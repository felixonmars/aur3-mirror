# Maintainer: Timothy Rice <t dot rice at ms dot unimelb dot edu dot au>
_gitname=picocoin
pkgname=${_gitname}-git
pkgver=0
pkgrel=1
pkgdesc="Tiny bitcoin library, with lightweight client and utils."
license=('MIT')
url="https://github.com/jgarzik/${_gitname}"
_gitroot="$url".git
arch=('x86_64')
depends=('glib2' 'openssl' 'libevent' 'jansson')
makedepends=('git')
provides=('libccoin' 'picocoin' 'brd')
source=("git+${_gitroot}")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  license_dir=usr/share/licenses
  msg "Installing custom license ..."
  mkdir -pv "$pkgdir"/usr/share/licenses/
  cp -v COPYING "$pkgdir"/usr/share/licenses/"$pkgname"
}

# vim:set ts=2 sw=2 et:
