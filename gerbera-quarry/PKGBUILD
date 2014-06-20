# Maintainer: Herbert Knapp <herbert.knapp at edu.uni-graz.at>
pkgname=gerbera-quarry
pkgver=1
pkgrel=1
pkgdesc="Save the robots in this beautiful 3D game. Gerbera Quarry by Moppi Productions."
arch=(any)
url="http://unknown/"
license=('Freeware')
depends=(wine)
makedepends=(unzip)
noextract=("Quarry.zip")
source=(gerbera-quarry
        "Quarry.zip::http://moppi.inside.org/quarry/Quarry.zip")
sha256sums=('b0af855a2efde087e9d4c1d07beb39dbedb757376315a973673b364a6c35d784'
            'b8c1e8f823c318c3f63433bc4493887ad56b18d25377de3ac6d3bfb1ff32ed3d')

build() {
  mkdir -p "$srcdir/quarrydir"
  cd "$srcdir/quarrydir/"
  bsdtar xf "$srcdir/Quarry.zip"
}

package() {
  install -Dm755 "$srcdir/gerbera-quarry" "$pkgdir/usr/bin/gerbera-quarry"
  install -dm755 "$pkgdir/usr/share"
  cp -r "$srcdir/quarrydir/" "$pkgdir/usr/share/gerbera-quarry"
  find "$pkgdir/usr/share/gerbera-quarry/" -type f -exec chmod 644 "{}" \;
}

# vim:set ts=2 sw=2 et:
