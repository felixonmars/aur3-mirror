# Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Contributor: wido <widomaker2k7@gmail.com>

pkgname=v4l2loopback-git
pkgver=20120213
pkgrel=1
pkgdesc="A kernel module to create V4L2 loopback devices"
url="https://github.com/umlaeute/v4l2loopback"
license=("GPL")
arch=('i686' 'x86_64')
install="$pkgname.install"
makedepends=('git' 'kernel26-headers')
conflicts=('v4l2loopback')
provides=('v4l2loopback')

_gitroot="git://github.com/umlaeute/v4l2loopback.git"
_gitname="v4l2loopback"

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

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm 644 "${srcdir}/${_gitname}-build/v4l2loopback.ko" \
    "$pkgdir/lib/modules/$(uname -r)/kernel/drivers/misc/v4l2loopback.ko"
}

# vim:set ts=2 sw=2 et:
