pkgname=celt051
pkgver=0.5.1.3
pkgrel=1
pkgdesc="Low-latency audio communication codec - SPICE version"
arch=(i686 x86_64)
url="http://www.celt-codec.org"
license=('BSD')
depends=('libogg')
makedepends=('rpmextract')
#options=('!libtool')
source=(ftp://ftp.redhat.com/pub/redhat/linux/enterprise/5Client/en/os/SRPMS/$pkgname-$pkgver-0.el5.src.rpm)

build() {
  cd $srcdir
  rpmextract.sh ${pkgname}-$pkgver-0.el5.src.rpm
  tar xzf celt-0.5.1.3.tar.gz
  cd "$srcdir/celt-0.5.1.3"
  ./configure --prefix=/usr
  sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' libtool
  sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' libtool
  make || return 1
  make DESTDIR="$pkgdir" install
}

md5sums=('ccea4f23f9aef124c43bcf18453563c9')
md5sums=('9fa4b909dbcff768d57fefa2510b4f6d')
