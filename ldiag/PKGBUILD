# Maintainer: Somebody <somebody[at]foo[dot]tld>

pkgname=ldiag
pkgver=4.1.1.6928
pkgrel=1
pkgdesc="The Lenovo Linux Diagnostics tools"
url="http://support.lenovo.com/us/en/docs/LENV-DIAGS"
arch=('i686' 'x86_64')
license=('custom')
depends=('libsystemd' 'libudev0')
optdepends=('qt4: Graphical interface' 'gksu: Provide permissions through graphical interface')

if [ "$CARCH" == "x86_64" ]; then
  _arch=x64
  source=("http://download.lenovo.com/ibmdl/pub/pc/pccbbs/thinkvantage_en/redhat-x64-${pkgver//[-._]/}.rpm"
          "http://download.lenovo.com/ibmdl/pub/pc/pccbbs/thinkvantage_en/redhat-x64-${pkgver//[-._]/}.txt"
          "lsc_lite.desktop"
          "lsc_lite.png")
  md5sums=('9487cc7128348fec034494b9a21d86e7'
           '2cdec89016b438d6c6156560a873cf16'
           '0a78b374e8fdef0829a3af417830c6b6'
           '2feec035e0c1cfaa71cd09577c52a308')
  sha512sums=('f948b391f03070023f2220165935ba8d3ea185e050d02df9210345343eeac82f1719044366729c00187f57b5e2add2b083130cfb0b1822f4401e1abac00760fd'
              'a3fd4ed3680c0d285c212e210addba01c77531e10d0afa822d6c336c78920100c09fec2f1ebe44a27fb9dee6b58a6170198f5b650db416e78b46d57e5e620e41'
              'c27278e0fbc72ae1d2d6be65d6c8860e9eda9db6c0e570db6b3fa25a89c7367fef8d2fe33466cdcd8cda11705d4114e412b4dffe08fb743d52ec9f404f9aace7'
              'fe0c17b79f2b53efe04ac546970708294a4b001702c0793be985c0b3668c6f5e32af579201a11e91d8fe45da17e7ec2798386821435a117488798aadd5a1f809')
elif [ "$CARCH" == "i686" ]; then
  _arch=x86
  source=("http://download.lenovo.com/ibmdl/pub/pc/pccbbs/thinkvantage_en/redhat-x86-${pkgver//[-._]/}.rpm"
          "http://download.lenovo.com/ibmdl/pub/pc/pccbbs/thinkvantage_en/redhat-x86-${pkgver//[-._]/}.txt"
          "lsc_lite.desktop"
          "lsc_lite.png")
  md5sums=('2f2a81dd9473de1bc12fbead8ad8a72d'
           'acf4cf7a4bf9eecddbdfd96698d1289c'
           '0a78b374e8fdef0829a3af417830c6b6'
           '2feec035e0c1cfaa71cd09577c52a308')
  sha512sums=('2a9a0ce49aad988dcd4f7dabb58fa4fcd8b28071aed698559b7fee6cedec30ef9b3766e185590dac4471fd358986496e1647f221b3a6616fb3c1ef0024f976ed'
              '061ace1c894b52f6c9b228823527ce45b688db34984e3277f7e549c09e437ea85d120a44e33dbd93378d9c98e78fbc9df6fb95431bc570d94ef5327d5a39ebf2'
              'c27278e0fbc72ae1d2d6be65d6c8860e9eda9db6c0e570db6b3fa25a89c7367fef8d2fe33466cdcd8cda11705d4114e412b4dffe08fb743d52ec9f404f9aace7'
              'fe0c17b79f2b53efe04ac546970708294a4b001702c0793be985c0b3668c6f5e32af579201a11e91d8fe45da17e7ec2798386821435a117488798aadd5a1f809')
fi

package() {
  mkdir -p "${pkgdir}"/opt/lenovo/ldiag "${pkgdir}"/usr/bin "${pkgdir}"/usr/share/{applications,pixmaps}
  cp "${srcdir}"/opt/lenovo/ldiag/* "${pkgdir}"/opt/lenovo/ldiag
  install -D -m644 "${srcdir}/redhat-$_arch-${pkgver//[-._]/}.txt" "${pkgdir}/usr/share/licenses/ldiag/license.txt"
  install -D -m644 "${srcdir}/lsc_lite.desktop" "${pkgdir}"/usr/share/applications
  install -D -m644 "${srcdir}/lsc_lite.png" "${pkgdir}"/usr/share/pixmaps
  ln -s /opt/lenovo/ldiag/lsc_cli "${pkgdir}"/usr/bin/lsc_cli
  ln -s /opt/lenovo/ldiag/lsc_lite "${pkgdir}"/usr/bin/lsc_lite
}
