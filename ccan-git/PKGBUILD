# Maintainer: philomath <philomath868 AT gmail DOT com>
pkgname=ccan-git
pkgver=20120521
pkgrel=2
pkgdesc="Comprehensive C Archive Network (If perl can, maybe Ccan?)"
arch=('i686' 'x86_64')
url="http://ccodearchive.net/"
license=('GPL')
depends=('bash')
makedepends=('git')

_gitroot=git://git.ozlabs.org/~ccan/ccan
_gitname=ccan

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

  make config.h
  make
  make tools
}

package() {
  cd "$srcdir/$_gitname-build/"
  install -Dm 644 libccan.a "$pkgdir/usr/lib/libccan.a"
  install -D tools/configurator/configurator "$pkgdir/usr/bin/configurator"
  install -D tools/ccanlint/ccanlint "$pkgdir/usr/bin/ccanlint"
  install -D tools/ccan_depends "$pkgdir/usr/bin/ccan_depends"
  install -D tools/doc_extract "$pkgdir/usr/bin/doc_extract"
  install -D tools/namespacize "$pkgdir/usr/bin/namespacize"
  install -D tools/create-ccan-tree "$pkgdir/usr/bin/create-ccan-tree"
  install -D doc/ccanlint.1 "$pkgdir/usr/share/man/man1/ccanlint.1"
  mkdir -p "$pkgdir/usr/include/ccan"
  cd ccan/
  for file in */*.h; do
  cp --parents $file "$pkgdir/usr/include/ccan"; done
}

# vim:set ts=2 sw=2 et:
