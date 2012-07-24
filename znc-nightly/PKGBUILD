pkgname=znc-nightly
nightly=2012-07-24
pkgver=${nightly//-}
pkgrel=1
pkgdesc='An IRC bouncer with modules & scripts support'
url='http://znc.in/'
license=('GPL2')
arch=('i686' 'x86_64')
provides=('znc')
conflicts=('znc')
depends=('openssl')
makedepends=('swig' 'tcl' 'python' 'perl' 'cyrus-sasl')
optdepends=('tcl: modtcl module'
            'python: modpython module'
            'perl: modperl module'
            'cyrus-sasl: cyrusauth module')

source=("http://znc.in/nightly/znc-git-${nightly}.tar.gz")
sha1sums=('9dfe86a3b5c86f4173620252bc00505ceb9e429d')

build() {
  cd "$srcdir/znc"
  ./configure --prefix=/usr \
    --enable-cyrus \
    --enable-tcl \
    --enable-perl \
    --enable-python
  make
}

package() {
  cd "$srcdir/znc"
  make DESTDIR="$pkgdir" install
}
