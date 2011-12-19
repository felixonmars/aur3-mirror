#Maintained by ivoarch <ivayloarch@gmail.com> 
pkgname=ttf-keptserif
pkgver=1.1
pkgrel=1
pkgdesc="KePT Serif are balkan extension of PT Serif"
arch=('any')
url="http://code.google.com/p/kept-fonts/"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils') 
install=ttf-keptserif.install
source=('http://kept-fonts.googlecode.com/files/keptserif-ttf-1.1.zip')
sha1sums=('163fbc4225c855100a845a4c448e5cd7e94d494f')

build() {
  cd "${srcdir}"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -d "$pkgdir/usr/share/licenses/$pkgname"  
  install -m644 README.txt "$pkgdir/usr/share/keptserif/README"
  install -m644 FONTLOG.txt "$pkgdir/usr/share/keptserif/FONTLOG"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/" || return 1
  install -m644 {'OFL.txt','OFL-FAQ.txt'} "$pkgdir/usr/share/licenses/$pkgname/" || return 1
}