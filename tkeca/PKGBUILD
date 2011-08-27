# Maintainer: Luis Pablo Gasparotto <lpgasparotto(at)gmail(dot)com>
pkgname=tkeca
pkgver=4.4.3
pkgrel=1
pkgdesc="A fully featured frontend for Kai Vehmanen's Ecasound"
url="http://tkeca.sourceforge.net/"
arch=('any')
license=('GPL2')
depends=('tcl' 'tk' 'ecasound' 'sh')
optdepends=('ladspa' 'cmt' 'liblrdf' 'fftw' 'swh-plugins')
source=(http://downloads.sourceforge.net/tkeca/${pkgname}-${pkgver}.tar.gz)
md5sums=('5b59ad746d4d76dacfd2ed26c2072aaa')

build() {
   echo "no need to build"
}

package() {
 cd $srcdir/${pkgname}-${pkgver}
 install -m 755 -D tkeca.tcl $pkgdir/usr/bin/tkeca.tcl
 install -m 755 -d $pkgdir/usr/share/${pkgname}
 install -m 644 -D tkeca.html $pkgdir/usr/share/${pkgname}/tkeca.html
 install -m 644 -D license.txt $pkgdir/usr/share/${pkgname}/license.txt
 install -m 644 -D tkeca.png $pkgdir/usr/share/pixmaps/tkeca.png
 install -m 644 -D tkeca.desktop $pkgdir/usr/share/applications/tkeca.desktop
 install -m 644 -D README.tkeca $pkgdir/usr/share/${pkgname}/README.tkeca
}
