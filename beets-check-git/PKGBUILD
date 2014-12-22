# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>

_pkgname=beets-check
pkgname=${_pkgname}-git
pkgver=0.9.2.r12.g944dced
pkgrel=1
pkgdesc='Plugin for beets to verify the integrity of your audio files.'
arch=('any')
url="https://github.com/geigerzaehler/${_pkgname}"
license=('MIT')
depends=('python2' 'beets' 'python2-futures')
makedepends=('git')
optdepends=(
  'flac: Check FLAC file integrity.'
  'liboggz: Check Ogg Vorbis file integrity.'
  'mp3val: Check MP3 file integrity.')
provides=("$_pkgname")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

check() {
  cd "$srcdir/$_pkgname"
  python2 setup.py test
}

package() {
  cd "$srcdir/$_pkgname"
  rm 'beetsplug/__init__.py'
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${_pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
