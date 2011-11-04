#Maintainer: Alucryd <alucryd at gmail dot com>
# Contributor: Nekos <nekoss at gmail dot com>
pkgname=shape-collage
pkgver=2.5.3
pkgrel=1
pkgdesc="Automatic Photo Collage Maker"
arch=('any')
url="http://www.shapecollage.com/"
license=('custom')
depends=('java-runtime' 'bash')
source=('http://www.shapecollage.com/2.5.3/ShapeCollage-2.5.3.tar.gz' 'shape-collage.desktop' 'shape-collage.png')
md5sums=('53d63666ce3d6b395be75201c1fc2fa9' '76eb4436bd16d242ac96cb63d9ba9d9f' '2255196c330a037f5ee6169e74a5755c')

build() {
    cd "$srcdir"
    install -Dm644 shape-collage.png "$pkgdir/opt/shape-collage/shape-collage.png"
    install -Dm644 shape-collage.desktop "$pkgdir/usr/share/applications/shape-collage.desktop"
    cd "Shape Collage"
    install -Dm755 "Shape Collage" "$pkgdir/opt/shape-collage/shape-collage"
    install -Dm644 ShapeCollage.jar "$pkgdir/opt/shape-collage/ShapeCollage.jar"
    install -Dm644 License.txt "$pkgdir/usr/share/licenses/shape-collage/license.txt"
}
