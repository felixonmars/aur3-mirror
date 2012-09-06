#Mantainer: Filippo Squillace <sqoox85@gmail.com>
pkgname=golpy
pkgver=0.2.0
pkgrel=1
author=fsquillace
pkgdesc="A Conway's Game of Life Simulator written in Python"
arch=(any)
url="https://github.com/$author/$package"
license=('GPLv2')
depends=('python2' 'python2-numpy' 'wxpython')
makedepends=('asciidoc' 'xmlto')
provides=()
options=()
source=(https://github.com/downloads/$author/$pkgname/$pkgname-$pkgver.tar.gz)

md5sums=(97f35f33c1f66f653db648fde37ef894)
optdepends=('pycuda: For GPU support')

build() {
  cd "$srcdir"

  echo "Moving the licence into /usr/share/licenses/${pkgname} ..."
  mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
  mv -f "$pkgname/LICENSE" $pkgdir/usr/share/licenses/${pkgname}/

  echo "Copying the $pkgname directory into the pkg directory ..."
  mkdir -p "$pkgdir/opt"
  cp -rf "$pkgname" "$pkgdir/opt/$pkname"

  # Generate manual page
  echo "Generating manual page..."
  /usr/bin/asciidoc -d manpage -b docbook -o ${pkgname}.1.xml $pkgname/README
  /usr/bin/xmlto man ${pkgname}.1.xml # Add --skip-validation if it doesn't work
  /usr/bin/gzip ${pkgname}.1
  mkdir -p "${pkgdir}/usr/share/man/man1/"
  cp ${pkgname}.1.gz ${pkgdir}/usr/share/man/man1/


  chmod +x $pkgdir/opt/$pkgname/$pkgname
  # Creating symlink
  echo "Creating symlink..."
  mkdir -p $pkgdir/usr/bin
  ln -s ../../opt/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname

 
}

# vim:set ts=2 sw=2 et:
