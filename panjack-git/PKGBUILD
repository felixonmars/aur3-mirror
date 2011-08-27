# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkg=panjack
pkgname=$_pkg-git
pkgver=20110404
pkgrel=2
pkgdesc="A real-time surround-sound panorama mixer."
arch=('i686 x86_64')
url="http://rg42.org/oss/panjack/start"
license=('GPL')
depends=('opencv' 'liblo' 'jack')
optdepends=('pd: pd extension')
makedepends=('git')

_gitroot="git://mir.dnsalias.com/$_pkg"
_gitname="$_pkg"

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

  cd $_pkg && make
  cd ../oscpanctl && make
}

package() {
  cd "$srcdir/$_gitname-build"

  install -Dm755 $_pkg/$_pkg "$pkgdir/usr/bin/$_pkg"
  install -Dm755 oscpanctl/oscpanctl "$pkgdir/usr/bin/oscpanctl"

  install -d "$pkgdir/usr/share/$_pkg"
  install -Dm755 *.sh "$pkgdir/usr/share/$_pkg"

  install -d "$pkgdir/usr/lib/pd/extra"
  install -Dm644 osc.pd "$pkgdir/usr/lib/pd/extra"
} 
