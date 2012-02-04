# $Id$
# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>

pkgname=wt2db
pkgver=1.0
pkgrel=1
pkgdesc="Utility to convert text files in WikiText format into DocBook."
arch=("i686" "x86_64")
url="http://tldp.org/$pkgname/"
license=("GPL")
makedepends=("perl")
depends=("perl")
source=("http://tldp.org/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('53ce0042d2edefac8485e33af28fa992')


build() {
  cd $startdir/src/$pkgname-$pkgver
  
  eval `perl -V:archname`
  /usr/bin/perl Makefile.PL \
  INSTALLARCHLIB=/usr/lib/perl5/current/${archname} \
  INSTALLSITELIB=/usr/lib/perl5/site_perl/current \
  INSTALLSITESCRIPT=/usr/bin \
  INSTALLVENDORSCRIPT=/usr/bin \
  INSTALLSITEARCH=/usr/lib/perl5/site_perl/current/${archname} || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1


  /usr/bin/find $startdir/pkg -name '.packlist' -exec rm  '{}' \; && \
  /usr/bin/find $startdir/pkg -name 'perllocal.pod' -exec rm  '{}' \; && \
  /usr/bin/find $startdir/pkg -depth -type d -empty -exec rmdir '{}' \;

}
