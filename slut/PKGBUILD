# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>

pkgname=slut
pkgver=0.9.0
pkgrel=3
pkgdesc="Programming framework for generative, synthetic, interactive, network-enabled graphics."
url="http://slut.sourceforge.net/"
license=("GPL")
depends=('python' 'python-pygame' 'twisted' 'python-opengl' 'fonttools' 'pil' )
arch=(i686 x86_64)
makedepends=('python')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('ae117867403643815f3f76775648c2d5')

build() {
  cd $startdir/src/$pkgname-0.9
  python setup.py install --root=$startdir/pkg/
  install -d -m755 $startdir/pkg/usr/share/slut
  cp -r web $startdir/pkg/usr/share/slut
}

