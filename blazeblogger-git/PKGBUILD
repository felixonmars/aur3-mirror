# Maintainer: megadriver <megadriver at gmx dot com>
# Contributor: Florian Pritz <bluewind@xssn.at>
# Contributor: Abakus <java5@arcor.de>

pkgname=blazeblogger-git
pkgver=20120523
pkgrel=1
pkgdesc="A simple to use but capable CMS for the command line (development version)"
arch=('any')
url="http://code.google.com/p/blazeblogger/"
license=('GPL')
depends=('perl')
makedepends=('git')
optdepends=('markdown: Markdown support')

_gitroot="git://gitorious.org/blazeblogger/mainline.git"
_gitname="mainline"

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
}

package() {
  cd "$srcdir/$_gitname-build"
  sed -i 's|/usr/bin/pod2man|pod2man|' Makefile
  sed -i 's|/usr/bin/install|install|' Makefile
  make prefix=$pkgdir/usr config=$pkgdir/etc install
}
