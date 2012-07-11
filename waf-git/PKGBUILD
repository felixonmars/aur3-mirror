# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=waf-git
pkgver=20120711
pkgrel=1
pkgdesc="General-purpose build system modelled after Scons"
arch=('any')
url="http://code.google.com/p/waf/"
license=('BSD')
depends=('python')
provides=('python-waf')
conflicts=('waf')
source=()
md5sums=()

_gitroot="https://code.google.com/p/waf/"
_gitname="waf"

build() {

  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  msg2 "Building..."
  ./waf-light configure --prefix=/usr
  ./waf-light --make-waf
  ./waf-light install -f --destdir="$pkgdir" \
            --tools='compat,compat15,ocaml,go,cython,scala,erlang,cuda,gcj,boost,pep8,eclipse'

  msg2 "Extracting license..."
  head waf -n 30 | tail -n 25 > LICENSE
}

package() {
  cd "${srcdir}/$_gitname-build"
  msg2 "Packaging binaries..."
  install -Dm755 waf "${pkgdir}/usr/bin/waf"
  # Force the generation of .waf.admin files
  cd demos/c
  "${pkgdir}"/usr/bin/waf configure build >& /dev/null
  cd ../..

  msg2 "Setting permissions..."
  chmod -R 0644 "${pkgdir}"/usr/bin/.waf*/waflib/Tools/*
  chown -R root:root "${pkgdir}"/usr/*

  msg2 "Packaging license..."
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

# vim:set ts=2 sw=2 et:
