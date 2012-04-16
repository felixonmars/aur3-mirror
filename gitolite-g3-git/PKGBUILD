# Maintainer: Benjamin Severs <benjaminsevers at gmail dot com>
pkgname=gitolite-g3-git
pkgver=20120415
pkgrel=2
pkgdesc="Gitolite allows you to setup git hosting on a central server, with very fine-grained access control and many (many!) more powerful features. (g3 branch)"
arch=('any')
url="https://github.com/sitaramc/gitolite"
license=('GPL')
depends=('git')
conflicts=('gitolite-git')
#replaces=('gitolite-git')

_gitroot=https://github.com/sitaramc/gitolite.git
_gitname=gitolite
_gitbranch=g3

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone -b "$_gitbranch" "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p ${pkgdir}/usr/lib/gitolite
  mkdir -p ${pkgdir}/usr/bin
  ./install -to ${pkgdir}/usr/lib/gitolite
  ln -s /usr/lib/gitolite/gitolite ${pkgdir}/usr/bin/
}

# vim:set ts=2 sw=2 et:
