
# Contributor: Samed Beyribey <samed@archlinux.org.tr>
pkgname=onemanga-downloader
pkgver=20100516
pkgrel=2
pkgdesc="One Manga Downloader (shell script)"
arch=('any')
url="http://github.com/suksit/onemanga"
install="$pkgname.install"
license=('GPL')
depends=('bc' 'zip')
makedepends=('git')

_gitroot="http://github.com/suksit/onemanga.git"
_gitname="onemanga"

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

  #
  # BUILD HERE
  #

  install -Dm755 onemanga $pkgdir/usr/bin/onemanga
} 
