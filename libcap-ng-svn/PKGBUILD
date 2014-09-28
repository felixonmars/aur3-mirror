pkgname=libcap-ng-svn
pkgver=0.7.5.63
pkgrel=1
pkgdesc="An alternate posix capabilities library"
arch=('i686' 'x86_64')
url="http://people.redhat.com/sgrubb/libcap-ng"
license=('LGPL2.1')
depends=('glibc' 'python')
makedepends=('subversion' 'attr' 'libcap' 'swig')
provides=("libcap-ng=${pkgver%.*}")
conflicts=('libcap-ng')
options=('!libtool')
source=("$pkgname::svn+http://svn.fedorahosted.org/svn/libcap-ng/trunk")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(awk '{ print $1; exit }' ChangeLog).$(svnversion | tr -d [A-z])
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr \
    --disable-static --enable-shared --with-pic --with-python
  make V=1

}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
