# Maintainer : schmoemi <schmoemi at arcor dot de>
# Contributor: schmoemi <schmoemi at arcor dot de>
pkgname=perlmon
pkgver=0.2.0
pkgrel=2
pkgdesc="CPU-Z clone for Linux based on Perl"
arch=('i686' 'x86_64')
url="http://www.overclock.net/linux-unix/212320-perlmon-cpu-z-like-program-linux.html"
license=('GPL')
depends=('perl')
optdepends=('gtk2-perl: running with GUI'
 	'nvidia: more GPU information (for nVidia Graphics Adapters)')
install=('perlmon.install')
source=(http://home.arcor.de/schmoemi/files/src/$pkgname-$pkgver.tar.gz)
md5sums=('8547ca2447eeec27d33d4c846ecdce15')

build() {
  cd $srcdir/$pkgname-$pkgver

  #creating diretories
  mkdir -p \
	"$pkgdir/usr/share/perlmon" \
	"$pkgdir/usr/bin" \
	"$pkgdir/etc" || return 1
  #setting rights
  chmod 755 $pkgdir/usr/share/perlmon
  #copy images
  cp -r images $pkgdir/usr/share/perlmon
  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR="$pkgdir/" || return 1
  cp perlmon $pkgdir/usr/share/perlmon/
  cp perlmonrc $pkgdir/etc/
  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete 
}
