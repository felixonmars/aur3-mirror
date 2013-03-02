# Maintainer: Alexej Magura <agm2819*gmail*>
# 
# 
pkgname=oangband
pkgver=1.1.0
pkgrel=3
pkgdesc="an Angband variant emphasising intuitive rules, varied gameplay, and extra coolness."
arch=('i686' 'x86_64')
url="http://www.oangband.com/main.php"
license=('custom')
groups=('')
depends=('')
makedepends=('rpl')
provides=('')
conflicts=('')
replaces=('')
#backup=('')
options=('')
source=("http://www.oangband.com/zips/Oangband`echo -n "$pkgver" | sed 's/\.//g'`-src.tar.gz" "oangband.sh") 
md5sums=('ea93890b45a0dc8edfedd86e3c083ec7' 'bacd7a5e6f24bd1b28450d027f96c6e8')


build() {
    cd "$srcdir/$pkgname"
    #rename "configure.in" "configure.ac" "configure.in"
    rpl "AM_CONFIG_HEADER" "AC_CONFIG_HEADERS" "configure.in"
    aclocal
    automake --add-missing
    ./configure --prefix=/usr
    make
    make DESTDIR="$pkgdir/" install
}


check() {
    cd "$srcdir/$pkgname/lib/"
    rm "Makefile"
    rm "Makefile.am"
    rm "Makefile.in"
    cd "info"
    rm "Makefile"
    rm "Makefile.am"
    rm "Makefile.in"
    cd "../help"
    rm "Makefile"
    rm "Makefile.in"
    rm "Makefile.am"
    cd "../file"
    rm "Makefile"
    rm "Makefile.in" 
    rm "Makefile.am"
    cd "../edit"
    rm "Makefile"
    rm "Makefile.in"
    rm "Makefile.am"
    cd "../apex"
    rm "Makefile"
    rm "Makefile.in"
    rm "Makefile.am"
    rm "delete.me"
    cd "../bone"
    rm "Makefile"
    rm "Makefile.in"
    rm "Makefile.am"
    cd "../data"
    rm "Makefile"
    rm "Makefile.in"
    rm "Makefile.am"
    rm "delete.me"
    cd "../pref"
    rm "Makefile"
    rm "Makefile.in"
    rm "Makefile.am"
    cd "../save"
    rm "Makefile"
    rm "Makefile.in"
    rm "Makefile.am"
    cd "../user"
    rm "Makefile"
    rm "Makefile.in"
    rm "Makefile.am"
    cd "../xtra"
    rm "Makefile"
    rm "Makefile.in"
    rm "Makefile.am"
    rm "delete.me"
    cd "../pref"
    rm "delete.me"
    cd "../save"
    rm "delete.me"

}

package() {
    cd "$srcdir/$pkgname/src"
    
    # install the actual binary

    install -m 755 -D "$pkgname" "$pkgdir/opt/$pkgname/$pkgname"

    # install the files the binary needs in order to work

    cd "$srcdir/$pkgname"

    tar -czf "lib.tar.gz" "lib/"

    install -D "lib.tar.gz" "$pkgdir/opt/$pkgname/lib.tar.gz"

    cd "$pkgdir/opt/$pkgname"

    tar -xzf "lib.tar.gz"

    rm -f "lib.tar.gz"

    chown -R root lib && chgrp -R root lib

    # install the documentation

    cd "$srcdir/$pkgname"

    tar -czf "docs.tar.gz" "A-readmes/"

    install -D "docs.tar.gz" "$pkgdir/opt/$pkgname/docs.tar.gz"

    cd "$pkgdir/opt/$pkgname"

    tar -xzf "docs.tar.gz"

    rm -f "docs.tar.gz"

    mv "A-readmes" "docs"

    chown -R root docs && chgrp -R root docs

    echo "$pkgrel" > "release-al.txt"

    cd "$srcdir"

    install -m 755 -D "oangband.sh" "$pkgdir/usr/bin/$pkgname"
}

