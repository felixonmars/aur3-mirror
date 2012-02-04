# Contributor: quasi <quasi@aur.archlinux.org>

pkgname=reduce-algebra
pkgver=20110414
pkgrel=1
pkgdesc="A portable general-purpose computer algebra system"
arch=('i686' 'x86_64')
url="http://reduce-algebra.sourceforge.net/"
license=('BSD')
depends=()
source=(http://downloads.sourceforge.net/project/reduce-algebra/reduce-src-$pkgver.tar.bz2 reduce.desktop reduce.sh)
md5sums=('f3abfb66d388cb05c6d7e19d264b2ba6' '9787ec435b89a36992100f09af809d98' 'cb078af82e37baaf6aa475d2a387010b')

build() {
    cd $srcdir/reduce-$pkgver || return 1
    ./configure --with-csl || return 1
    make || return 1
}  

package(){

    mkdir -p $pkgdir/opt/reduce-algebra/ || return 1
    mkdir -p $pkgdir/usr/share/applications || return 1
    mkdir -p $pkgdir/usr/share/icons || return 1
    cp $srcdir/reduce-$pkgver/cslbuild/generated-c/reduce.img $pkgdir/opt/reduce-algebra/ || return 1
    cp $srcdir/reduce-$pkgver/cslbuild/$CARCH-unknown-linux-gnu/csl/reduce $pkgdir/opt/reduce-algebra/ || return 1
    cp -r $srcdir/reduce-$pkgver/cslbuild/$CARCH-unknown-linux-gnu/csl/reduce.doc $pkgdir/opt/reduce-algebra/ || return 1
    cp -r $srcdir/reduce-$pkgver/cslbuild/$CARCH-unknown-linux-gnu/csl/reduce.fonts $pkgdir/opt/reduce-algebra/ || return 1
    cp $startdir/reduce.sh $pkgdir/opt/reduce-algebra/ || return 1
    chmod 755 $pkgdir/opt/reduce-algebra/reduce.sh || return 1
    cp $startdir/reduce.desktop $pkgdir/usr/share/applications || return 1
    cp $srcdir/reduce-$pkgver/generic/qreduce/Bumblebee.png $pkgdir/usr/share/icons/reduce.png || return 1

}
