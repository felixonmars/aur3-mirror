# Maintainer: devlin zed <me@devlinzed.com>
pkgname=matcher-git
pkgver=r42.dc262df
pkgrel=1
pkgdesc="Intelligently searches through a list of file names for the one you were probably looking for."
arch=('any')
url="https://github.com/burke/matcher"
license=('BSD')
groups=()
depends=()
makedepends=('git')
provides=('matcher')
conflicts=('matcher')
replaces=()
backup=()
options=()
install=
source=(matcher-git::git://github.com/burke/matcher.git)
noextract=()
md5sums=('SKIP')

_gitroot=git://github.com/burke/matcher.git
_gitname=master

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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

  sed -i "s#PREFIX=/usr/local#PREFIX=/usr#g" Makefile

  #
  # BUILD HERE
  #
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -d "${pkgdir}/usr/bin"
  install -m 0755 matcher ${pkgdir}/usr/bin/matcher
}

# vim:set ts=2 sw=2 et:
