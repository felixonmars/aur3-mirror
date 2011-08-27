# Bonus extra from single CD STEINS;GATE☆Laboratory Member 002☆Shiina Mayuri
# Maintainer: 

pkgname=shiinatimer
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Mayuri Shiina's timer"
arch=('i686' 'x86_64')
url="http://steinsgate.tv"
license=('Custom')
groups=()
depends=('wine')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www30.zippyshare.com/d/35525803/24028/KaraageTimer.exe
        shiinatimer
        shiinatimer.6
        shiinatimer-ja.6)
noextract=()
md5sums=('3b9619ce2e22adcdee1f6b2680e20e3e'
         '6cb9afee32b738604a31fd60d8b51248'
         '4a3a23a45374888472be9b7d38146098'
         'a78f5e17a43d952d451242e55ec4315b') #generate with 'makepkg -g'


package() {
  chmod 0755 shiinatimer
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/local/lib"
  mkdir -p "$pkgdir/usr/share/man/man6"
  mkdir -p "$pkgdir/usr/share/man/ja/man6"
  cd "$srcdir/"
  cp shiinatimer "$pkgdir/usr/bin/"
  cp KaraageTimer.exe "$pkgdir/usr/local/lib/"
  cp shiinatimer.6 "$pkgdir/usr/share/man/man6"
  cp shiinatimer-ja.6 "$pkgdir/usr/share/man/ja/man6/shiinatimer.6"  
}

# vim:set ts=2 sw=2 et:
