# Maintainer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>

pkgroot=gh-git
pkgname=gh-git
pkgver=latest
pkgrel=2
pkgdesc='Fast GitHub command line client (development version)'
url='http://owenou.com/gh/'
license=('MIT')
source=('git+https://github.com/jingweno/gh.git')
md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')
arch=('i686' 'x86_64')
makedepends=('git' 'go' 'mercurial')
conflicts=('gh')
provides=('gh')

pkgver() {
  cd "${srcdir}/${pkgroot}"

  git describe --always | sed 's/^v//;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgroot}"

  # Set up the environment.
  export GOPATH=$(pwd):$(pwd)/Godeps/_workspace
  GHSRC=`mktemp -d -t gh.XXX`
  GHDEP=src/github.com/jingweno

  # Install source to GOPATH.
  cp -r $(pwd)/. $GHSRC
  mkdir -p $GHDEP
  mv $GHSRC $GHDEP/gh
}

build() {
  cd "${srcdir}/${pkgroot}"

  # Build it!
  go build -o bin/gh
}

package() {
  cd "${srcdir}/${pkgroot}"

  # Install the program.
  install -Dm755 bin/gh "${pkgdir}/usr/bin/gh"
}

# vim: ft=sh ts=2 sw=2 et
