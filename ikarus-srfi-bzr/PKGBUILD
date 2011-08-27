# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Geoffrey Teale <tealeg@member.fsf.org)
pkgname=ikarus-srfi-bzr
pkgver=93
pkgrel=2
pkgdesc="A basic framework for SRFIs ported to R6RS."
url="https://code.launchpad.net/~scheme-libraries-team/scheme-libraries/srfi"
arch=('i686' 'x86_64')
license=('GPL')
depends=('ikarus')
makedepends=('ikarus')
conflicts=()
replaces=()
backup=)(
install=
source=()
md5sums=()
_bzrtrunk='http://bazaar.launchpad.net/~scheme-libraries-team/scheme-libraries/srfi'
_bzrmod='srfi'
build() {
  cd "$srcdir"

  if [ -d $_bzrmod/.bzr ]; then
    (cd $_bzrmod && bzr up -r $pkgver)
  else
    bzr co --lightweight $_bzrtrunk -r $pkgver $_bzrmod
  fi

  mkdir -p "$pkgdir/usr/lib/ikarus/srfi"
  cd "$srcdir/$_bzrmod"
  bzr export "$pkgdir/usr/lib/ikarus/srfi"
}