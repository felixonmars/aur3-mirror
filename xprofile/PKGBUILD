# Maintainer: Nico Di Rocco <dirocco.nico@gmail.com>

pkgname=xprofile
pkgver=1.2.0
pkgrel=1
pkgdesc="A tool to manage and automatically apply xrandr configurations."
arch=('any')
url="https://github.com/nrocco/xprofile"
license=('GPL')
depends=('python' 'xorg-xrandr')
makedepends=('python-setuptools')
source=("https://github.com/nrocco/$pkgname/archive/$pkgver.tar.gz")
md5sums=('de5e353e4dc046b4ca58339525451464')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  gzip -9 xprofile.1 xprofilerc.5
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xprofile/LICENSE"
  install -Dm644 zsh/completions "$pkgdir/usr/share/zsh/site-functions/_xprofile"
  install -Dm644 xprofile.1.gz "$pkgdir/usr/share/man/man1/xprofile.1.gz"
  install -Dm644 xprofilerc.5.gz "$pkgdir/usr/share/man/man5/xprofilerc.5.gz"

  python3 setup.py install --root="$pkgdir" --optimize=1
}
