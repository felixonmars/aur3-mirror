# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=jacksum
pkgver=1.7.0
pkgrel=3
pkgdesc="JAva ChecKSUM calculator, supports >=58 popular algorithms"
arch=('i686' 'x86_64')
url="http://www.jonelo.de/java/jacksum/index.html"
license=('GPL')
depends=('java-runtime')
makedepends=('unzip')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.zip
        $pkgname.{sh,png})
md5sums=('f1cf99f9e2b68016668dce4c4d51d346'
         '90005a2727afdc2ae9a31932e53afa7f'
         '07f4001ab53a384162ceeb1c23ca6baa')

# As soon as I figure out how to integrate "magic", I'll add the following:
# http://www.jonelo.de/java/$pkgname/$pkgname.magic

build() {
  cd $srcdir
  install -D -m644 $pkgname.jar $pkgdir/usr/share/java/$pkgname/$pkgname.jar
  install -D -m755 $pkgname.sh $pkgdir/usr/bin/$pkgname
  install -D -m644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
