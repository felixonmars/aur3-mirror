# Contributor: Ido Kanner <idokan@gmail.com>

pkgname=firebird-superclassic
pkgver=2.5.0.26074
pkgdesc="Firebird RDBMS (Super classic)"
pkgrel=2
arch=('i686' 'x86_64')
url="http://www.firebirdsql.org/"
license=('custom')
depends=("libfbclient=$pkgver" "icu" "gcc-libs")
makedepends=("gcc" "autoconf" "automake")
conflicts=("firebird-cs" "firebird-classic" "firebird-ss")
provides=("firebird")
source=(http://downloads.sourceforge.net/firebird/Firebird-$pkgver-0.tar.bz2
        firebird
        firebird.sh
        LICENSE)
md5sums=('780f162ee71f087fc277adf09f966529'
         '7d1fa8f2be60d678852c2ad1b302f7aa'
         'de79c09c72eaa5bf006bdaa7b35620b9'
         '0d61798861e159c85dbdf0f30fe2f2ce')

build() {
    _fbroot="$pkgdir/opt/firebird"
    cd "$srcdir/Firebird-$pkgver-0"

    msg "Configuring to use superserver, compiling, making and instaling."
    msg "Don't worry about the errors below."
    ./configure --prefix=/opt/firebird --with-system-icu --with-system-editline 
    make -j1 # bug in firebird makefiles (can't parallel build)

    msg "Now moving to the right place."
    mkdir -p $_fbroot "$pkgdir"/etc/{rc,profile}.d "$pkgdir"/usr/bin
    cp -R gen/firebird/* $_fbroot
    install -m755 "$srcdir/firebird.sh" "$pkgdir/etc/profile.d"
    install -m755 "$srcdir/firebird" "$pkgdir/etc/rc.d"
    install -m755 "gen/firebird/bin/fb_smp_server" "$pkgdir/usr/bin"

    rm -rf $_fbroot/{lib,include,*.msg} # provided by libfbclient
    mv gen/install/misc/firebird.conf $_fbroot
    mv gen/install/misc/fbintl.conf $_fbroot/intl
    mv $_fbroot/intl/{libfbintl.so,fbintl}
    rm -rf $_fbroot/misc
    mv $_fbroot/bin/{isql,fb_isql} # rename to avoid conflicts with unixodbc

   # # fb_config must be provided by libfbclient
   # # all scripts needed updating to Arch
   # # static and boot binaries needed only during build
    rm $_fbroot/bin/{*.sh,fb_config,*_static,*_boot,gpre_current,create_db,codes,build_file,blrtable} 

    msg "Installing the LICENSE"
    install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
