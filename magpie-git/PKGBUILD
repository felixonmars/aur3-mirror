# Maintainer: Curtis McEnroe <programble@gmail.com>
pkgname=magpie-git
pkgver=20111209
pkgrel=1
pkgdesc="The Magpie programming language"
arch=('any')
url="http://magpie-lang.org/"
license=('MIT')
depends=('git' 'java-environment')
makedepends=('git' 'apache-ant')
source=('magpie')
md5sums=('d6c0ec0c26f2cb2466dc6edbe7d26270')

_gitroot="git://github.com/munificent/magpie.git"
_gitname="magpie-src"

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

  ant jar
}

package() {
  install -D magpie \
    ${pkgdir}/usr/bin/magpie

  install -D -m644 ${srcdir}/${_gitname}-build/magpie.jar \
    ${pkgdir}/usr/share/magpie/magpie.jar

  cp -r ${srcdir}/${_gitname}-build/lib/ \
    ${pkgdir}/usr/share/magpie/
}

# vim:set ts=2 sw=2 et:
