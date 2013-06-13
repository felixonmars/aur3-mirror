# Maintainer: onny <onny@project-insanity.org>
# Contributor: onny <onny@project-insanity.org>

pkgname=brntool
pkgver=8b61d1e
pkgrel=2
pkgdesc="Dump brnboot/amazonboot devices flash into a file"
url="https://github.com/rvalles/brntool"
arch=('i686' 'x86_64')
license=("GPL3")
depends=('python' 'python-pyserial')
source=('git+https://github.com/rvalles/brntool.git')
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST/brntool"
  git describe --always | sed 's|-|.|g'
}

package() {
  cd "$srcdir/brntool/"
  install -Dm755 brntool.py "$pkgdir/usr/bin/brntool"
  install -D README "$pkgdir/usr/share/doc/$pkgname/README"
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
