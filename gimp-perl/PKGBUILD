# $Id: PKGBUILD,v 1.7 2007/09/01 17:35:20 jgc Exp $
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=gimp-perl
pkgver=2.0
pkgrel=3
pkgdesc="An extension for writing GIMP Plug-ins in Perl"
arch=(i686 x86_64)
license=('GPL' 'PerlArtistic')
url="http://www.gimp.org/downloads/"
depends=('gtk2-perl' 'gimp>=2.0.0')
makedepends=('perl-extutils-depends')
source=(ftp://ftp.gimp.org/pub/gimp/plug-ins/v2.0/perl/Gimp-${pkgver}.tar.gz)
md5sums=('dcdc7562aae803149f54ebd6d607fc30')

build() {
  cd ${startdir}/src/Gimp-${pkgver}
  eval `perl -V:archname`
  eval `perl -V:version`
  sed -i -e 's:$$dir:$(DESTDIR)$$dir:g' Makefile.PL
  # Force module installation to "current" perl directories.
  perl Makefile.PL \
      INSTALLARCHLIB=/usr/lib/perl5/current/${archname} \
      INSTALLSITELIB=/usr/lib/perl5/site_perl/current \
      INSTALLSITEARCH=/usr/lib/perl5/site_perl/current/${archname}
  sed -i -e "s/${version}/current/g" */Makefile Makefile
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  # remove *.pod, .packlist, and empty dirs:
  find ${startdir}/pkg -name '.packlist' -exec rm -f '{}' \;
  find ${startdir}/pkg -name '*.pod' -exec rm -f '{}' \;
  find ${startdir}/pkg -depth -type d -empty -delete
}
