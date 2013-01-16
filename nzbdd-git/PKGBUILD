# Maintainer: Gereon Schomber <Gereon_Schomber@fastmail.fm>
pkgname=nzbdd-git
pkgver=20130111
pkgrel=1
pkgdesc="A Qt frontend for SABnzbd"
arch=(i686 x86_64)
url="http://dynup.de.vu/"
license=('GPL')
depends=(qt)
optdepends=('sabnzbd: for local downloading')

_gitroot=git://git.code.sf.net/p/nzbdd/code 
_gitname=nzbdd-code

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

  qmake PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm 755 bin/NZBdd $pkgdir/usr/bin/nzbdd
}

# vim:set ts=2 sw=2 et:
