# Maintainer: Atilla ÖNTAŞ <tarakbumba@gmail.com>
# Contributor: Samed Beyribey <ras0ir AT eventualis dot org>
pkgname=zemberek
pkgver=2.1.1
pkgrel=3
pkgdesc="Turkish spell checker library"
arch=('i686' 'x86_64')
url="http://zemberek.googlecode.com"
license=('MPL')
groups=('zemberek')
depends=('java-environment')
makedepends=('apache-ant')
replaces=('zemberek-nolibs')
provides=('zemberek-nolibs')
conflicts=('zemberek-nolibs')
source=("http://zemberek.googlecode.com/files/zemberek-${pkgver}-nolibs-src.zip"
        'zemberek-demo')
md5sums=('282455bcd7051b8f24e19a0196a3ce4e'
         '97ab5c3167226d9ec82d75e65bb68037')

build() {
  cd "${srcdir}/zemberek-${pkgver}-nolibs-src"
  
  # Remove prebuild jars and classes (aka clean environment)
  find . -type f -name "*.class" | xargs rm -f
  find . -type f -name "*.jar" | xargs rm -f
  
  # Begin package build
  ant
}

package(){
  cd "${srcdir}/zemberek-${pkgver}-nolibs-src"
  install -d $pkgdir/usr/share/java/zemberek
  install -d $pkgdir/usr/bin
  install -D -m755 $srcdir/zemberek-demo $pkgdir/usr/bin/zemberek-demo
  install -D -m644 $srcdir/zemberek-$pkgver-nolibs-src/dagitim/jar/zemberek-az-$pkgver.jar \
   $pkgdir/usr/share/java/zemberek/zemberek-az.jar
  install -D -m644 $srcdir/zemberek-$pkgver-nolibs-src/dagitim/jar/zemberek-cekirdek-$pkgver.jar \
   $pkgdir/usr/share/java/zemberek/zemberek-cekirdek.jar
  install -D -m644 $srcdir/zemberek-$pkgver-nolibs-src/dagitim/jar/zemberek-demo-$pkgver.jar \
   $pkgdir/usr/share/java/zemberek/zemberek-demo.jar
  install -D -m644 $srcdir/zemberek-$pkgver-nolibs-src/dagitim/jar/zemberek-tk-$pkgver.jar \
   $pkgdir/usr/share/java/zemberek/zemberek-tk.jar
  install -D -m644 $srcdir/zemberek-$pkgver-nolibs-src/dagitim/jar/zemberek-tr-$pkgver.jar \
   $pkgdir/usr/share/java/zemberek/zemberek-tr.jar
}
