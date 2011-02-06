# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>

pkgname=firebird-cs
pkgver=2.1.2.18118
pkgdesc="Firebird RDBMS (Classic Server)"
pkgrel=2
arch=('i686' 'x86_64')
url="http://www.firebirdsql.org/"
license=('custom')
depends=("libfbclient=$pkgver" "icu" "xinetd")
makedepends=("gcc" "autoconf" "automake")
conflicts=("firebird-ss")
provides=("firebird")
source=(http://downloads.sourceforge.net/firebird/Firebird-$pkgver-0.tar.bz2
        firebird.sh
        LICENSE)

md5sums=('063b3825a06d328f726b733fd74614b1'
         'de79c09c72eaa5bf006bdaa7b35620b9'
         '0d61798861e159c85dbdf0f30fe2f2ce')

build() {
    _fbroot="$pkgdir/opt/firebird"
    cd "$srcdir/Firebird-$pkgver-0"

    msg "Configuring to use classic server, compiling, making and instaling."
    msg "Don't worry about the errors below."
    ./configure --prefix=/opt/firebird --with-system-icu
    make -j1 # bug in firebird makefiles (can't parallel build)

    msg "Now moving to the right place."
    mkdir -p $_fbroot "$pkgdir"/etc/{xinetd,profile}.d
    cp -R gen/firebird/* $_fbroot
    install -m755 "$srcdir/firebird.sh" "$pkgdir/etc/profile.d"
    install -m644 gen/install/misc/firebird.xinetd "$pkgdir/etc/xinetd.d/firebird"

    rm -rf $_fbroot/{lib,include,*.msg} # provided by libfbclient
    mv $_fbroot/misc/firebird.conf $_fbroot
    mv $_fbroot/misc/fbintl.conf $_fbroot/intl
    mv $_fbroot/intl/{libfbintl.so,fbintl}
    rm -rf $_fbroot/misc
    mv $_fbroot/bin/{isql,fb_isql} # rename to avoid conflicts with unixodbc

    # fb_config must be provided by libfbclient
    # all scripts needed updating to Arch
    # static and boot binaries needed only during build
    rm $_fbroot/bin/{*.sh,fb_config,*_static,*_boot,gpre_current,create_db,codes,build_file,blrtable} $_fbroot/isc_{lock,init}*

    msg "Installing the LICENSE"
    install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
