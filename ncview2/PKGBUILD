# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>

pkgname=ncview2
pkgver=2.0beta4
pkgdname=ncview
pkgrel=3
pkgdesc="A visual browser for netCDF format files"
arch=(i686 x86_64)
url="http://meteora.ucsd.edu/~pierce/ncview_home_page.html"
license=('GPL3')
depends=(netcdf udunits2 netpbm libxaw)
source=(ftp://cirrus.ucsd.edu/pub/ncview/ncview-2.0beta4.tar.gz)
md5sums=('03968a8fdf13c71c7582c2352f771a85')

build() {
  cd $srcdir/$pkgdname-$pkgver
  sed -i configure -e 's/libppm/libnetpbm/g'
  CC=gcc CPPFLAGS=$CFLAGS ./configure \
    --prefix=/usr \
    --with-ppm_incdir=/usr/include/netpbm \
    --with-ppm_libdir=/usr/lib || return 1
  make || return 1
  install -m755 -d $pkgdir/usr/share/X11/app-defaults
  install -m755 -d $pkgdir/usr/share/ncview
  install -m755 -d $pkgdir/usr/share/man/man1
  make \
    DESTDIR=$pkgdir install || return 1
  install -m644 *.ncmap $pkgdir/usr/share/ncview
  install -m644 Ncview-appdefaults $pkgdir/usr/share/X11/app-defaults/Ncview
  install -m644 data/ncview.1 $pkgdir/usr/share/man/man1
  gzip --best $pkgdir/usr/share/man/man1/ncview.1
}
