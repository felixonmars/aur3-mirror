# Contributor: Urs Wolfer <uwolfer @ fwo.ch>
# Based on work by: cs-cam <me.at.camdaniel.com>

pkgname=abctorrent-win
pkgver=3.1.0
pkgrel=3
pkgdesc="ABC is an improved client for the Bittorrent peer-to-peer file distribution solution."
url="http://pingpong-abc.sf.net"
depends=('wxpython')
makedepends=('icoconvert' 'zip')
source=(http://dl.sourceforge.net/sourceforge/pingpong-abc/ABC-win32-v3.1.zip)
md5sums=('2902d0b33aa48f4b34e492ca8ea94ebc')

_del_files="abc.exe.manifest abc.nsi clean.bat how_to_compile.txt makedist.bat setupabc.py"

build() {
  cd $startdir/src/$pkgver
  sed -e 's/\, "lang"/, "Lang"/g' -i Lang/lang.py
  ln -s Lang lang
# remove the french language file because it makes unicode problems in the preferences dialog
  rm -rf Lang/french.lang
  rm -rf $_del_files
  mkdir -p $startdir/pkg/usr/{share/abctorrent,share/pixmaps,bin}
  icoconvert icon_abc.ico &> /dev/null
  cp icon_abc_32X32_32bpp.png $startdir/pkg/usr/share/pixmaps/abc.png
  cp -r * $startdir/pkg/usr/share/abctorrent
  echo "#!/bin/bash
cd /usr/share/abctorrent
python abc.py" > $startdir/pkg/usr/bin/abctorrent
  chmod +x $startdir/pkg/usr/bin/abctorrent
}