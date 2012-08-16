pkgname=djgpp-crx
pkgver=2.0.3
pkgrel=1
pkgdesc="DJGPP Cross-to-DOS Compiler Support Files"
arch=(any)
url="http://www.delorie.com/djgpp/"
license=("GPL")
makedepends=(unzip)
source=("http://www.delorie.com/pub/djgpp/current/v2/djcrx${pkgver//./}.zip")
noextract=("djcrx${pkgver//./}.zip")
options=(!strip)
md5sums=('dbaceb26365a14e702f2e1c9def16afc')

build() {
  unzip -a -o "$srcdir/djcrx203.zip" -d .
  cd $srcdir
  mkdir -p "$pkgdir/usr/i586-msdosdjgpp/bin"
  cp -r lib "$pkgdir/usr/i586-msdosdjgpp"
  cp -r include "$pkgdir/usr/i586-msdosdjgpp"
  
  cd "src/stub"
  gcc -O2 stubify.c -o "$pkgdir/usr/i586-msdosdjgpp/bin/stubify"
  strip "$pkgdir/usr/i586-msdosdjgpp/bin/stubify"
}
