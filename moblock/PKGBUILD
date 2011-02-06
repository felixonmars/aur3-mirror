# Contributor: Kevin Edmonds <edmondskevin@hotmail.com>
# Maintainer: Filip Wojciechowski, filip at loka dot pl

pkgname=moblock
pkgver=0.9rc2
pkgrel=8
pkgdesc="Console application that blocks connections from/to hosts listed in a file in peerguardian format"
arch=('i686' 'x86_64')
url="http://moblock.berlios.de/"
license=('GPL')
depends=(libnetfilter_queue iptables)
backup=(etc/moblock/config)
install=moblock.install
source=(http://download.berlios.de/moblock/MoBlock-0.8-i586.tar.bz2 \
        moblock_0.9_rc2.patch \
        MoBlock-nfq.sh.patch \
        moblock_include.patch \
        config \
        moblock-update \
        moblock \
        moblock.logrotate)

build() {
    cd $startdir/src/MoBlock-0.8
    
    # patch to update moblock to the latest cvs version
    patch -Np1 -i ../moblock_0.9_rc2.patch || return 1
    # add IP whitelisting and move configs to a separate conf file
    patch -Np1 -i ../MoBlock-nfq.sh.patch || return 1
    # necessary to make moblock build with recent kernels
    patch -Np1 -i ../moblock_include.patch || return 1
    
    # change the CFLAGS for both i686 and x84_64 builds
    sed -i "s#-Wall -O.*-ffast-math#$CFLAGS#g" Makefile
    
    # build
    make || return 1
    
    #move the files
    install -D -m 755 ./MoBlock-nfq.sh $startdir/pkg/usr/bin/moblock-nfq || return 1
    install -D -m 744 ./moblock $startdir/pkg/usr/bin/moblock || return 1
    install -D -m 755 ../moblock-update $startdir/pkg/usr/bin/moblock-update || return 1
    install -D -m 744 ../moblock $startdir/pkg/etc/rc.d/moblock || return 1
    install -D -m 644 ../config $startdir/pkg/etc/moblock/config || return 1
    install -D -m 644 ../moblock.logrotate $startdir/pkg/etc/logrotate.d/moblock || return 1
}


md5sums=('199967adb48b153be90db10fe21325c5'
         'e4e33c515677fa53eaca4616591d4e44'
         'e9f3c6b09f5e07dee948450780340ea3'
         'b23b5214965df59632de5cec317ddbde'
         '840bb52a99529305e49212a69c9ced8a'
         '49a16feb221d4d912cc7200313517f7b'
         '1bdc949fcff0ce751a5096e489061513'
         'a8285fd3e68043cd8d21993d3dbbf9d4')
