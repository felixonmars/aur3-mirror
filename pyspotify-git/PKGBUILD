# Maintainer: Trygve Aaberge <trygveaa+aur at gmail dot com>

pkgname=pyspotify-git
_gitname=pyspotify
pkgver=20130807
pkgrel=1
pkgdesc="A Python Spotify library"
arch=('any')
url="http://pyspotify.mopidy.com/"
license=('APACHE')
depends=('python2' 'libspotify>=12' 'libspotify<13')
makedepends=('git' 'python2' 'python2-distribute')
optdepends=('python-pyalsaaudio: Used by example applications.')
conflicts=('pyspotify')
provides=('pyspotify')
source=('git://github.com/mopidy/pyspotify.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  python2 setup.py build
}

package() {
  cd $_gitname
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1

  install -Dm644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
