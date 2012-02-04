# Contributor: d'Ronin <daronin@2600.com>

pkgname=perl-apache-admin-config
pkgver=0.94
pkgrel=1
pkgdesc="A perl module to read/write Apache like configuration files."
depends=('perl' 'glibc' 'apache')
license=('GPL' 'PerlArtistic')
url="http://cpan.org/modules/by-module/Apache"
source=(http://cpan.org/modules/by-module/Apache/Apache-Admin-Config-$pkgver.tar.gz)
md5sums=('16c3f841580e0f58a98ce42704f5e84f')
options=('!emptydirs')
arch=(i686 x86_64)
build()
{
  cd $startdir/src/Apache-Admin-Config-$pkgver

  perl Makefile.PL || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

  # Change installation directory to current and remove directory that contains perllocal.pod
  mv $startdir/pkg/usr/lib/perl5/site_perl/?.?.? $startdir/pkg/usr/lib/perl5/site_perl/current
  rm -r $startdir/pkg/usr/lib/perl5/?.?.?
}
