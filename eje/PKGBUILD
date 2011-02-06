# Contributor: yannsen <ynnsen@gmail.com>
pkgname=eje
pkgver=5.1b179
pkgrel=2
pkgdesc="Editing Java Easily (EJE) is an IDE designed especially for programming novices"
arch=(i686 x86_64)
url="http://www.eje-home.de"
license=('custom')
depends=('java-runtime>=1.5')
makedepends=('unzip')
source=(http://www.mps.de/kuestermann/eje/resources/5.1/$pkgname-$pkgver.zip)
md5sums=('d11ad27139155f8d7673283749e5b6a9')

build() {
  install -d $pkgdir/usr/bin/
  install -d $pkgdir/usr/share/java/eje/
  install -d $pkgdir/usr/share/eje/
  cd $startdir/src/
  sed -i '5c "$JAVA_HOME/bin/java" -jar /usr/share/java/eje/eje.jar' eje.sh
  install -m755 eje.sh $pkgdir/usr/bin/eje
  cp -R $startdir/src/{docs,images,legal} $pkgdir/usr/share/eje
  cp $startdir/src/bin/{*.jar,*.zip} $pkgdir/usr/share/java/eje/
  cp $startdir/src/bin/{*.png,*ico} $pkgdir/usr/share/eje/images
  
}

