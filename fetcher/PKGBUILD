# Maintainer: Karol "Kenji Takahashi" Wozniak <wozniakk@gmail.com>

pkgname=fetcher
pkgver=0.5
pkgrel=5
pkgdesc="A fully-featured music management suite."
arch=(any)
url="https://github.com/KenjiTakahashi/Fetcher"
license=('GPL3')
depends=(
    'python2'
    'python2-pyqt'
    'python-beautifulsoup'
    'mutagen'
    )
makedepends=('python2-distribute')
optdepends=(
    'phonon: Player'
    'python2-pylast: Last.FM/Libre.FM scrobbling')
provides=('fetcher')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("https://github.com/KenjiTakahashi/Fetcher/tarball/$pkgver")
noextract=()
md5sums=('8e3549345c61bb2be8cba41bf806fa05')

build() {
    cd $srcdir/KenjiTakahashi-Fetcher-47487ec
    python2 setup.py install --root=$pkgdir/ --optimize=1
}

