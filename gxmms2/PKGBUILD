# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Slikkie <johan@slikkie.nl>

pkgname=gxmms2
pkgver=0.7.1
pkgrel=1
pkgdesc="GTK+2 based XMMS2 client"
arch=('i686' 'x86_64')
url="http://wejp.k.vu/projects/xmms2/"
license=('GPL')
depends=('xmms2' 'gtk2')
conflicts=('gxmms2-git')
source=("http://wejp.k.vu/files/$pkgname-$pkgver.tar.gz"
        "gxmms2.desktop")
md5sums=('20f1f4b513da4b78e74299ec3c6b5dc7'
         '2a09ca7203dd26e6ad61b13ea26408e0')


build() {
  cd $srcdir/$pkgname-$pkgver
  make gxmms2
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make PREFIX=$pkgdir/usr KRELLPREFIX=$pkgdir/usr install_gxmms2

  mkdir -p $pkgdir/usr/share/applications/
  cp $srcdir/gxmms2.desktop $pkgdir/usr/share/applications/
}
