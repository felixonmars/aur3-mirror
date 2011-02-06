# Contributor: unexist <unexist@dorfelite.net>
pkgname="subtly-hg"
pkgver=49
pkgrel=1
pkgdesc="A small ruby webkit/gtk browser"
arch=("i686" "x86_64")
url="http://subtle.de/projects/show/subtly"
license=("GPL")
depends=("ruby" "ruby-ffi" "libwebkit" "gtk2")
makedepends=("mercurial" "ruby")
provides=("subtly")
source=()
md5sums=()

_hgroot="http://hg.subtle.de"
_hgrepo="subtly"

build() {
  msg "Connecting to mercurial repository..."

  cd ${srcdir}

  if [ -d "${hgrepo}" ]; then
    cd ${_hgrepo}
    hg pull -u -r ${pkgver}
    rake clobber
  else
    hg clone -r ${pkgver} "${_hgroot}/${_hgrepo}"
    cd ${_hgrepo}
  fi

  msg "Mercurial clone finished."
  msg "Starting rake..."

  cd "${srcdir}"
  cp -r ${_hgrepo} ${_hgrepo}-build
  cd "${_hgrepo}-build"

  rake destdir=${startdir}/pkg install || return 1

  rm -rf "${srcdir}/${_hgrepo}-build"
}
