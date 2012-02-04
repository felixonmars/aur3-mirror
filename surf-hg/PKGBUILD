# Contributor: totoloco <totoloco at gmail dot com>

pkgname="surf-hg"
pkgver=221
pkgrel=1
pkgdesc="It's a simple webbrowser which is based on webkit/gtk+.The latest hg pull."
url="http://surf.suckless.org"
license=("MIT/X")
arch=("i686" "x86_64")
depends=("gtk2" "libwebkit")
makedepends=("pkgconfig" "mercurial" "xorg-utils")
conflicts=("surf")
provides=("surf")

_hgroot="http://hg.suckless.org"
_hgrepo="surf"

build() {
  cd ${srcdir}
  
  if [ -d ${_hgrepo} ]; then
    cd ${_hgrepo}
    make clean
    hg pull -u
  else
    hg clone ${_hgroot}/${_hgrepo}
    cd ${_hgrepo}
  fi
  
  msg "Starting build process."
  make || return 1
  make PREFIX=/usr DESTDIR=${pkgdir} install || return 1
  install -Dm0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
