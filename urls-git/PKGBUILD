# Contributor: Henri Häkkinen <henuxd@gmail.com>

pkgname=urls-git
pkgver=20090523
pkgrel=1
pkgdesc="URL extractor"
arch=('i686' 'x86_64')
url="http://henux.nor.fi/projects/urls.php"
license=('GPL')
depends=('python')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://github.com/henux/urls.git"
_gitname="urls"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git-pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/urls" || return 1
  make PREFIX="$pkgdir/usr" install || return 1
}
