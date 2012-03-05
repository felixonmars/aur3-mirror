# Maintainer: Stefan Seemayer <mail@semicolonsoftware.de>
pkgname=invedit
pkgver=0.9.17
pkgrel=1
pkgdesc="Minecraft Inventory Editor"
arch=(any)
url="http://www.minecraftforum.net/topic/14190-invedit/"
license=('GPL')
depends=( mono )
makedepends=()
provides=()
conflicts=( invedit-git )
replaces=()
backup=()
options=()
install=invedit.install
source=(http://copy.mcft.net/mc/INVedit/INVedit.zip invedit.desktop invedit.png)
md5sums=('5a2aabe7de5579a297d4b180ef6f41bf'
         '8a74dfee530af3181a8c3b0ec50cf4b7'
         '7e3e85448d9681d46c36b0f574f88619')

package() {
  cd "$srcdir/INVedit"

  # create directory structure
  mkdir -p $pkgdir/usr/{bin,share/{invedit,pixmaps,applications}} || exit 1

  # install binaries
  install -Dm755 "INVedit.exe" "NBT.dll" "$pkgdir/usr/share/invedit/"

  # install required files (items list, images, etc.)
  install -m644 "items.txt" "items.png" "special.png" "terrain.png" "$pkgdir/usr/share/invedit/"

  # install shell script so we can launch INVedit with "invedit"
  echo -e "#!/bin/bash\nmono /usr/share/invedit/INVedit.exe" > "$pkgdir/usr/bin/invedit" && chmod 755 "$pkgdir/usr/bin/invedit"

  # install icon and freedesktop.org .desktop file
  install -Dm644 "$srcdir/invedit.png" "$pkgdir/usr/share/pixmaps/invedit.png"
  install -Dm644 "$srcdir/invedit.desktop" "$pkgdir/usr/share/applications/invedit.desktop"

}

# vim:set ts=2 sw=2 et:
