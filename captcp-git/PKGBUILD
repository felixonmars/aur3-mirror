# Maintainer: Michael Seiwald <michael at mseiwald dot at>
pkgname=captcp-git
_pkgname=captcp
pkgver=20121006
pkgrel=1
pkgdesc="a tool for TCP analysis of PCAP dump files"
arch=(any)
url="http://research.protocollabs.com/captcp/"
license=('GPL3')
depends=(python2 python2-dpkt pylibpcap python2-numpy)
source=()
md5sums=()

_gitroot="git://github.com/hgn/$_pkgname.git"
_gitname=$_pkgname

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

}

package() {
  cd "$srcdir/$_gitname-build"
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" captcp.py
  sed -i 's/$(prefix)/${DESTDIR}\/$(prefix)/g' Makefile
  mkdir -p ${pkgdir}/usr/bin
  make DESTDIR="${pkgdir}" install
  ln -sf /usr/share/captcp/captcp.py ${pkgdir}/usr/bin/captcp
}

# vim:set ts=2 sw=2 et:
