#Maintainer: Mathias Fussenegger <f.mathias {ät} zignar DOT net>

pkgname=spacman
pkgver=1.0.2
pkgrel=1
pkgdesc="simple wrapper around pacman/pacsearch/aria2c to improve file download speed"
arch=('any')
license=('MIT')
url=http://github.com/mfussenegger/spacman
source=(https://github.com/mfussenegger/${pkgname}/archive/${pkgver}.tar.gz)

depends=('aria2' 'python' 'pacman-contrib' )
optdepends=('pacmatic: use pacmatic on final invoke instead of pacman')

build() {
  cd $pkgname-$pkgver
  python3 setup.py install --root=$pkgdir --prefix=/usr --optimize=1 || return 1
  install -D -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
md5sums=('d97ef8073387be28482cd7a861568f8f')
