# Maintainer: Adrian Sampson <adrian@radbox.org>

python=python2

pkgname=beets
pkgver=1.2.1
pkgrel=1
pkgdesc="flexible music library manager and tagger"
depends=('python2-munkres' 'mutagen'
         'python2-distribute' 'python2-unidecode'
         'python2-musicbrainzngs>=0.4' 'python2-yaml')
arch=('any')
source=(http://pypi.python.org/packages/source/b/beets/beets-$pkgver.tar.gz)
md5sums=(72cb9c903478898a8a70d5b0930b9c0f)
url="http://beets.radbox.org/"
license="MIT"
optdepends=('python2-pyacoustid: acoustic fingerprinting'
            'python2-flask: web interface'
            'gstreamer0.10-python: BPD audio player plugin'
            'python2-pylast: lastgenre plugin')

build() {
  cd $srcdir/$pkgname-$pkgver
  $python setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  $python setup.py install --root=$pkgdir
  install -D -m644 man/beet.1 "${pkgdir}/usr/share/man/man1/beet.1"
  install -D -m644 man/beetsconfig.5 "${pkgdir}/usr/share/man/man5/beetsconfig.5"
}
