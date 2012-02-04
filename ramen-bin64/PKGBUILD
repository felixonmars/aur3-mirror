# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkg=ramen
pkgname=$_pkg-bin64
pkgver=0.8.2
pkgrel=1
pkgdesc="A node based image and video compositor. x86_64 binary version."
arch=(x86_64)
url="http://ramencomp.blogspot.com/"
license=('custom')
conflicts=("$_pkg" "$_pkg-bin" "$_pkg-svn" "${_pkg}hdr")
source=("http://dl.dropbox.com/u/31438837/$_pkg-${pkgver}_linux64.tar.gz")
md5sums=('5663d5776acdc10e5641aaa397d84680')

build() {
  return 0
}

package() {
  cd "$srcdir/$_pkg-${pkgver}_linux64"

  # install all in /opt
  install -d "$pkgdir/opt/$_pkg"
  cp -a * "$pkgdir/opt/$_pkg"

  # bin
  install -d "$pkgdir/usr/bin"
  sed "s|\(dirname=\).*|\1/opt/$_pkg/$_pkg-$pkgver/bin|" \
    $_pkg-$pkgver/bin/ramen > "$pkgdir/usr/bin/$_pkg"
  chmod +x "$pkgdir/usr/bin/$_pkg"

  # license
  install -Dm644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
