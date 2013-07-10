# Contributor: Matthew Bauer <mjbauer95@gmail.com>
# Maintainer: mystax <mystax@wagn.me>
pkgname=roblox
pkgver=6cfc785e896545ae
pkgrel=1
pkgdesc="Roblox is a massively multiplayer online game (MMOG) virtual playground and workshop designed for children aged 6 and over. Uses Wine."
arch=('any')
url="http://www.roblox.com/"
license=('custom')
depends=('wine')
source=('http://setup.roblox.com/version-6cfc785e896545ae-Roblox.exe'
        'roblox')
md5sums=('7e49cd1bfd0809a115d03eb4c21f1cf0'
         'b5c5a408abd34b452e4635c283d8c3e2')

build() {
  cd "$srcdir"

  mkdir -p $pkgdir/usr/share/roblox
  mv version-6cfc785e896545ae-Roblox.exe Roblox.exe
  cp Roblox.exe $pkgdir/usr/share/roblox

  mkdir -p $pkgdir/usr/bin
  cp roblox $pkgdir/usr/bin
  chmod +x $pkgdir/usr/bin/roblox
}

# vim:set ts=2 sw=2 et:
