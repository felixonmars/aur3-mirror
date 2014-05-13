#Maintainer: Diogo Leal <estranho@diogoleal.com>
#Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=modfs-git
pkgver=20110301
pkgrel=2
pkgdesc="Wrapper around unionfs-fuse that uses a file-based branches configuration."
arch=(any)
url="https://gist.github.com/849049"
license=('custom:WTFPL')
groups=()
depends=('unionfs-fuse')
makedepends=('git')
source=(http://sam.zoy.org/wtfpl/COPYING)
md5sums=('8365d07beeb5f39d87e846dca3ae7b64')

_gitroot="http://github.com/gist/849049.git"
_gitname="modfs"

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
}

package() {
  install -Dm755 "$srcdir/$_gitname-build/modfs.sh" "$pkgdir/usr/bin/modfs"
  install -Dm644 "$srcdir/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
} 
