# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=znc-git
pkgver=1.2.527.g6181858
pkgver(){
    cd $srcdir/$pkgname
    git describe |sed 's/-/./g;s/znc\.//'
}
epoch=1
pkgrel=1
pkgdesc='An IRC bouncer with modules & scripts support'
url='http://znc.in/'
license=('Apache2')
arch=('i686' 'x86_64')
provides=('znc')
conflicts=('znc')
depends=('openssl')
makedepends=('swig' 'tcl' 'python' 'perl' 'cyrus-sasl' 'git')
optdepends=('tcl: modtcl module'
            'python: modpython module'
			'perl: modperl module' 
			'cyrus-sasl: saslauth module')
source=("$pkgname::git+https://github.com/znc/znc.git")
md5sums=('SKIP')
install=znc.install
prepare() {
  cd "$srcdir/$pkgname"
  git submodule update --init --recursive
}
build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --enable-cyrus \
    --enable-tcl \
    --enable-perl \
    --enable-python
  make
}

package() {
  make -C "$srcdir/$pkgname" DESTDIR="$pkgdir" install
}
