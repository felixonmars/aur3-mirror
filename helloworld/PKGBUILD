#Maintainer: <BENUTZER> <EMAIL> 
pkgname=helloworld #Paketname
pkgver=20130314 #Versionsnummer ggf. Datum
pkgrel=1.0 #Releaseversion
pkgdesc="Simple helloworld" #Helloworld
arch=('any') #Alle Architekturen nutzbar
url="http://technik.blogbasis.net" #URL des Projekts
license=('GPL') #Licence
#depends=('curl') #Abhängigkeiten des Programms ; Hier: Keine
makedepends=('wget') #Abhängigkeiten zum erstellen des Paketes





_srcURL="http://localhost/helloworld.txt"

build() {
    rm -rf $srcdir/$pkgname-$pkgver
    mkdir $srcdir/$pkgname-$pkgver
    wget $_srcURL -O $srcdir/$pkgname-$pkgver/helloworld.sh
    cd $srcdir/$pkgname-$pkgver
}

package() {
mkdir -p $pkgdir/usr/bin
cp "$srcdir/$pkgname-$pkgver/helloworld.sh" "$pkgdir/usr/bin/helloworld"
chmod +x $pkgdir/usr/bin/helloworld
}
