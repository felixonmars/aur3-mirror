# Maintainer: Archan Paul <paul.archan@gmail.com>

pkgname=powerpc-mentor-linux-gnu
pkgver=2012.03
pkgrel=71
pkgdesc="Sourcery CodeBench Lite Edition command-line only tools for PowerPC GNU/Linux"
arch=('i686' 'x86_64')
url="http://www.mentor.com/embedded-software/sourcery-tools/sourcery-codebench/editions/lite-edition"
#Custom license according to share/doc/mentor-powerpc-mentor-linux-gnueabi/LICENSE.txt
license=('custom')
depends=()
options=(!strip)
source=(http://sourcery.mentor.com/public/gnu_toolchain/$pkgname/mentor-$pkgver-$pkgrel-$pkgname-i686-pc-linux-gnu.tar.bz2)
md5sums=('5736fc262e7f77296e0921aeadf755b7')

if test "$CARCH" == x86_64; then
  depends=(lib32-glibc)
fi

build() {
  mkdir -p $pkgdir/etc/profile.d/
  echo "export PATH=\$PATH:/opt/$pkgname/bin" > $pkgdir/etc/profile.d/$pkgname.sh
  chmod 755 $pkgdir/etc/profile.d/$pkgname.sh
  mkdir -p $pkgdir/opt/$pkgname
  cp -RP $srcdir/mentor-$pkgver/* $pkgdir/opt/$pkgname/
}

post_install() {
  msg "You need to source /etc/profile or relogin."
  msg "Toolchain prefix installed as $pkgname"
}

