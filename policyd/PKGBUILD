# Maintainer: Michael Sierks <msierks117 (AT) gmail (dot) com>

pkgname=policyd
pkgver=2.0.14
pkgrel=1
pkgdesc='Policyd v2 policy daemon codenamed "cluebringer"'
_codename=cluebringer
arch=('i686' 'x86_64')
url='http://www.policyd.org/'
license=('GPLv2')
depends=('perl-net-server' 'perl-config-inifiles' 'perl-dbi' 'perl-cache-fastmmap')
optdepends=('perl-dbd-mysql' 'perl-dbd-pg' 'perl-dbd-sqlite')
source=("http://download.policyd.org/v2.0.14/cluebringer-v2.0.14.tar.gz" "policyd.service" "cbpadmin.patch")
md5sums=('76a71c6d123aa9ae80254822ea4e5027' '5a9dd928f01518f2afe6d69be85debad' 'c08e13eaebedbe99e9e9d52f2d0c64fa')
backup=('etc/policyd/cluebringer.conf')
install=policyd.install

build() {
  cd "$srcdir/${_codename}-v$pkgver"

  # run patches
  patch cbpadmin < ../cbpadmin.patch

  # generate sql scripts
  cd database

  for x in  mysql55 mysql4 mysql pgsql sqlite
  do
    for i in  core.tsql access_control.tsql quotas.tsql amavis.tsql checkhelo.tsql checkspf.tsql greylisting.tsql
    do 
      ./convert-tsql $x $i
    done > policyd.$x
  done
}


package() {
  cd ${_codename}-v${pkgver}

  install -dm755 $pkgdir/{etc/policyd,usr/{bin,sbin,lib/policyd-2.0/{cbp,database}}}
  install -D -m644 ${srcdir}/policyd.service ${pkgdir}/usr/lib/systemd/system/policyd.service

  cp -a cluebringer.conf $pkgdir/etc/policyd/cluebringer.conf
  cp -ra cbp/*           $pkgdir/usr/lib/policyd-2.0/cbp/
  cp -ra database/*      $pkgdir/usr/lib/policyd-2.0/database/
  cp -a cbpadmin         $pkgdir/usr/bin/
  cp -a cbpolicyd        $pkgdir/usr/sbin/
}
