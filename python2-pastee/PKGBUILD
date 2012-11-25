# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>
pkgname=python2-pastee
pkgver=0.1.0
pkgrel=1
pkgdesc='Pastee.org command-line client/interface.'
arch=(any)
url='https://pastee.org'
license=('unknown')
depends=('python2')
source=('https://pastee.org/pastee.py')
sha1sums=('1ba092398d8b24e78aa9763bb0011065d350e251')

package() {
  install -Dm755 "$srcdir/pastee.py" "$pkgdir/usr/bin/pastee.py"
  sed -i 's/python/python2/g' "$pkgdir/usr/bin/pastee.py"
}

# vim:set ts=2 sw=2 et:
