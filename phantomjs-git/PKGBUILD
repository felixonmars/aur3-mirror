# Maintainer: Bruno Vieira <mail@bmpvieira.com>
# Contributor: Eivind Uggedal <eivind@uggedal.com>

pkgname=phantomjs-git
pkgver=20130108
pkgrel=1
pkgdesc="Headless WebKit with JavaScript API"
url="http://www.phantomjs.org/"
license=("BSD")
arch=('i686' 'x86_64')
depends=(openssl fontconfig freetype2)
makedepends=(git upx)
conflicts=(phantomjs)
provides=(phantomjs)
options=('!strip')
_gitroot="https://github.com/ariya/phantomjs.git"
_gitname="phantomjs"

build() {
  cd "$srcdir"
  msg "Connecting to git server...."
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 "$_gitroot" "$_gitname"
  fi
  msg "Git checkout done or server timeout"

  msg "Starting build..."
  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  ./build.sh --confirm
}

package() {
  cd "$srcdir/$_gitname-build"
  ./deploy/package.sh

  _version=$(bin/phantomjs --version | sed 's/ /-/' | sed 's/[()]//g')
  cd deploy/phantomjs-$_version-linux-$CARCH
  install -Dm755 bin/phantomjs $pkgdir/usr/bin/phantomjs
  install -Dm644 LICENSE.BSD $pkgdir/usr/share/licenses/$_gitname/LICENSE.BSD
  install -Dm644 README.md $pkgdir/usr/share/doc/$_gitname/README.md
  install -Dm644 ChangeLog $pkgdir/usr/share/doc/$_gitname/ChangeLog
  install -Dm644 third-party.txt $pkgdir/usr/share/doc/$_gitname/third-party.txt
  install -dm755 examples $pkgdir/usr/share/doc/$_gitname/examples
  cp -r examples/* $pkgdir/usr/share/doc/$_gitname/examples/
}
