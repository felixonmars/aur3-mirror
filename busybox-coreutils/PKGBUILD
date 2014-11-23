# Maintainer: Daniel Beecham <daniel@lunix.se> 
# Contributor: Jens Staal <staal1978@gmail.com>
# Contributor: Andy Melnikov <andy.melnikov@gmail.com>

options=(!strip) 
pkgname="busybox-coreutils" 
pkgver="1" 
pkgrel=3 
pkgdesc="Replacing the GNU coreutils with the corresponding commands from Busybox." 
arch=('any') 
url="http://www.busybox.net" 
license=('GPLv2') 
depends=('busybox') 
provides=('coreutils') 
conflicts=('coreutils') 

source=('coreutils.bin.ls' \
        'coreutils.usr.bin.ls' \
        'coreutils.usr.sbin.ls' \
        'busybox.conf')

md5sums=('df370671658d7d50718b246b70ee69f4' \
         '57a8c6e26e80f7ec4c5778a63d69cbce' \
         '466673de471fac1f97ef0cac4eb9a272' \
         '2acec73322685b206de44c1ca9195cc2')

build() {
    warning "This is an experimental package. Do not install on production systems"
    warning "There may be corner cases where the system expect stuff specific for GNU coreutils"

    mkdir -p $pkgdir/{usr/bin,etc}
    
    msg "creating symlinks"
    cd $pkgdir/usr/bin

    for i in $(cat $srcdir/*.ls); do 
    ln -s busybox $i
    done

    msg "adding corresponding coreutils-dependent settings files"
    # Do we need to add more privilige rules in this file to get a 
    # secure system?
    cp $srcdir/busybox.conf $pkgdir/etc/busybox.conf
}
