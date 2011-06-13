pkgname=qspice-client
pkgver=0.3.0
_rpmrel=4
pkgrel=5.3
pkgdesc="Client for the SPICE virtual desktop protocol (RHEV)"
arch=('i686' 'x86_64')
url="http://www.spice-space.org"
license=('GPL')
depends=(log4cpp celt051 qcairo qffmpeg-libs alsa-utils glut libxrandr boost)
makedepends=('rpmextract')
conflicts=(spice)
install=
_tarballname=spice_0_4
source=(ftp://ftp.redhat.com/pub/redhat/linux/enterprise/5Client/en/os/SRPMS/${pkgname}-${pkgver}-${_rpmrel}.el5_5.src.rpm new-openssl.patch fix-gcc-4.4.patch fix-gcc-4.6.patch )
noextract=()


build() {
    cd $srcdir
    rpmextract.sh ${pkgname}-${pkgver}-${_rpmrel}.el5_5.src.rpm
    tar xjf $pkgname-$pkgver.tar.bz2
  cd "$srcdir/${pkgname}-${pkgver}"
  patch -p1 -i ../qspice-client-0.3.0-1-logger-ini-help-msg.patch
  patch -p1 -i ../qspice-client-0.3.0-2-fixed-help-windows-crash.patch
  patch -p1 -i ../qspice-client-0.3.0-3-fix-unsafe-guest-data-accessing.patch
  patch -p1 -i ../qspice-client-0.3.0-socket.patch
  patch -p1 -i ../new-openssl.patch
  patch -p1 -i ../fix-gcc-4.4.patch
  patch -p1 -i ../fix-gcc-4.6.patch
#  patch -p1 -i ../use-libpng12.patch
#  ./configure --prefix=/usr || return 1
  ./autogen.sh --prefix=/usr || return 1
  # remove rpath from libtool
  sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' libtool
  sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' libtool
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}

# vim:set ts=2 sw=2 et:
md5sums=('db9bb1287bf4e056717bdd7baac8d191'
         'c13f36d428411b1032dd47a09b81f295'
         '8986500f2640644a1fba345a6b9e20c9')
md5sums=('db9bb1287bf4e056717bdd7baac8d191'
         'c13f36d428411b1032dd47a09b81f295'
         '8986500f2640644a1fba345a6b9e20c9'
         'a25ef3d366e5458a79826cea2996ae27')
md5sums=('db9bb1287bf4e056717bdd7baac8d191'
         'c13f36d428411b1032dd47a09b81f295'
         '8986500f2640644a1fba345a6b9e20c9'
         'a8206f84f5c4ebddc1c232d14bea7e07')
md5sums=('db9bb1287bf4e056717bdd7baac8d191'
         'c13f36d428411b1032dd47a09b81f295'
         '8986500f2640644a1fba345a6b9e20c9'
         'a4bf93febe660e32feebc893faa4f722')
md5sums=('db9bb1287bf4e056717bdd7baac8d191'
         'c13f36d428411b1032dd47a09b81f295'
         '8986500f2640644a1fba345a6b9e20c9'
         'be66ca1446dd8fd82768f19103a3031f')
