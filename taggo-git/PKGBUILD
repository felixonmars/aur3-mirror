# Maintainer: Enric Morales <geekingaround@enric.me>
pkgname=taggo-git
pkgver=20121119
pkgrel=2
pkgdesc="A tag organizer that uses names of files and folders to create symlinks."
arch=('any')
url="http://blog.boa.nu/2012/11/tagging-files-and-folders-using-hashtags-and-symlinks.html"
license=('GPL')
depends=('python2')
makedepends=('git')
install=info.install
source=('001-config-path.patch')
md5sums=('c1355e5a7cf2d4addb4d84ed76a48916')

_gitroot="git://github.com/xeor/taggo.git"
_gitname=taggo

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

  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' taggo
  patch -p0 -i ${srcdir}/001-config-path.patch

}

package() {
  cd "$srcdir/$_gitname-build"
  install -D -m 755 -g root -o root taggo ${pkgdir}/usr/bin/taggo
  install -D -m 755 -g root -o root README.rst ${pkgdir}/usr/share/doc/taggo/README.rst
}

# vim:set ts=2 sw=2 et:
