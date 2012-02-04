# Maintainer: Neal van Veen <nealvanveen at gmail>
pkgname=go-gb-git
pkgver=20111224
pkgrel=1
pkgdesc="A(nother) tool to build go projects"
arch=('i686' 'x86_64')
url="http://code.google.com/p/go-gb"
license=('Apache')
depends=('go')
makedepends=('git')
provides=('go-gb')
conflicts=('go-gb')
source=()
md5sums=()

_gitroot=git://github.com/skelterjohn/go-gb.git
_gitname=go-gb
_gittag=go.weekly.2011-12-22

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
  cd "$srcdir/$_gitname-build/gb"

  git checkout -q $_gittag
  make
}

package() {
  cd "$srcdir/$_gitname-build/gb"
  install -d -m755 "${pkgdir}/usr/bin/"
  install -m755 gb "${pkgdir}/usr/bin/go-gb"
}

# vim:set ts=2 sw=2 et:
