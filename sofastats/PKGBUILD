# Maintainer: David Scholl <djscholl at gmail dot com>

pkgname=sofastats
pkgver=1.4.3
pkgrel=1
pkgdesc="Statistics Open For All"
arch=('any')
url="http://www.sofastatistics.com/"
license=('custom')
depends=('wxpython2.8' 'python2-matplotlib' 'python2-pysqlite' 'mysql-python' 'pywebkitgtk' 'hspell' 'python2-xdg' 'python2-psycopg2' 'python2-xlwt')
makedepends=('python2-distribute')
replaces=('sofa')
source=("http://downloads.sourceforge.net/sofastatistics/$pkgname-$pkgver.tar.gz" "setup.py" "sofastats.desktop")
md5sums=('74e8b118152dec77bdc3ff327aa9e158'
         '9c1586449e528c751a2cf77294eea142'
         'f267ddd0371a29a3466bec780eda3fd6')

build() {
  cd $srcdir/$pkgname-$pkgver
  cp $srcdir/setup.py ./ 
  touch sofa_main/__init__.py
  python2 setup.py build 
}
package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
  echo "#!/bin/bash" > sofastats
  echo "/usr/bin/env python2 "\
  "/usr/lib/python$(pacman -Q python2 | colrm 1 8 | colrm 4)/site-packages/sofastats/start.py "\
  >> sofastats
  chmod a+x sofastats
  install -D sofastats $pkgdir/usr/bin/sofastats 
  install -D copyright $pkgdir/usr/share/licenses/$pkgname/copyright
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

