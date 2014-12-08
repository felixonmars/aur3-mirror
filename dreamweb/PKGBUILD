# Maintainer: Dennis Hamester <dennis.hamester [AT] gmail [DOT] com>

pkgname=dreamweb
pkgver=1.1
pkgrel=1
pkgdesc="A top-down adventure game set in a gritty futuristic dystopian city"
arch=('any')
# Couldn't find any 'official' url
url="http://www.scummvm.org/"
license=('custom')
depends=('scummvm')
source=(http://downloads.sourceforge.net/scummvm/$pkgname-cd-uk-$pkgver.zip
        $pkgname.sh)
PKGEXT='.pkg.tar'

package() {
  cd "$srcdir"

  # Install license, data and bin
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  install -d "$pkgdir"/usr/share/$pkgname/speech
  install -m 644 license.txt "$pkgdir"/usr/share/licenses/$pkgname/
  install -m 644 track01.flac "$pkgdir"/usr/share/$pkgname/
  cp DREAMWEB.* "$pkgdir"/usr/share/$pkgname/
  rm "$pkgdir"/usr/share/$pkgname/DREAMWEB.EXE
  cp SPEECH/*.RAW "$pkgdir"/usr/share/$pkgname/speech/
  install -Dm 755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
}

md5sums=('06ae54319977446a895753b226368830'
         '77dc4ba335a63e14324186d73cca0ffe')
