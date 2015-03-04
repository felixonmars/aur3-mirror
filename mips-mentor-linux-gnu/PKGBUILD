# Maintainer: Archan Paul <paul.archan@gmail.com>

pkgname=mips-mentor-linux-gnu
_pkgid=13339
pkgver=2014.11
pkgrel=22
pkgdesc="Sourcery CodeBench Lite Edition command-line only tools for MIPS GNU/Linux"
arch=('i686' 'x86_64')
url='https://sourcery.mentor.com/GNUToolchain/subscription3130?lite=MIPS'
#Custom license according to share/doc/mentor-mips-mentor-linux-gnueabi/LICENSE.txt
license=('custom')
depends=('bash' 'perl')
options=(!strip)
source=(https://sourcery.mentor.com/GNUToolchain/package$_pkgid/public/mips-linux-gnu/mips-$pkgver-$pkgrel-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2)
sha256sums=('25908c314702f3a7d3e2f990eb0962172423888a66a13835fa5ed7e880d294c0')

if [ "$CARCH" == "x86_64" ]; then
  depends+==(lib32-glibc)
fi

package() {
  mkdir -p $pkgdir/etc/profile.d/
  echo "export PATH=\$PATH:/opt/$pkgname/bin" > $pkgdir/etc/profile.d/${pkgname}.sh
  chmod 755 "$pkgdir/etc/profile.d/${pkgname}.sh"
  install -Ddm755 "$pkgdir/opt"
  mv "$srcdir/mips-$pkgver/" "$pkgdir/opt/$pkgname"
}
