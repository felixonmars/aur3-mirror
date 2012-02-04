# Contributor: Sergey Kolesov <cucullus.at.mail.ru>

pkgname=quantum
pkgver=1.33
pkgrel=1
pkgdesc="A simple adaption of the RTS game 'Dyson' focusing on multiplayer with alliances and routing"
arch=('i686' 'x86_64')
url="http://apistudios.com/hosted/marzec/quantum/"
license=('GPL')
depends=('jogl')
source=("http://apistudios.com/hosted/marzec/quantum/$pkgname-$pkgver-pack.zip" quantum.png quantum.desktop quantum.sh)

md5sums=('f983964b8262acfd225fd24c59f9fbd7'
         'a50d3da62e1ad4e2afd1b169ca97c05a'
         '739ad85edb7e1313279dab9b5ce5e328'
         '2dfb3d0ee86b3a69cdf9cdf89a40d732')

build() {
    cd $srcdir/$pkgname

    install -Dm 644 ../$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
    install -Dm 644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    install -Dm 755 ../$pkgname.sh $pkgdir/usr/bin/$pkgname
  
    rm *jogl* *gluegen*	bsh*		# rm deps & unnecessary files
    mkdir -p $pkgdir/usr/share/java/$pkgname
    install -m 644 *.jar  $pkgdir/usr/share/java/$pkgname
}
