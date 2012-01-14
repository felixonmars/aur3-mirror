# Contributor: Samed Beyribey <ras0ir AT eventualis dot org>
pkgname=zemberek-nolibs
pkgver=2.1.1
pkgrel=1
pkgdesc="Turkish spell checker library"
arch=('i686' 'x86_64')
url="http://zemberek.googlecode.com"
license=('MPL')
groups=('zemberek')
depends=('java-environment')
makedepends=('apache-ant')
conflicts=()
source=(http://zemberek.googlecode.com/files/zemberek-$pkgver-nolibs-src.zip)
noextract=()
md5sums=('282455bcd7051b8f24e19a0196a3ce4e')

build() {
  cd "$srcdir/zemberek-$pkgver-nolibs-src"
  /usr/share/java/apache-ant/bin/ant || return 1
  install -d $pkgdir/usr/share/java/zemberek
  install -D -m644 $srcdir/zemberek-$pkgver-nolibs-src/dagitim/jar/*.jar $pkgdir/usr/share/java/zemberek
  ln -s /usr/share/java/zemberek/zemberek-az-$pkgver.jar $pkgdir/usr/share/java/zemberek/zemberek-az.jar
  ln -s /usr/share/java/zemberek/zemberek-cekirdek-$pkgver.jar $pkgdir/usr/share/java/zemberek/zemberek-cekirdek.jar
  ln -s /usr/share/java/zemberek/zemberek-demo-$pkgver.jar $pkgdir/usr/share/java/zemberek/zemberek-demo.jar
  ln -s /usr/share/java/zemberek/zemberek-tk-$pkgver.jar $pkgdir/usr/share/java/zemberek/zemberek-tk.jar
  ln -s /usr/share/java/zemberek/zemberek-tr-$pkgver.jar $pkgdir/usr/share/java/zemberek/zemberek-tr.jar
}
