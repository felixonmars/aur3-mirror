# Contributor: gonzo <danielgn at gmx dot de>

pkgname="tabbed-hg"
pkgver=147
pkgrel=1
pkgdesc="The latest hg pull of tabbed, a simple generic tabbed fronted to xembed aware applications"
url="http://tools.suckless.org/tabbed"
license=("MIT/X")
arch=("i686" "x86_64")
depends=("libx11")
makedepends=("mercurial")
conflicts=("tabbed")
provides=("tabbed")

_hgroot="http://hg.suckless.org"
_hgrepo="tabbed"

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
  make PREFIX=/usr/ DESTDIR=${pkgdir} install || return 1
  install -Dm0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
