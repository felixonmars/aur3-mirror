# Maintainer: kang <kang@insecure.ws>
pkgname=ipv6-toolkit-git
pkgver=1.3.4
pkgrel=1
source=(meh.patch)
pkgdesc="SI6 Networks' IPv6 Toolkit"
arch=(x86_64)
url="https://github.com/fgont/ipv6-toolkit"
md5sums=('ee516a43887b89fdae3cb91cb3476fd2')
license=('GPL')
makedepends=('git')

_gitroot=https://github.com/fgont/ipv6-toolkit
_gitname=master

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
  patch -R -p0 < "$startdir/meh.patch"

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
