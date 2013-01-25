# Maintainer: Ner0
# The launch script is based on Tea23's scripts (https://github.com/Tea23/arch-gog)

pkgname=kq1vga
pkgver=4.1c
pkgrel=1
pkgdesc="King's Quest: Quest for the Crown, VGA remake"
arch=('any')
url="http://www.agdinteractive.com/games/kq1/about/about.html"
license=('custom')
depends=('ags-git' 'unionfs-fuse')
makedepends=('innoextract')
options=('!strip')
install=kq1vga.install
source=("http://mirror.zeeb.org/agdi/Kq1vga41c.exe"
	"$pkgname.desktop"
	"$pkgname.png"
	"$pkgname.sh"
	'LICENSE.txt')
md5sums=('c025ccce5d1cf817140a520e7806bb62'
         'fb6df50c7e83445859d723096938e93c'
         'be1015b4a0d400afe73a156990cb16e4'
         '6236be2de666a54f129850abcf22cfc0'
         '215e3d5b1bbe418a67c2d06fdb4049da')

PKGEXT='.pkg.tar'

package() {
  # Extracting the game
  innoextract Kq1vga41c.exe

  # Creating the dirs
  install -dm755 "$pkgdir/opt/ags/"

  # Editing the configuration file (otherwise the game is letterboxed)
  sed -i 's/gfxfilter=None/gfxfilter=StdScale4/' app/acsetup.cfg
  sed -i 's/gfxdriver=DX5/gfxdriver=D3D9/' app/acsetup.cfg
  echo "antialias=1" >> app/acsetup.cfg

  # Removing unnecessary files and moving the game files
  rm -f app/{*.url,*.ico,*.pdf,*.txt,Launcher.exe,winsetup.exe}
  mv "$srcdir/app" "$pkgdir/opt/ags/$pkgname/"

  # Installing the launch script and the desktop file
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Installing the license
  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
