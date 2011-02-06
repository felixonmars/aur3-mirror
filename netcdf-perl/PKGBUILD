# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: graziano <giuliani@lamma.rete.toscana.it>

pkgname=netcdf-perl
pkgver=1.2.4
pkgrel=1
pkgdesc="A perl extension module for scientific data access via the netCDF API"
arch=('i686' 'x86_64')
url="http://www.unidata.ucar.edu/software/netcdf-perl/"
license=('custom')
depends=('netcdf' 'perl')
options=('!libtool')
source=(ftp://ftp.unidata.ucar.edu/pub/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('36b517662bda6a12a76f817acb49a993')

build() {
  cd $srcdir/$pkgname-$pkgver/src

  # Configure
  CC="gcc" \
    CPP_NETCDF="-I/usr/include" \
    PERL_MANDIR="/usr/man" \
    LD_NETCDF="-lnetcdf" \
    ./configure --prefix=/usr || return 1

  # Perl
  cd perl
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  cd ..

  # Make and install
  make || return 1
  make \
    prefix=$pkgdir/usr \
    exec-prefix=$pkgdir/usr \
    DESTDIR=$pkgdir \
    BINDIR=$pkgdir/usr/bin \
    LIBDIR=$pkgdir/usr/lib \
    PERL_MANDIR=$pkgdir/usr/man \
    install || return 1

  # Set proper permissions for folders
  find $pkgdir -type d -exec chmod 0755 {} + -exec chmod g-s {} +

  # Install license
  install -Dm644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
