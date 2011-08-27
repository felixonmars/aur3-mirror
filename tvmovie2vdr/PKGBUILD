# Contributor: Maik Opitz <maik@fjordblau.de>
pkgname=tvmovie2vdr
pkgver=0.5.14
pkgrel=1
arch=(i686)
pkgdesc="Grabs TVMovie and others to the EPG format of VDR"
url="http://streckrue.be/tvm2vdr"
license="GPL"
depends=('perl' 'perl-libwww' 'perl-date-manip' 'perl-html-scrubber' 'ntp' 'vdr')
backup=(rc.tvm2vdr)
source=(http://steckrue.be/download/$pkgname-$pkgver.tar.gz
        tvm2vdr
        tvm2vdr.sh
        rc.tvm2vdr)
md5sums=('83643eec5efca5537dc873bfa3b6f997'
         'ad8f98451bbe96dbd83529d608ceebc4'
         '6ef7c1c9dd4f067fb592adf764555924'
         'f7d2e5298a1afede5a9f3cdf5501c0d2')

build() {
    mkdir -p $startdir/pkg/usr/lib/vdr
    cp -r $startdir/src/$pkgname-$pkgver $startdir/pkg/usr/lib/vdr/$pkgname
    rm -r $startdir/pkg/usr/lib/vdr/$pkgname/patches

    mkdir -p $startdir/pkg/etc/rc.d
    install -D $startdir/src/tvm2vdr $startdir/pkg/etc/rc.d/

    install -D $startdir/src/tvm2vdr.sh $startdir/pkg/usr/lib/vdr/tvmovie2vdr/
    
    mkdir -p $startdir/pkg/etc
    cp $startdir/src/rc.tvm2vdr $startdir/pkg/etc/rc.tvm2vdr
}
