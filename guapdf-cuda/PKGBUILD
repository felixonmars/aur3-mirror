# Maintainer: TDY <tdy@gmx.com>

pkgname=guapdf-cuda
pkgver=3.1_DEMO
pkgrel=1
pkgdesc="GUAranteed PDF Decrypter with NVIDIA CUDA support"
arch=('i686')
url="http://www.guapdf.com/"
license=('custom')
depends=('cuda-toolkit')
source=(http://www.${pkgname%-*}.com/download/${pkgname%-*}-${pkgver/_/-}.tar.gz
        http://aur.archlinux.org/packages/${pkgname%-*}/${pkgname%-*}/COPYING)
md5sums=('327aefe007541a765ec4f0035b306049'
         '79f923a46aefb4815c86186ddd5a48c8')

build() {
  cd "$srcdir"
  install -Dm755 ${pkgname%-*}/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
