# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=gayeogi
pkgver=0.6.3
pkgrel=2
pkgdesc="A fully-featured music management suite."
arch=(any)
url="https://github.com/KenjiTakahashi/gayeogi"
license=('GPL3')
depends=(
    'python2'
    'python2-pyqt'
    'mutagen'
)
makedepends=('python2-distribute')
optdepends=(
    'phonon: Player'
    'python2-pylast: Last.FM/Libre.FM scrobbling'
    'python2-lxml: metal-archives.com/musicbrainz.org'
)
provides=('gayeogi')
replaces=('fetcher')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/g/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('8d7160a5967a3142f23698305ee8c890')

package() {
    cd $srcdir/$pkgname-$pkgver
    python2 setup.py install --root=$pkgdir/ --optimize=1

    install -d -m 755 $pkgdir/usr/share/applications
    install -m 644 $srcdir/$pkgname-$pkgver/scripts/gayeogi.desktop $pkgdir/usr/share/applications
}
