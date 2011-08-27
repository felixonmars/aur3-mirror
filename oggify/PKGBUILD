# Contributor: Jeff Anderson <jefferya@programmerq.net>
pkgname=oggify
pkgver=2.0.4
pkgrel=1
pkgdesc="Utility to help in the management and conversion of audio collections"
arch=(i686)
url="http://scottr.org/oggify/"
license=('GPL')
groups=()
depends=(python flac lame mutagen)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://media.scottr.org/oggify/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('44fa85ad2894d675ccbd22a3c66c7165')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root $pkgdir
}

# vim:set ts=2 sw=2 et:
