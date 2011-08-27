# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=serenity-git
pkgver=20110406
pkgrel=1
pkgdesc="Command line driven automated episode renamer."
arch=('any')
url="http://github.com/fleger/serenity"
license=('GPL')
depends=('bash>=4.0' 'curl' 'html-xml-utils')
makedepends=('git')
backup=('etc/serenity.conf')

_gitroot="http://github.com/fleger/serenity.git"
_gitname="serenity"

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

  make PREFIX="/usr" CONFDIR="/etc" || return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  make PREFIX="/usr" CONFDIR="/etc" DESTDIR="$pkgdir/" install || return 1
}

