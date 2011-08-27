# Maintainer: Dan Serban
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=writer2latex
pkgver=1.0.2
pkgrel=1
pkgdesc="Convert OO-Writer documents to LaTeX"
arch=(any)
url=http://writer2latex.sourceforge.net/
license=(LGPL)
depends=('java-runtime')
source=("http://downloads.sourceforge.net/project/writer2latex/writer2latex/Writer2LaTeX%201.0/writer2latex102.zip")
md5sums=('dc6d39766d5046ca73f96faad64e474a')

build()
{
  mv writer2latex10 writer2latex
  mkdir -p "$pkgdir/usr/share"
  mv writer2latex "$pkgdir/usr/share/"
  mkdir -p "$pkgdir/usr/bin"
  USRBINFILE="$pkgdir/usr/bin/w2l"
  echo "#!/bin/bash" > "$USRBINFILE"
  echo 'java -jar /usr/share/writer2latex/writer2latex.jar "$@"' >> "$USRBINFILE"
  chmod +x "$USRBINFILE"
}
