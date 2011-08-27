# Maintainer: Dan Serban
# Contributor: grimi <grimi at poczta dot fm>

pkgname=tunapie
pkgver=2.1.18
pkgrel=3
pkgdesc="A directory browser for internet radio and TV streams"
arch=(any)
url=http://tunapie.sourceforge.net/
license=(GPLv2)
depends=(python2 wxpython)
source=("http://downloads.sourceforge.net/project/tunapie/tunapie/2.1/$pkgname-$pkgver.tar.gz")
md5sums=('391684c1f26be1b12ff356e00f8c61f5')

build()
{
  cd $pkgname-$pkgver
  rm tunapie
  mv src/tplogo.xpm .
  mkdir -p "$pkgdir/usr/share"
  # Rename the app folder
  mv src tunapie
  # Move it into the right spot
  mv tunapie "$pkgdir/usr/share/"
  install -Dm644 tunapie.1 "$pkgdir/usr/share/man/man1/tunapie.1"
  install -Dm644 tunapie.desktop "$pkgdir/usr/share/applications/tunapie.desktop"
  install -Dm644 tplogo.xpm "$pkgdir/usr/share/pixmaps/tplogo.xpm"
  mkdir -p "$pkgdir/etc"
  # config: 0 for adult tv off, 1 for on
  echo 0 > "$pkgdir/etc/tunapie.config"
  mkdir -p "$pkgdir/usr/bin"
  echo "#!/bin/bash" > "$pkgdir/usr/bin/tunapie"
  echo "cd /usr/share/tunapie" >> "$pkgdir/usr/bin/tunapie"
  echo "python2 Tunapie.py" >> "$pkgdir/usr/bin/tunapie"
  chmod +x "$pkgdir/usr/bin/tunapie"
}
