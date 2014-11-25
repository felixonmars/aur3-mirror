# Maintainer: archtux <antonio dot arias99999 at gmail dot com>


# Robert can be downloaded from i2p with eepget(included in 'i2p' package).
# Open a terminal as a normal user and download the sources: eepget http://echelon.i2p/robert/Robert-0.0.40-STABLE.tar.gz
# Once you get the archive 'Robert-0.0.40-STABLE.tar.gz', place it in this directory.


pkgname=robert
pkgver=0.0.40
pkgrel=4
pkgdesc="Bittorrent client for I2P written in Python."
arch=('any')
url="http://sponge.i2p/files/Robert-Stable.torrent"
license=('MIT')
depends=('wxpython2.8')
optdepends=('i2p')
install=$pkgname.install
source=("hib://Robert-$pkgver-STABLE.tar.gz" 'robert' 'robert.desktop' 'robert.install')
md5sums=('c392ac2178b3aad7665dffad97713747'
         'ca55b5099ef8dd8a967f65668ee1f440'
         '0cabef1c699beb7d5297c1e3fc6312bb'
         '8e6443a777b319e0a9e81aa17716fd68')

package() {
   cd $srcdir/Robert-src/src

   # Make Robert work with wxPython2.8
   find . -iname '*.py' -exec sed -i -e "s|^import wx|import wxversion\nwxversion.select('2.8')\nimport wx|" '{}' +

   # License
   install -Dm644 LICENSES.TXT $pkgdir/usr/share/licenses/$pkgname/LICENSES

   # Install
   mkdir -p $pkgdir/usr/share/robert
   cp -r BitTorrent/ fonts/ images/ locale/ seahtml/ seautil/ *py $pkgdir/usr/share/robert

   # Desktop icon
   install -Dm644 images/robert.ico $pkgdir/usr/share/pixmaps/robert.ico
   cd $srcdir
   install -Dm644 robert.desktop $pkgdir/usr/share/applications/robert.desktop

   # Start file
   install -Dm755 robert $pkgdir/usr/bin/robert

   # Remove obsolete files
   rm $pkgdir/usr/share/robert/{btmetainfo,hotprof,win*}.py
}