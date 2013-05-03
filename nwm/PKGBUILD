# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: portix <portix@gmx.net>

pkgname=nwm
pkgver=1.0.1
pkgrel=4
pkgdesc="Ncurses window manager selector"
url="http://sourceforge.net/projects/nwm/"
arch=('any')
license=('GPL')
makedepends=('imake')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('2d37a7f39ff57223e0916ab04ac853c9')

prepare() {
    cd "$srcdir/$pkgname-$pkgver/src"

    xmkmf

}

build() {
    
    cd "$srcdir/$pkgname-$pkgver/src"

    make

}

package() {
    cd "$srcdir/$pkgname-$pkgver/src"

    make DESTDIR=$pkgdir install

    make clean
}

#package() {
    
    #install -d "$pkgdir/usr/bin"
    #install -d "$pkgdir/usr/share/doc/$pkgname"

    #cd "$srcdir/$pkgname-$pkgver"

    #install -m 755 -t "$pkgdir/usr/bin" "src/$pkgname"
    ## create an array of the documentation present in the cwd/pwd

    #export _listing=(README AUTHORS COPYING ChangeLog sample.nwm_cfg NEWS)
##    for idex in $(seq 1 $(cat "$srcdir/.listing" | wc -l))
    #export _idex=0
    
    #while [[ -n ${_listing[${_idex}]} ]]; do
	#install -m 644 -t "$pkgdir/usr/share/doc/$pkgname/" "${_listing[${_idex}]}" # `awk "NR == $idex {print ; exit}" $srcdir/.listing`
	#let _idex=_idex+1
    #done

#}
