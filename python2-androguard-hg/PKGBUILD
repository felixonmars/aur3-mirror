# Maintainer: William Robertson <wkr@wkr.io>
pkgname='python2-androguard-hg'
pkgver='1.9'
pkgrel='3'
pkgdesc='Python framework for Android application analysis.'
arch=('any')
url='https://code.google.com/p/androguard/'
license=('Apache')
groups=()
depends=('python2' 'python2-setuptools')
optdepends=(
    'ipython2: interactive analysis support'
    'python2-pygments: color support'
    'pydot: CFG support'
    'python2-magic: file identification support'
    'sparsehash: elsim support'
    'muparser: elsim support'
    'snappy: elsim support'
    'bzip2: elsim support'
    'zlib: elsim support'
    'psyco2-svn: acceleration support'
)
makedepends=('mercurial')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=()
md5sums=()

_hgroot='https://code.google.com/p/androguard'
_hgrepo='androguard'

build() {
    cd "$srcdir"
    msg 'Connecting to Mercurial server...'

    if [[ -d "$_hgrepo" ]]; then
        cd "$_hgrepo"
        hg pull -u
        msg "The local files are updated."
    else
        hg clone "$_hgroot" "$_hgrepo"
    fi

    msg "Mercurial checkout done or server timeout"
    msg "Starting build..."

    rm -rf "$srcdir/$_hgrepo-build"
    cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
    cd "$srcdir/$_hgrepo-build"

    #
    # BUILD HERE
    #
}

package() {
    cd "$srcdir/$_hgrepo"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
