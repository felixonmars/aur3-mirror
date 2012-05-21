# Maintainer: Jakub Nawalaniec <aur@prymityw.pl>

pkgname=slock-dpms
pkgver=20120521
pkgrel=1
pkgdesc="Fixed DPMS in a simple screen locker for X"
arch=('i686' 'x86_64')
url="https://github.com/pielgrzym/slock-dpms"
license=('MIT')
depends=('libxext')
conflicts=('slock')
_gitroot=git://github.com/pielgrzym/slock-dpms.git
_gitname=slock-dpms
build() {
  cd "$srcdir"
  msg "Conncecting to GIT repository..."
  if [[ -d "$_gitname" ]]; then
          cd "$_gitname" && git pull origin
          msg "The local files are updated."
  else
          git clone "$_gitroot" "$_gitname" --depth 1
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting build..."
  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/$_gitname-build"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
