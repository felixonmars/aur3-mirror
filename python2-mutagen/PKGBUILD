# Maintainer: Atlanis <emallson@archlinux.us>
pkgname=python2-mutagen
pkgver=1.21
pkgrel=1
pkgdesc="A Python module to handle audio metadata."
arch=('any')
url="https://code.google.com/p/mutagen/"
license=('GPLv2')
groups=()
depends=('python2')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
changelog=
source=("https://mutagen.googlecode.com/files/mutagen-1.21.tar.gz")
noextract=()
md5sums=('7491af5d04706b1f60fcab71aadfd27f')

package() {
    cd "$srcdir/mutagen-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}