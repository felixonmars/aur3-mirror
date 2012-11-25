# Maintainer: Abelardo Ricart
# Contributor: Dan Serban
# Contributor: Andrea Scarpino

pkgname=gdiskdump
pkgver=0.8
pkgrel=1
pkgdesc="This is a open source Graphical User Interface for the Unix Command dd."
arch=(any)
url=https://launchpad.net/gdiskdump
license=(GPL)
depends=(python2 pygtk python2-notify)
optdepends=(gksu gksudo)
source=("https://launchpad.net/gdiskdump/trunk/0.8/+download/gdiskdump-0.8.tar.gz")
md5sums=('20620e9fd4b09a7e4fa6178ca22ff2f2')

build() {
   cd "$srcdir/$pkgname-$pkgver"
   make
}

package()
{
  sed -i 's#^python #python2 #' "$srcdir/$pkgname-$pkgver"/bin/gdiskdump
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

