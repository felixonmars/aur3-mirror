# Contributor: fnord0 < fnord0 AT riseup DOT net >
# Maintainer: Barry Keegan < barrykeegan AT gmail DOT com >

pkgname=('maltego' 'maltego-doc')
pkgver=3.6.0.6640
pkgrel=1
arch=('any')
url='http://www.paterva.com/web6/products/maltego.php'
license=('custom')
source=("https://www.paterva.com/malv36/community/MaltegoChlorineCE.$pkgver.zip"
        'maltego.png::https://www.paterva.com/web6/images/frontpage/maltegoPanelLogo.png'
        'maltego'
        'maltego.desktop'
        'http://www.paterva.com/web6/documentation/M3GuideGUI.pdf')
sha1sums=('38fcea65e719a6d33f746d6130f12109d8315f5c'
          '89fa4ea2904a61dbf5ad3f63b2a11c51e2bfccb6'
          '856c6e31801211bffbc797fbbc7f823e043a76cb'
          '590881a9f6b61d81cb9bd86734e38fcb552c94af'
          'b3d496acaa2fbd5a0fd0409aafc0af05280db736')

package_maltego() {
  pkgdesc='Maltego Radium Community Edition - a proprietary software for open source intelligence and forensics'
  depends=('java-runtime-common')
  install=$pkgname.install

  cd $srcdir/MaltegoChlorine.$pkgver
  install -d $pkgdir/usr/share/{$pkgname,applications,icons}
  install -d $pkgdir/usr/bin
  #install -d ${pkgdir}/usr/share/licenses/${pkgname} || return 1
  # the COMMERCIAL client license resides @ https://www.paterva.com/web5/server/MaltegoServerAgreement.pdf
  cp -pR bin etc groovy ide java maltego maltego-core-platform maltego-ui platform $pkgdir/usr/share/maltego

  # startup app
  cd $srcdir
  install -Dm755 maltego $pkgdir/usr/bin
  install -Dm644 maltego.png $pkgdir/usr/share/icons
  install -Dm644 maltego.desktop $pkgdir/usr/share/applications
}

package_maltego-doc() {
  pkgdesc='Maltego Radium Community Edition - a proprietary software for open source intelligence and forensics (documentation)'
  depends=('maltego')

  cd $srcdir
  install -d $pkgdir/usr/share/maltego/doc
  install -Dm644 M3GuideGUI.pdf $pkgdir/usr/share/maltego/doc
}
