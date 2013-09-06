# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Yerko Escalona <yescalona at ug dot uchile dot cl>
# Contributor: Andreas W. Hauser <andy-aur at splashground dot de>
# Contributor: Patrick Leslie Polzer <leslie dot polzer at gmx dot net>

pkgname=ncc
pkgver=2.8
pkgrel=3
pkgdesc="C source code analyzer which generates program flow and variable usage information"
url="http://students.ceid.upatras.gr/~sxanth/ncc"
license=('custom')
depends=('gcc-libs' 'ncurses' 'python')
arch=('i686' 'x86_64')
source=("$url/$pkgname-$pkgver.tar.gz")
md5sums=('0a6500c8c05a5344902246a95094e654')

prepare () {

    cd "$srcdir/$pkgname-$pkgver"

    make distclean && make clean

    cd nccnav

    make 

}

build () {
    
    cd "$srcdir/$pkgname-$pkgver"

    make  
}

package () {

    cd "$srcdir/$pkgname-$pkgver"

    install -d "$pkgdir"/usr{/include,/bin,/share{/licenses/$pkgname,/doc/$pkgname,/man/man1}}

    # install the necessary binaries to /usr/bin

    install -m 755 -t "$pkgdir"/usr/bin objdir/ncc nccnav/nccnav scripts/nccstrip2.py scripts/nccstrip.py scripts/gengraph.py

    ln -sf /usr/bin/ncc -T "$pkgdir"/usr/bin/nccar
    ln -sf /usr/bin/ncc -T "$pkgdir"/usr/bin/nccld
    ln -sf /usr/bin/ncc -T "$pkgdir"/usr/bin/nccc++
    ln -sf /usr/bin/ncc -T "$pkgdir"/usr/bin/nccg++
    ln -sf /usr/bin/nccnav -T "$pkgdir"/usr/bin/nccnavi

    # install the necessary includes to /usr/include

    install -m 644 -t "$pkgdir"/usr/include doc/nognu

    for files in CHANGES TROUBLES NCC
    do
	install -m 644 -t "$pkgdir"/usr/share/doc/$pkgname doc/$files

    done

    install -m 644 -t "$pkgdir"/usr/share/licenses/$pkgname doc/LICENSE

    install -m 644 -t "$pkgdir"/usr/share/doc/$pkgname nccnav/README

    install -m 644 -t "$pkgdir"/usr/share/man/man1 ncc.1 nccnav/nccnav.1 scripts/gengraph.py.1

}

