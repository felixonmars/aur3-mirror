#!/usr/bin/bash
#Manteiner: felipe.facundes
pkgname=myspell-pt-br
pkgver=20110527
pkgrel=2
pkgdesc="The Portuguese Brazil dictionary for myspell (Hydro-Quebec version). Solution by autocorrection for LibreOffice 4"
depends=("libreoffice-writer" "libreoffice-pt-BR")
conflicts=("hunspell-pt-br")
url="https://sites.google.com/site/felipefacundes/"
license="GPL"
arch=("any")
source=("http://ftp.br.debian.org/debian/pool/main/m/myspell-pt-br/myspell-pt-br_20110527-2_all.deb")
sha256sums=("3db25f9ba16dbdc81d90e4c294b248cd0d7aa06afea8e704797765c4c6f3398e")
build() {
  bsdtar -xf data.tar.gz 
  cp -r $srcdir/usr/ $pkgdir/
}

