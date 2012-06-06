# Maintainer: Baobab <eternal.baobab@gmail.com>
# Contributor: watsonalgas <watsonalgas@gmail.com>

pkgname=cronometer
pkgver=0.9.9
pkgrel=1
pkgdesc="fully featured nutrition and biomarker tracking tool"
arch=('any')
url="http://cronometer.com/download"
license=('CPL')
depends=("java-runtime")
source=("http://downloads.sourceforge.net/project/cronometer/cronometer/${pkgver}/CRONoMeter-${pkgver}-MacOSX.zip"
        "cronometer.sh"
        "cronometer.desktop"
        "cronometer.png")
md5sums=('fbe087c36b4c3e4e57ec88c79448a91e'
         'e0dabb1356f72cf94bc0528b2213b388'
         '9f27d19a75f289adcaba2850557258e5'
         '237bb17ace38a33bbe28dd12ae7d426b')


build() {
    install -d $pkgdir/usr/share/java/$pkgname
    install -m644 $srcdir/CRONoMeter.app/Contents/Resources/Java/*.jar $pkgdir/usr/share/java/$pkgname
    install -D -m755 $srcdir/cronometer.sh $pkgdir/usr/bin/cronometer
    install -D -m644 $srcdir/cronometer.desktop $pkgdir/usr/share/applications/cronometer.desktop
    install -D -m644 cronometer.png $pkgdir/usr/share/pixmaps/cronometer.png
}
