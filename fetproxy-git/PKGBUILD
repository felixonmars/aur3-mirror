# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>

pkgname=fetproxy-git
pkgver=20100317
pkgrel=1
pkgdesc="An open source replacement for msp430-gdbproxy, the MSP430 debugger"
arch=(i686 x86_64)
url="http://xgoat.com/wp/2009/03/25/fetproxy-an-open-source-replacement-for-msp430-gdbproxy/"
license=('GPL2')
depends=('gnet' 'libelf')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://gitorious.org/fetproxy/mainline.git"
_gitname="fetproxy"

build() {
  cd "${srcdir}"
  msg "Connecting to gitorious GIT server...."

  if [ -d "${srcdir}/$_gitname" ] ; then
    cd "$_gitname" && git fetch origin && cd "${srcdir}" || return 1
    msg "The local files are updated."
  else
    git clone --mirror "$_gitroot" "$_gitname" || return 1
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  if [ -d "${srcdir}/$_gitname-build" ] ; then
    rm -fr "${srcdir}/$_gitname-build"
  fi

  git clone -l "$_gitname" "$_gitname-build" || return 1
  cd "${srcdir}/$_gitname-build"

  msg "Starting Make..."
  LDFLAGS="-Wl,--hash-style=gnu"
  make || return 1
  install -Dm755 "${srcdir}/${_gitname}-build"/fetproxy "${pkgdir}"/usr/bin/fetproxy

  rm -fr "${srcdir}/$_gitname-build"
}
# vim:set ts=2 sw=2 et:
