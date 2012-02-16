# Maintainer: Roman Timushev <rtimush@gmail.com>
pkgname=akonadi-git-resource-git
pkgver=20120216
pkgrel=1
pkgdesc="Monitor any git repository with KMail"
arch=(any)
url="http://blogs.kde.org/node/4537"
license=('unknown')
depends=(akonadi libgit2)
makedepends=('git')

_gitroot=git://anongit.kde.org/akonadi-git-resource
_gitname=akonadi-git-resource

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

  sed -i 's/git_commit_close/git_commit_free/g' *.cpp
  cmake ../${_gitname}-build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
