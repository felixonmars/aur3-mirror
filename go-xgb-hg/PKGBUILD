# Maintainer: Rémy Oudompheng <remy@archlinux.org>

pkgname=go-xgb-hg
_goname=xgb
pkgver=9
pkgrel=1
pkgdesc="Go package for X11 protocol based on XCB descriptions"
arch=('i686' 'x86_64')
url="http://code.google.com/p/x-go-binding"
license=('custom')
depends=('go')
makedepends=('mercurial' 'python2' 'xcb-proto')
provides=('go-xgb')
options=('!strip')
source=("Makefile")
md5sums=('0cca2741e62b642aef9175db471c9262')

_hgroot="https://code.google.com/p/x-go-binding/"
_hgrepo="x-go-binding"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  source /etc/profile.d/go.sh
  cd ${_goname}
  cp ${srcdir}/Makefile .
  gomake
}

package() {
  cd "$srcdir/$_hgrepo-build"
  source /etc/profile.d/go.sh
  mkdir -p ${pkgdir}/${GOROOT}/src/pkg/${_goname}
  # copy source files
  cp -Rv ${srcdir}/${_hgrepo}/* ${pkgdir}/${GOROOT}/src/pkg/${_goname}
  # install libraries
  cd ${_goname}
  cp -v ${GOROOT}/src/Make.* ${pkgdir}/${GOROOT}/src/
  GOROOT=${pkgdir}/${GOROOT} gomake install
  rm -f ${pkgdir}/${GOROOT}/src/Make.*
}

# vim: set ts=2 sw=2 et:
