# Maintainer: star--rain <bimutku2@gmail.com>
pkgname=restcode
pkgver=0.0.1.r02
pkgrel=1
pkgdesc="Command line tool to fix filename encoding for gibberish file names (Example:extracted zip filenames).(Traditional Chinese UI)"
arch=(i686 x86_64)
url="https://github.com/star--rain/restcode"
license=('MIT')
groups=()
depends=('python')
makedepends=()
source=('https://github.com/star--rain/restcode/archive/v0.0.1.r02.zip')
noextract=()
md5sums=('f99e28f6426d5e90bcf54c386fd914fa') #generate with 'makepkg -g'



build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py check

}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -D -m644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}