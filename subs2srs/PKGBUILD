# Maintainer: darkgrin <darkgrin@yahoo.com>
pkgname=subs2srs
pkgver=27.0
pkgrel=1
pkgdesc="A small utility that allows you to create Anki (flash card software) import files based on your favorite foreign language movies and TV shows to aid in the language learning process."
arch=('i686' 'x86_64')
url="http://subs2srs.sourceforge.net/"
license=('GPL')
depends=('mono')
optdepends=('ffmpeg' 'anki')
source=('http://downloads.sourceforge.net/project/subs2srs/subs2srs/subs2srs_v27.0/subs2srs_v27.0.zip')
md5sums=('2d6b7eaec64a49064448baf11f5e29c2')

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/opt"
  cp -r "$srcdir/$pkgname" "$pkgdir/opt/"

  mkdir -p "$pkgdir/usr/bin"
  cat << "EOF" > "$pkgdir/usr/bin/$pkgname"
#!/bin/bash
if [ ! -d $HOME/.subs2srs ]; then
    mkdir $HOME/.subs2srs
fi
if [ ! -f $HOME/.subs2srs/preferences.txt ]; then
    cp /opt/subs2srs/preferences.txt $HOME/.subs2srs/
fi
cd $HOME/.subs2srs
mono /opt/subs2srs/subs2srs.exe
EOF
 
  chmod 755 "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
