pkgname=cgi-speedycgi
pkgver=2.22
pkgrel=1
pkgdesc="Speed up perl scripts by running them persistently."
url="http://daemoninc.com/SpeedyCGI/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('perl')
install='cgi-speedycgi.install'
source=("http://www.cpan.org/modules/by-authors/id/H/HO/HORROCKS/CGI-SpeedyCGI-2.22.tar.gz"
        "perl5-compile-fix.patch")
md5sums=('2f80df78874e3efa80f180923c4967a1'
         '0ae1a121023f2a3c456fcea5a7a54ab2')
 
build() {
  echo
  read -p "The patch fixes compilation errors of the standalone speedycgi binary. 
Since mod_speedycgi cannot be built with the patch, so the selection was 
removed. Executables  will be installed to /usr/bin/site_perl, and 
symlinks for speedy and speedy_backend will be created in /usr/bin/.

Press any key to continue..."
  echo
  patch -p0 < ../perl5-compile-fix.patch
  cd "${srcdir}/CGI-SpeedyCGI-${pkgver}"
  perl Makefile.PL
  make
}
 
package() {
  cd "${srcdir}/CGI-SpeedyCGI-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
 
