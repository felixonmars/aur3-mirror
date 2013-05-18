pkgname=rssyl
pkgver=0.34
pkgrel=1
pkgdesc="claws-mail plugin for RSS and Atom feeds"
arch=(i686 x86_64)
url="http://www.claws-mail.org/plugin.php?plugin=rssyl"
license=('GPL')
groups=(network)
depends=('claws-mail>=3.9.0' 'curl' 'libxml2')
source=("http://www.claws-mail.org/downloads/plugins/$pkgname-$pkgver.tar.gz")
md5sums=('49b45608e8d160b3625d3d50016ec2ca') 

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
