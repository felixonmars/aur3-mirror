#Contributor Mihai Coman <mihai@m1x.ro>

pkgname=miraimath
pkgver=0.5
pkgrel=2
pkgdesc="Simple graphical frontend for Octave, with native mathematical notation."
arch=('i686' 'x86_64')
url="http://mirai.sourceforge.net"
license=('GPLv2')
depends=('octave' 'java-runtime')
install=miraimath.install

if [[ "$CARCH" == 'i686' ]]; then
	source=("http://downloads.sourceforge.net/sourceforge/mirai/miraimath-0.5-linux-x86.tar.bz2" "miraimath.desktop")
	md5sums=('fee8e9224d3cddd4d47794585385848a' '68a2714a97d9961dbc3284abe956ca94')
else
	source=("http://downloads.sourceforge.net/sourceforge/mirai/miraimath-0.5-linux-x86_64.tar.bz2" "miraimath.desktop")
	md5sums=('77fb8a5761183a13b629a058e339c202' '68a2714a97d9961dbc3284abe956ca94')
fi

package() {
  # install program

  mkdir -p "$pkgdir/opt/$pkgname/"
  cp -r "$srcdir"/miraimath-0.5/* "$pkgdir/opt/$pkgname/"
 
  # install launcher
  cd "${srcdir}"

echo "#!/bin/sh
cd /opt/miraimath
./mmoctave.sh \"$@\"
" > ./$pkgname.sh

  install -Dm755 ./$pkgname.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "${srcdir}/miraimath.desktop" "${pkgdir}/usr/share/applications/miraimath.desktop"
  
  #install icons

  install -Dm644 "$srcdir/miraimath-0.5/ico/mirai64x64.png" "$pkgdir/usr/share/pixmaps/miraimath.png"

}
