# Contributor: H.Gökhan SARI <hsa2@difuzyon.net>
pkgname=lrg
pkgver=0.2.0
pkgrel=1
pkgdesc="A Python GUI tool for rapidshare premium member to download rapidshare links."
arch=('i686')
url="http://lrg.sourceforge.net/"
license=('GPL')
groups=()
depends=('python-pycurl' 'wxpython')
#makedepends=()

source=(http://surfnet.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz lrg lrg.desktop)
md5sums=('1042fab4d27d1ee5d65e339ebb89d38e'
         'c63a23b9e565f6ac9d212ea6a234614d'
         'a9601c965268a63cce36dd515aeaab13')

build() {
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/{lrg,pixmaps,applications}/
  cp $startdir/lrg $pkgdir/usr/bin/lrg
  cp $startdir/lrg.desktop $pkgdir/usr/share/applications/
  chmod +x $pkgdir/usr/bin/lrg
  cp $srcdir/$pkgname/gui/images/icon.png $pkgdir/usr/share/pixmaps/lrg.png
  cp -r $srcdir/$pkgname/* $pkgdir/usr/share/lrg/
}
