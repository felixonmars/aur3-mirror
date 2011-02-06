# Contributor: Igor Mogielnicki <igor.mogielnicki@gmail.com>
pkgname=tircd
pkgver=0.7
pkgrel=1
pkgdesc="An ircd proxy to the twitter API."
arch=(any)
url="http://code.google.com/p/tircd/"
license=('GPL')
groups=()
depends=('perl-net-twitter>=2.10' perl-poe perl-poe-filter-ircd)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=tircd.install
source=("http://tircd.googlecode.com/files/${pkgname}_v${pkgver}.tar.gz"
        rc-tircd
        tircd.cfg.patch)

noextract=()
md5sums=('cd6d6503836918f27f809fd63c9b1bd4'
         '84dcb4328c0323818d33cc67c64276ee'
         '2ea1677441ceea655088dd2915fb64f6')

build() {
 mkdir -p $pkgdir/etc/rc.d
 mkdir -p $pkgdir/usr/bin
 mkdir -p $pkgdir/usr/lib/perl5/site_perl/current

 cp $srcdir/$pkgname/$pkgname.pl $pkgdir/usr/bin
 chmod 755 $pkgdir/usr/bin/$pkgname.pl

 cp $startdir/rc-tircd $pkgdir/etc/rc.d/tircd
 chmod 755 $pkgdir/etc/rc.d/tircd

 cp $srcdir/$pkgname/$pkgname.cfg $pkgdir/etc
 patch -p0 $pkgdir/etc/tircd.cfg < tircd.cfg.patch
 
 cp $srcdir/$pkgname/$pkgname.pod $pkgdir/usr/lib/perl5/site_perl/current
}

# vim:set ts=2 sw=2 et:
