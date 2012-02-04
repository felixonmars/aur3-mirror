# Contributor: Snorre Jensen snojen@gmail.com

pkgname=slbackup
pkgver=0.0.12
pkgrel=1
pkgdesc="Framework for rdiff-backup to make it easy to set up a backup solution"
arch=('any')
url="http://slbackup.alioth.debian.org/"
license=('GPL')
depends=(rdiff-backup perl-config-general perl-net-dns)
makedepends=()
optdepends=('ssh')
install=${pkgname}.install
source=(https://alioth.debian.org/frs/download.php/3220/${pkgname}_${pkgver}.orig.tar.gz)

md5sums=('8e8816d4cb1b1abc1bcca0a453614c33')

build() {
    cd $startdir/src/${pkgname}-${pkgver}
    mkdir -p $pkgdir/etc/${pkgname}/pre.d
    mkdir -p $pkgdir/etc/${pkgname}/post.d
    mkdir -p $pkgdir/etc/cron.d
    mkdir -p $pkgdir/usr/share/${pkgname}
    mkdir -p $pkgdir/usr/share/perl5/core_perl
    mkdir -p $pkgdir/usr/share/doc/${pkgname}
    mkdir -p $pkgdir/var/log/${pkgname}/
    cp conf/${pkgname}-cron $pkgdir/usr/share/doc/${pkgname}/
    cp src/${pkgname}-cron $pkgdir/usr/share/${pkgname}/
    cp src/SLBackup.pm $pkgdir/usr/share/perl5/core_perl/
    cp -r docs/* $pkgdir/usr/share/doc/${pkgname}/
    cp CHANGELOG $pkgdir/usr/share/doc/${pkgname}/
    cp TODO $pkgdir/usr/share/doc/${pkgname}/
    cp COPYING $pkgdir/usr/share/doc/${pkgname}/
    cp conf/${pkgname}.conf $pkgdir/usr/share/doc/${pkgname}/

   cd $pkgdir

}
