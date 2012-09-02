# Maintainer: Raizner Evgeniy <razrfalcon@gmail.com>

pkgname=kdeplasma-applets-itmages
pkgver=17
pkgrel=1
pkgdesc="Plasma applet for uploading images to ITmages"
arch=('i686' 'x86_64')
url="https://launchpad.net/itmages"
license=('LGPL')
depends=('kdebase-workspace' 'itmages-dolphin-extension' 'libgexiv2')
makedepends=('bzr' 'cmake')
conflicts=('itmages-plasma-applet')
replaces=('itmages-plasma-applet')

_bzrtrunk=lp:itmages
_bzrmod=itmages

build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server...."

  if [[ -d "$_bzrmod" ]]; then
    cd "$_bzrmod" && bzr pull "$_bzrtrunk" -r "$pkgver"
    msg "The local files are updated."
  else
    bzr branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/build"
  mkdir "$srcdir/build"
  cd "$srcdir/build"
  cmake ../"$_bzrmod" \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}
