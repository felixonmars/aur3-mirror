# Contributor: rabyte <rabyte__gmail>
# Maintainer: Henning Bekel <h.bekel@googlemail.com>

pkgname=jsidplay2
pkgver=2.5
pkgrel=1
pkgdesc="A Java implementation of the sidplay2 SID file player/emulator"
arch=('i686' 'x86_64')
url="http://$pkgname.sourceforge.net/"
license=('GPL2')
depends=('java-environment')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.zip \
	$pkgname.sh $pkgname-console.sh)
md5sums=('fd4d7ea5e0650dc9923eecf550351eb1'
         'a422c9b037694eb4ebbe536000f22ab7'
         '264177db9fd344a30afc637b22a71cc9')

package() {
  cd $srcdir/$pkgname-$pkgver

  install -m644 -D $pkgname.jar $pkgdir/usr/share/$pkgname/$pkgname.jar
  install -m644 *.jar $pkgdir/usr/share/$pkgname

  if [[ "$CARCH" == "i686" ]]; then
    install -m644 -D libjinput-linux.so $pkgdir/usr/lib/$pkgname/libjinput-linux.so
  elif [[ "$CARCH" == "x86_64" ]]; then
    install -m644 -D libjinput-linux64.so $pkgdir/usr/lib/$pkgname/libjinput-linux64.so
  fi

  install -m755 -D ../$pkgname.sh $pkgdir/usr/bin/$pkgname
  install -m755 ../$pkgname-console.sh $pkgdir/usr/bin/$pkgname-console

  install -m644 -D README_1st.txt $pkgdir/usr/share/doc/$pkgname/README_1st.txt
  install -m644 README_2nd.txt $pkgdir/usr/share/doc/$pkgname/README_2nd.txt

}

# vim:set ts=2 sw=2 et:
