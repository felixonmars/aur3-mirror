# Contributor: Kevin Peters <65bones at gmail dot com>

pkgname=jbackpack
pkgver=0.9.3
pkgrel=1
pkgdesc="A grahical frontend to rdiff"
arch=(i686 x86_64)
url="http://www.nongnu.org/jbackpack/index.html"
license=('GPL')
depends=('java-runtime' 'rdiff-backup' 'expect' 'encfs' 'sshfs' 'rsync')
source=(http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.jar
        $pkgname.desktop $pkgname.launcher $pkgname.svg)

md5sums=('9f2fd83b40a4a487a6da6e15630946d2'
         '40200a2bebf8d1a5d5d31a9c08af4efd'
         'cc6e98e53298a64b2d767b5d7507e2d5'
         '05ed36e59ca5fab4d95d61d02b4e86e0')

build() {
  cd "$srcdir"
   install -Dm755 $pkgname.launcher "$pkgdir/usr/bin/$pkgname"
  install -Dm644 jbackpack-$pkgver.jar "$pkgdir/usr/share/java/$pkgname/jbackpack.jar"
  install -Dm644 $pkgname.svg "$pkgdir/usr/share/java/$pkgname/icon.svg"
  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}


