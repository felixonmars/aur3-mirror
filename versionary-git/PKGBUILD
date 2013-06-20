# Maintainer: Micah Elliott <mde@MicahElliott.com>

pkgname=versionary-git
pkgver=20130619
pkgrel=1
pkgdesc="show concise system info for linux on console"
arch=('any')
url="https://github.com/MicahElliott/versionary"
license=('GPL')
depends=('lsb-release' 'bash')
provides=('versionary' 'ver')
makedepends=('git' 'ruby-ronn')
md5sums=()

_gitroot="git://github.com/MicahElliott/versionary"
_gitname=versionary-git

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

  # BUILD HERE
  ronn --manual 'Versionary Manual' --organization "Versionary v0.$pkgrel" README.md
  mv README versionary.1
  gzip versionary.1
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm755 versionary $pkgdir/usr/bin/versionary
  install -Dm755 ver $pkgdir/usr/bin/ver
  install -Dm644 versionary.1.gz $pkgdir/usr/share/man/man1/versionary.1.gz
}

# vim:set ts=2 sw=2 et:
