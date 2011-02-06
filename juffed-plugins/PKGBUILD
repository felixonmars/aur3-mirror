pkgname=juffed-plugins
pkgver=0.8.1
pkgrel=1
pkgdesc="Various plugins for JuffEd text editor."
arch=('i686' 'x86_64')
url="http://code.google.com/p/juffed-plugins/"
license=('GPL2')
depends=('qt' 'juffed')
source=("http://downloads.sourceforge.net/project/juffed/Plugins/$pkgver/juffed-plugins_$pkgver.tar.gz")
md5sums=('36471f51cbdd3e0c80c27e5fb10a0e92')

build() {
  cd $srcdir/$pkgname-$pkgver
for i in charsets doclist favorites findinfiles fm keybindings terminal textmod; do
  cd $i
  qmake || return 1
  make || return 1
  mkdir -p $startdir/pkg/usr/share/juffed/plugins/
  install -Dm644 -p $srcdir/$pkgname-$pkgver/lib$i.so $pkgdir/usr/share/juffed/plugins/lib$i.so
cd ..
done
}
