# Contributor:  ulcer <ulceris@gmail.com>

pkgname=lcdproc-cvs
pkgver=20090830 
pkgrel=1
pkgdesc="LCDproc is a utility to drive one or more LCD (and LCD-like) devices attached to a host."
url="http://sourceforge.net/projects/lcdproc/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('cvs' 'xmlto' 'libusb' 'libg15' 'libg15render' 'graphlcd-base' 'glcdprocdriver' 'libirman' 'ncurses'
         'svgalib'  'libftdi' 'lirc' 'libnxml' 'libmrss' 'mx5000tools')
provides=('lcdproc')
conflicts=('lcdproc')
makedepends=('cvs')
source=('lcdd' 'lcdproc')
noextract=()
md5sums=('a4101772a2e2eabff7550c835bd7b7bf'
         'a679202a4bd75dab131cd01330b3531a') #generate with 'makepkg -g'

_cvsroot=":pserver:anonymous@lcdproc.cvs.sourceforge.net:/cvsroot/lcdproc"
_cvsmod="lcdproc"

build() {
    mkdir -p /$srcdir/LCDproc
    cd "$srcdir/LCDproc"
     msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
       if [ -d $_cvsmod/CVS ]; then
       cd $_cvsmod
       cvs -z3 update -d
       else
       cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
       cd $_cvsmod
fi
			     
    msg "CVS checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/LCDproc/$_cvsmod-build"
    cp -r "$srcdir/LCDproc/$_cvsmod" "$srcdir/LCDproc/$_cvsmod-build"
    cd "$srcdir/LCDproc/$_cvsmod-build"

#
# configure
# 
 
   sh ./autogen.sh || return 1

   ./configure --prefix=/usr --libdir=/usr/lib --enable-drivers='all,!svga' \
        --sysconfdir=/etc/lcdproc --enable-libusb --enable-lcdproc-menus --enable-stat-smbfs \
        --enable-testmenus --enable-seamless-hbars \
        --enable-testmenus --enable-permissive-menu-goto --enable-stat-nfs \
        --with-pidfile-dir=/var/run --with-lcdport=13666 --enable-doxygen || return 1
#
# build
    make || return 1
    make DESTDIR=${pkgdir} install || return 1
    sed -e "s/server\/drivers\//\/usr\/lib\/lcdproc\//g" LCDd.conf > $startdir/pkg/etc/lcdproc/LCDd.conf || return 1
    mkdir -p $startdir/pkg/etc/rc.d || return 1
    cp $startdir/src/lcdd $startdir/pkg/etc/rc.d/ || return 1
    cp $startdir/src/lcdproc $startdir/pkg/etc/rc.d/ || return 1
}


