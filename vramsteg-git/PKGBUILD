# Please send modification via github
# https://github.com/maxmeyer/archlinux-vramsteg-git
# Maintainer: MaxMeyer <dev@fedux.org>
pkgname=vramsteg-git
pkgver=20120412
pkgrel=2
pkgdesc="A CLI progress bar that can be used from any script language"
arch=(i686 x86_64)
url="http://tasktools.org/projects/vramsteg.html"
license=('custom:MIT')
depends=(gcc-libs)
makedepends=('git' 'cmake')
provides=(vramsteg)

_gitroot=git://tasktools.org/vramsteg.git
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

  #
  # BUILD HERE
  #
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make 
}

package() {
  cd "$srcdir/$_gitname-build"
  install -D LICENSE $pkgdir/usr/share/licenses/${pkgname/-git}/LICENSE
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
