# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Contributor: Ido Kanner <idokan@gmail.com>

pkgname=firebird-ss-213
pkgver=2.1.3.18185
pkgdesc="Firebird RDBMS (Super Server)"
pkgrel=2
arch=('i686' 'x86_64')
url="http://www.firebirdsql.org/"
license=('custom')
depends=("libfbclient=$pkgver" "icu")
makedepends=("gcc" "autoconf" "automake" "patch")
conflicts=("firebird-cs")
provides=("firebird")
source=(http://downloads.sourceforge.net/firebird/Firebird-$pkgver-0.tar.bz2
        firebird
        firebird.sh
        LICENSE
        gcc-icu.diff)
md5sums=('ec42bd5c85dc2f65baef185228bcc5ca'
         '0c14cd5dec1659b24c11f072c2a88303'
         'de79c09c72eaa5bf006bdaa7b35620b9'
         '0d61798861e159c85dbdf0f30fe2f2ce'
         '870d2f6fead5ac50427acb76db3d95b3')

build() {
    _fbroot="$pkgdir/opt/firebird"
    cd "$srcdir/Firebird-$pkgver-0"

    patch -p0 < "$srcdir/gcc-icu.diff" || return 1

    msg "Configuring to use superserver, compiling, making and instaling."
    msg "Don't worry about the errors below."
    ./configure --prefix=/opt/firebird --enable-superserver --with-system-icu --with-editline
    make -j1 # bug in firebird makefiles (can't parallel build)

    msg "Now moving to the right place."
    mkdir -p $_fbroot "$pkgdir"/etc/{rc,profile}.d
    cp -R gen/firebird/* $_fbroot
    install -m755 "$srcdir/firebird.sh" "$pkgdir/etc/profile.d"
    install -m755 "$srcdir/firebird" "$pkgdir/etc/rc.d"

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
