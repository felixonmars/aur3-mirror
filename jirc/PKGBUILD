# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=jirc
pkgver=1.1
pkgrel=1
pkgdesc="Perl POE bot script that connects a Jabber conference room with an IRC channel"
depends=('perl>=5.10.0' 'glibc' 'perl-config-simple' 'perl-net-jabber' 'perl-poe' 'perl-poe-component-irc' 'perl-poe-component-jabber' 'perl-poe-filter-xml' 'perl-xml-stream')
license=('GPL' 'PerlArtistic')
url="http://outflux.net/software/pkgs/jirc-bridge"
source=(http://outflux.net/software/pkgs/jirc-bridge/download/jirc-$pkgver.tar.gz)
options=('!emptydirs')
arch=(i686 x86_64)
install=$pkgname.install

build()
{
  cd ${srcdir}/jirc-$pkgver

  perl Makefile.PL || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
 
  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

  mkdir -p ${pkgdir}/etc
  cp ${srcdir}/jirc-$pkgver/jirc.conf ${pkgdir}/etc/
}
md5sums=('cb11f71bea7c91bf2d5fab8dcedc9e9c')
