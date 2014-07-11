# Maintainer: jonnyb <zer0ne at gmx net>

pkgname=magarena
pkgver=1.51
pkgrel=1
pkgdesc="Fantasy card strategy game against computer opponent"
arch=('any')
url="http://code.google.com/p/magarena/"
license=('GPL3')
depends=('java-runtime' 'bash')
makedepends=('unzip')
source=(https://github.com/magarena/magarena/releases/download/$pkgver/Magarena-$pkgver.zip
        $pkgname.sh
        $pkgname.png
        $pkgname.desktop)
noextract=(Magarena-$pkgver.zip)
sha1sums=('2d8b5c05dcb2ee63f9962ae2b8e040ef90c3ed0a'
          '02060f282b067b2869d6479027bd251b46c7382e'
          '79cfc023362ed1133de3fa62a0b4e7da6d66cdb5'
          '1844a0246512997b17ead106d696810be9f5c41c')
prepare() {
  cd "$srcdir"
  unzip -q "Magarena-$pkgver.zip"
  cd "Magarena-$pkgver"
  mv Magarena.exe ../$pkgname.jar
  mv README.txt Magarena/README.txt
  echo "$pkgver-$pkgrel" > Magarena/VERSION
}

package() {
  cd "$srcdir"
  install -Dm644 $pkgname.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  for _libfile in $srcdir/Magarena-$pkgver/lib/*.jar ; do
    _libname=$(basename $_libfile)
    install -Dm644  $srcdir/Magarena-$pkgver/lib/$_libname "$pkgdir/usr/share/java/$pkgname/lib/$_libname"
  done

  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -dm755 "$pkgdir/usr/share/$pkgname-base/"
  cp -rp "Magarena-$pkgver/Magarena/" "$pkgdir/usr/share/$pkgname-base/"
}
