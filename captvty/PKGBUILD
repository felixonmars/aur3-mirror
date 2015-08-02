pkgname=captvty
pkgver=2.3.8.1
pkgrel=2
pkgdesc='Access to the live and shows provided by various french TV channels'
arch=('i686' 'x86_64')
url='http://www.captvty.fr'
license=('custom')
depends=('winetricks' 'libjpeg6')
depends_x86_64=('lib32-libjpeg6')
makedepends=('imagemagick')
source=("${pkgname}-${pkgver}.zip::http://captvty.fr/?captvty-${pkgver}.zip"
        "${pkgname}.ico::http://captvty.fr/favicon.ico?v=2"
        'captvty.desktop'
        'captvty'
        'LICENSE')
sha512sums=('52079d0deda5bcc5745318af4b28b0c68958539333cde05185c9b17d37e6f280f09420953e039e3ad769a59b3fb9deecdb844a1c1862528f233980c6295b9fcb'
            '99ea2f64ebe8e5b3a4f9e3a6b3c968f058ab9fd9f806b82d47aa7dcca929a94783f9a40719930ae90c95016653eaa5954e39d476875e845e30a73dea8af3ebf4'
            '2ad5c92f2066cc8ce0d81471694ab3816d2a82e0c97c030d9a823e601e03f054c4f7f1b1d0cd6f758134891c812264544787dc89ca48b8d9b6d28dc6d12871e7'
            'ac692328849401ea03b280ce6e6ade31b45b1cd16d5fca5347e1461a2442471f686cf59b43bedcad2f5f133ced58dc84ced214b3f06f8dd0521168b03336b5ad'
            'e8e94efdc8c1cad48230fa08ab61fdae4824cd2796529266f66425e7b6fda5c24e29638eca9db7c99e582c0b4cdb55fab2870088390e430520adb5137a09b6c3')

prepare() {
  cd $srcdir
  convert captvty.ico captvty.png
}

package() {
  cd $srcdir
  install -d -m755 $pkgdir/usr/share/$pkgname/ $pkgdir/usr/share/applications/ $pkgdir/usr/bin/
  install -m644 Captvty.exe Captvty.exe.config $pkgdir/usr/share/$pkgname
  install -m644 captvty-8.png $pkgdir/usr/share/$pkgname/captvty.png
  cp -r tools $pkgdir/usr/share/$pkgname
  install -D -m644 captvty.desktop $pkgdir/usr/share/applications/
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
  install -D -m755 captvty $pkgdir/usr/bin/
}

