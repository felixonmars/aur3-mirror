# Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=pauker
pkgver=1.8
pkgrel=3
pkgdesc="A flash card based learning tool using shortterm and longterm memory training"
arch=('any')
url="http://pauker.sourceforge.net/"
license=('GPL')
depends=('java-runtime')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.jar
        https://pauker.svn.sourceforge.net/svnroot/$pkgname/trunk/icon.svg
        $pkgname.desktop
        $pkgname.sh)
noextract=($pkgname-$pkgver.jar)
md5sums=('416a9d1f884d46f4e8d30ac8122c144f'
         '5aba9f20257b62f9ff27149f14d742c8'
         '25575de7823c35ed72e8d60648087e58'
         '2593047206e705b35083c1623644e869')

build() {
  cd "$srcdir"

  install -D -m644 $pkgname-$pkgver.jar $pkgdir/usr/share/java/$pkgname/$pkgname.jar
  install -D -m644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D -m755 $pkgname.sh $pkgdir/usr/bin/$pkgname
  install -D -m644 icon.svg $pkgdir/usr/share/pixmaps/$pkgname.svg
}
