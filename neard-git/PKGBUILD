# Maintainer: <kang@insecure.ws>
pkgname=neard-git
pkgver=1
pkgrel=1
pkgdesc="Neard is an NFC daemon and library."
arch=(x86_64)
url="https://01.org/linux-nfc"
license=('GPL')
depends=('systemd' 'dbus')
makedepends=('make' 'autoconf' 'gcc' 'automake' 'git' 'pkg-config' 'libtool')

_gitroot=git://git.kernel.org/pub/scm/network/nfc/neard.git
_gitname=neard

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
  ./bootstrap
  ./configure --prefix=/usr --enable-ese --enable-tools --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
