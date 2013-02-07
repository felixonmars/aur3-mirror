#Mantainer: Filippo Squillace <feel.squally@gmail.com>
pkgname=pearl
pkgver=1.5.2
pkgrel=1
author=fsquillace
pkgdesc="An Enhanced Bash Shell Framework."
arch=(any)
url="https://github.com/$author/$package"
license=('GPLv2')
depends=('bash')
makedepends=('asciidoc' 'xmlto')
provides=()
options=()
source=(https://github.com/$author/$pkgname/tarball/$pkgver)
install=$pkgname.install

md5sums=(92480184cd6938599e9d877817c0bfc6)

optdepends=('rsync: synchronize your own file'
            'python: for executing some scripts'
            'ranger: file manager integrated with pearl')

#backup=(etc/{vimrc,inputrc})

build() {
  cd $srcdir/$author-$pkgname-*

  echo "Moving the licence into /usr/share/licenses/${pkgname} ..."
  mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
  mv -f "LICENSE" $pkgdir/usr/share/licenses/${pkgname}/

  echo "Copying the $pkgname directory into the pkg directory ..."
  mkdir -p "$pkgdir/opt/$pkgname"
  cp -rf * "$pkgdir/opt/$pkgname"

  # Generate manual page
  echo "Generating manual page..."
  /usr/bin/asciidoc -d manpage -b docbook -o ${pkgname}.1.xml README
  /usr/bin/xmlto man ${pkgname}.1.xml # Add --skip-validation if it doesn't work
  /usr/bin/gzip ${pkgname}.1
  mkdir -p "${pkgdir}/usr/share/man/man1/"
  cp ${pkgname}.1.gz ${pkgdir}/usr/share/man/man1/

}

# vim:set ts=2 sw=2 et:
