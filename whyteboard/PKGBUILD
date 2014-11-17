# Maintainer: Stefan Husmann < stefan-husmann@t-online.de >
# Contributor: CaptainShanks <captainshanks@archlinux.us>

pkgname=whyteboard
pkgver=0.41.1
pkgrel=4
pkgdesc="A drawing program that supports annotation of pdf files. Also has rewinding feature and tabbed painting."
arch=('any')
license=('GPL')
url="http://code.google.com/p/whyteboard/"
depends=('python2' 'wxpython2.8')
optdepends=('imagemagick: convert filetypes')
source=(http://whyteboard.googlecode.com/files/$pkgname-$pkgver.tar.gz $pkgname.png $pkgname.desktop $pkgname.launch)
md5sums=('ca95a8c702c59fe2516de9a525b59658'
         'b8a25c0c86fa97f9b400acad7a0b575b'
         'e1cab13c3177595ce57debcf9fae2830'
         'eea1379b6d8fc3088b2ffe115f3df190')

prepare () {
  cd "$srcdir"/$pkgname-$pkgver
  sed -i '1s#python#python2#' $pkgname.py
  sed -i '1022s#Color#Colour#' $pkgname/gui/panels.py
}

package() {
  install -d ${pkgdir}/usr/{bin,lib/python2.7/$pkgname,share/doc/$pkgname}
  install -Dm755 $pkgname.launch $pkgdir/usr/bin/$pkgname 
  install -Dm644 $pkgname.desktop \
    ${pkgdir}/usr/share/applications/$pkgname.desktop
  install -Dm644 $pkgname.png ${pkgdir}/usr/share/icons/$pkgname.png
  cd ${srcdir}/$pkgname-$pkgver
  cp -r *.py $(find -maxdepth 1 -mindepth 1 -type d) ${pkgdir}/usr/lib/python2.7/$pkgname
  chmod 755 $pkgdir/usr/lib/python2.7/$pkgname/$pkgname.py
  cp *.txt ${pkgdir}/usr/share/doc/$pkgname
}
