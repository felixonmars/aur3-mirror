pkgname=ttf-babelstone-modern
pkgver=6.002
pkgrel=1
pkgdesc="A semi-monospaced modern style display font covering a wide range of Unicode characters."
arch=('any')
url="http://www.babelstone.co.uk/Fonts/index.html"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=('http://www.babelstone.co.uk/Fonts/BabelStoneModern.ttf'
        'http://www.babelstone.co.uk/Fonts/BabelStoneOFL.txt')
sha256sums=('65cd40476a970f91a4813aded21beb8c4b6aa708c627e1cc3a7753d898fdb60a'
            'd2b1b6e4e9201832e94e6f9231b6c32488cb76ea30c4ef82ca3fac35ec2f0b66')
install=$pkgname.install

package()
{
  install -Dm644 $srcdir/BabelStoneModern.ttf $pkgdir/usr/share/fonts/TTF/BabelStoneModern.ttf

  install -Dm644 $srcdir/BabelStoneOFL.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
