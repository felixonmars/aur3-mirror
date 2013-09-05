# Maintainer: David Strobach <lalochcz@gmail.com>
# Contributor: Paolo Stivanin <admin AT polslinux DOT it>

pkgname=rpm
pkgver=5.4.13
pkgrel=1
_pkgrel=0
_pkgreldate=20130819
_dbver=6.0.20
pkgdesc="The RedHat Package Manager"
arch=('i686' 'x86_64')
url="http://rpm5.org/"
license=('GPL')
groups=('system')
depends=('perl' 'python2' 'zlib' 'beecrypt' 'pcre' 'file' 'neon' 'xz' 'popt')
conflicts=("${pkgname}-org" 'rpmextract')
options=('!emptydirs')
source=("http://rpm5.org/files/$pkgname/$pkgname-5.4/$pkgname-$pkgver-$_pkgrel.$_pkgreldate.src.rpm"
        "http://download.oracle.com/berkeley-db/db-${_dbver}.tar.gz"
        "configure-db3")
md5sums=('e8c230410d3d27663d902fb6a16e7a6f'
         'f73afcb308aefde7e6ece4caa87b22a9'
         '5fe3e001d81413abca82dbdb26e6d918')

build() {
  msg "Preparing sources"
  bsdtar -xf $pkgname-$pkgver.tar.gz
  msg "Starting build"
  cd $pkgname-$pkgver
  ln -s ../db-${_dbver} db
  mkdir db3
  ln -s ../../configure-db3 db3/configure
  LDFLAGS="${LDFLAGS} -Wl,--no-as-needed"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --with-python \
              --with-python-inc-dir=/usr/include/python2.7 \
              --with-python-lib-dir=/usr/lib/python2.7 \
              --with-ruby=none \
              --without-selinux \
              --with-popt=/usr/lib \
              --with-pcre=/usr/lib \
              --with-bzip2=/usr/lib \
              --with-xz=/usr/lib \
              --with-file=/usr/lib \
              --with-neon=external \
              --with-beecrypt=external \
              --with-db=internal \
              --without-db-tools-integrated \
              --disable-openmp \
              --disable-build-lafiles
  make DESTDIR="$pkgdir"
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
