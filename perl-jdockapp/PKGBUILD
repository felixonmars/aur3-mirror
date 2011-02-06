# 'Maintainer': Mikkko Seppälä <t-r-a-y@mbnet.fi> aka Neverth

pkgname=perl-jdockapp
pkgver=1.2.1
pkgrel=1
pkgdesc="perl module, Wharf::JDockApp, for windowmaker dockapplets"
arch=(i686 x86_64)
url="http://search.cpan.org/dist/Wharf-JDockApp/JDockApp.pm"
depends=('perl')
license=""
source=(http://search.cpan.org/CPAN/authors/id/J/JE/JETTERO/Wharf-JDockApp-1.2.1.tar.gz)
md5sums=('8ec183b4b08f8b2faaa2aaa35ad7366f')

build() {
  cd $startdir/src/Wharf-JDockApp-1.2.1/
  perl Makefile.PL || return 1
  make DESTDIR=$startdir/pkg install

  mv $startdir/pkg/usr/lib/perl5/site_perl/5.8.8 $startdir/pkg/usr/lib/perl5/site_perl/current
  rm -r $startdir/pkg/usr/lib/perl5/5.8.8/
}
