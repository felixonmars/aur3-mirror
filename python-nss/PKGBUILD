# Maintainer: François Steinmetz <francois.steinmetz@gmail.com>

pkgname=python-nss
pkgver=0.12
pkgrel=2
epoch=
pkgdesc="Python binding for NSS (Network Security Services) and NSPR (Netscape Portable Runtime). "
arch=('x86_64' 'i686')
url="http://www.mozilla.org/projects/security/pki/python-nss/"
license=('GPL2')
groups=()
depends=(python2)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

source=("http://ftp.mozilla.org/pub/mozilla.org/security/python-nss/releases/PYNSS_RELEASE_0_12_0/src/$pkgname-$pkgver.tar.bz2"
        "python-nss-0.12-rsapssparams.patch")
noextract=()
md5sums=('f47ca0cad3504740ba3c8fde11715b29'
         '5da772a98e8adef92ed4e9d177dfd890')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 -i "$srcdir/python-nss-0.12-rsapssparams.patch"
  python2 setup.py build
}

check() {
  cd "$srcdir/python-nss-$pkgver"
  python2 setup.py check
}

package() {
  cd "$srcdir/python-nss-$pkgver"
  python2 setup.py install --root="$pkgdir"/
}

# vim:set ts=2 sw=2 et:
