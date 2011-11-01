# Maintainer: blades <blades at gecko dot org dot uk>

pkgname=mediafrontpage-git
pkgver=20111101
pkgrel=1
pkgdesc="A dashboard page for xbmc, sabnzbd, sickbeard, couchpotato, etc."
arch=('i686' 'x86_64')
url="https://github.com/MediaFrontPage/mediafrontpage"
license=('unknown')
depends=('php')
makedepends=('git')
install='mediafrontpage.install'

_gitroot="git://github.com/MediaFrontPage/mediafrontpage.git"
_gitname="master"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ]; then
     cd $_gitname && git pull origin
     msg "The local files are updated."
  else
     git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"
}

package() {
  mkdir -p "${pkgdir}/srv/http/"
  cp -r "$srcdir/$_gitname" "${pkgdir}/srv/http/mediafrontpage"
}

