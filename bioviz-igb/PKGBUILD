# Contributor: Decrypted Epsilon <decrypted.epsilon@gmail.com>

pkgname=bioviz-igb
__pkgname=igb
_pkgname="igb_exe.jar"
pkgver=8.0.4
pkgrel=1
pkgdesc="Integrated Genome Browser is an easy-to-use, highly customizable genome browser you can use to view and explore genomic data and annotations, especially RNA-Seq and ChIP-Seq data sets"
arch=('any')
url="http://bioviz.org/igb/"
license=('CPL')
depends=('java-environment' 'sh')
source=("http://downloads.sourceforge.net/project/genoviz/IGB%20$pkgver/$__pkgname.zip"
        "$pkgname.sh" "$pkgname.desktop" "$pkgname.png")
md5sums=('b42014e5a524e46577f929f3f7735274'
         'fb894fb9123f1376f44b4d80fd7c8617'
         '050cb62b7cfed90ec1fee39373116c82'
         'dcd3a50875fbc4623e6c9b4e382117ec')

package() {    
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"  
  install -Dm644 $srcdir/$__pkgname/$_pkgname "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"  
}

