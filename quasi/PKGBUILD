# Maintainer: TDY <tdy@archlinux.info>

pkgname=quasi
pkgver=0.87
pkgrel=1
pkgdesc="A multiple-context Python shell"
arch=('any')
url="http://quasi-shell.sourceforge.net/"
license=('BSD')
depends=('python2')
source=(http://downloads.sourceforge.net/project/$pkgname-shell/$pkgname-shell/$pkgver/$pkgname.zip
        LICENSE setup.py)
md5sums=('1abc34458b44954a18263f5d78e8efb2'
         '5bbd5e1603ce6dbe5371fd6c0e7c2552'
         '3618d8b217dc599ffa7832b3261604d8')

build() {
  cd "$srcdir"
  python2 setup.py build
}

package() {
  cd "$srcdir"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
