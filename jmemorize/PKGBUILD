# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=jmemorize
pkgver=1.3.0
pkgrel=2
pkgdesc="Manages your learning processes by using flashcards and the famous Leitner system"
arch=('i686' 'x86_64')
url="http://jmemorize.org"
license=('GPL')
depends=('java-runtime')
source=(http://downloads.sourceforge.net/$pkgname/jMemorize-$pkgver.jar \
        $pkgname.sh $pkgname-16x16.png $pkgname-64x64.png $pkgname.desktop)
noextract=(jMemorize-$pkgver.jar)
md5sums=('f61f5e87b8f7c6faa07525753915064c'
         'a21245d198036b667465375a503c1944'
         '684ae86603fc372baea3c1cbdbcb8a16'
         'b3d9708b2ffdacdb57f8f78ad2ff0136'
         'd131ce98ce2fdaea716045d85948089f')

build() {
  cd "$srcdir"/
  install -D -m644 jMemorize-$pkgver.jar \
      "$pkgdir"/usr/share/java/$pkgname/$pkgname.jar
  install -D -m755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname

  for i in 16x16 64x64; do
    install -D -m644 $pkgname-$i.png \
        "$pkgdir"/usr/share/icons/hicolor/$i/apps/$pkgname.png
  done

  install -d -m755 "$pkgdir"/usr/share/pixmaps
  ln -s ../icons/hicolor/64x64/apps/$pkgname.png \
      "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -D -m644 $pkgname.desktop \
      "$pkgdir"/usr/share/applications/$pkgname.desktop
}
