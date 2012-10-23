pkgname=sheepshear
pkgver=20121022
pkgrel=1
pkgdesc="SheepShear, an advanced PowerPC emulator designed to run MacOS classic"
arch=(i686 x86_64)
url="https://github.com/kallisti5/sheepshear"
license=("GPLv2")
depends=(libxxf86dga gtk2 libxxf86vm)
makedepends=(git scons)
source=("http://sheepshaver.cebix.net/images/sheep.png")
md5sums=('694e1efa81d9faf6dbd514938340c260')
_gitroot="$url.git"
_gitname="sheepshear"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  
  scons
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm755 "build-release/SheepShear" "$pkgdir/usr/bin/sheepshear"
  install -Dm644 "$srcdir/sheep.png" "$pkgdir/usr/share/icons/$pkgname.png"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -m644 README.md "$pkgdir/usr/share/licenses/$pkgname/"
  mkdir -p "$pkgdir/usr/share/applications"
  echo '[Desktop Entry]
Categories=Application
Exec=sheepshear
GenericName=Mac OS PowerPC Classic Emulator
Icon=sheepshear.png
Name=SheepShear
Type=Application' > "$pkgdir/usr/share/applications/$pkgname.desktop"
} 