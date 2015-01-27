# Maintainer: Ayen
# Modified from kq1vga package by Ner0

pkgname=kq3vga
pkgver=1.1
pkgrel=1
pkgdesc="King's Quest III Redux: To Heir is Human"
arch=('any')
url="http://www.agdinteractive.com/games/kq3/about/overview.html"
license=('custom')
depends=('ags-git' 'unionfs-fuse')
makedepends=('innoextract')
options=('!strip')
source=("http://www.agdinteractive.com/gamelinks/KQ3_Redux11.exe"
	"$pkgname.desktop"
	"$pkgname.png"
	"$pkgname.sh")
md5sums=('8b6de083ce42a58d2b5cb731e53c7458'
         'c9cc6d1bb7acbc58682ecb3ba432044e'
         'f8c8274cc2ac69cbc87f1d6fa5a98588'
         '8412f72b7377f3875ddb08cca15a8826')

PKGEXT='.pkg.tar'

package() {
  # Extracting the game
  innoextract KQ3_Redux11.exe

  # Creating the dirs
  install -dm755 "$pkgdir/opt/ags/"

  # Editing the configuration file (otherwise the game is letterboxed)
  sed -i 's/gfxfilter=None/gfxfilter=StdScale4/' app/acsetup.cfg
  sed -i 's/gfxdriver=DX5/gfxdriver=D3D9/' app/acsetup.cfg

  # Removing unnecessary files and moving the game files
  rm -f app/{*.url,*.ico,*.pdf,*.txt,Launcher.exe,winsetup.exe}
  mv "$srcdir/app" "$pkgdir/opt/ags/$pkgname/"

  # Installing the launch script and the desktop file
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
