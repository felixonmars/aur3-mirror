# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Urs Wolfer <uwolfer @ fwo.ch>
# Based on work by: cs-cam <me.at.camdaniel.com>

pkgname=abctorrent-win
pkgver=3.1.0
pkgrel=3
pkgdesc="ABC is an improved client for the Bittorrent peer-to-peer file distribution solution."
url="http://pingpong-abc.sf.net"
license=('Python Software Foundation')
arch=('any')
depends=('wxpython')
makedepends=('zip')
source=(http://prdownloads.sourceforge.net/pingpong-abc/ABC-win32-v3.1.zip?download)
md5sums=('2902d0b33aa48f4b34e492ca8ea94ebc')

_del_files="abc.exe.manifest abc.nsi clean.bat how_to_compile.txt makedist.bat setupabc.py"

package() {
  cd $startdir/src/$pkgver
  sed -e 's/\, "lang"/, "Lang"/g' -i Lang/lang.py
  ln -s Lang lang
# remove the french language file because it makes unicode problems in the preferences dialog
  rm -rf Lang/french.lang
  rm -rf $_del_files
  mkdir -p $startdir/pkg/usr/{share/abctorrent,share/pixmaps,bin}
  cp -r * $startdir/pkg/usr/share/abctorrent
  echo "#!/bin/bash
cd /usr/share/abctorrent
python abc.py" > $startdir/pkg/usr/bin/abctorrent
  chmod +x $startdir/pkg/usr/bin/abctorrent
}
