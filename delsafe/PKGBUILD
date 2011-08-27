# Previous Contributor: Colin Shea <evaryont@gmx.us>
# If anyone decides to maintain this package, just remove these lines.
# I'm leaving my contact info here just in case anyone wants to spam me :)
pkgname=delsafe
pkgver=0.6.0
pkgrel=1
pkgdesc="delsafe is a set of utilities that when you delete a file the file is moved into a trash can via LD_PRELOAD"
arch=('i686')
url="http://homepage.esoterica.pt/~nx0yew/delsafe/"
license=('GPL')
groups=()
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='delsafe.install'
source=(http://homepage.esoterica.pt/~nx0yew/delsafe/$pkgname-$pkgver.sh egrep_del_cap_e.patch)
md5sums=('30de453e4ef90c9b2aa0c9df5aa3a42f'
         '940e43362bb129c993021d2cd64a1592')
#md5sums=('ddec1b2cbfbbe1472b9aabbc03d02c2f'
#         '940e43362bb129c993021d2cd64a1592')

build() {
    # pkg/ Prep
    mkdir $pkgdir/lib
    mkdir -p $pkgdir/usr/share/doc/delsafe
    mkdir $pkgdir/usr/bin
    mkdir -p $pkgdir/etc/cron.daily
    mkdir $pkgdir/etc/profile.d

    # Extraction
    csplit $pkgname-$pkgver.sh %BEGIN\ OF\ COMPRESSED\ AREA%+1
    mv xx00 $pkgname-$pkgver.tar.bz2
    tar -xjf $pkgname-$pkgver.tar.bz2
    cd $srcdir/$pkgname-$pkgver
#    patch -p0 < ../egrep_del_cap_e.patch # 'egrep -E' fails
    echo "Continue pressing Enter for the defaults (which is enough for most people)"
    ./build_config
    
    # Compile prep
    chmod 700 preprocess.py
    python preprocess.py new
    mv libdelsafe.c libdelsafe.c.sav
    mv libdelsafe.c.new libdelsafe.c

    # Actually compiling it
    cd Release
    make -f makefile clean
    make -f makefile
    cd ..

    # Install the files to pkg/
    install -m 644 delsafe.conf.new $pkgdir/etc/delsafe.conf
    install -m 755 Release/libdelsafe-${pkgver}.so $pkgdir/lib
    (cd $pkgdir/lib; ln -s libdelsafe-${pkgver}.so libdelsafe.so)
    install -m 755 delsafe_create.py $pkgdir/usr/bin/delsafe_create
    install -m 755 undel.py $pkgdir/usr/bin/undel
    install -m 755 delsafe_clean.py $pkgdir/usr/bin/delsafe_clean
    install -m 700 delsafe_clean.py $pkgdir/etc/cron.daily/delsafe_clean
    install -m 755 notrash $pkgdir/usr/bin
    echo 'export LD_PRELOAD="/lib/libdelsafe.so $LD_PRELOAD"' > $pkgdir/etc/profile.d/delsafe.sh
    chmod a+x $pkgdir/etc/profile.d/delsafe.sh
    # Install documentation (My own idea, not in the Manual Install)
    install -m 644 README $pkgdir/usr/share/doc/delsafe
    install -m 644 license $pkgdir/usr/share/doc/delsafe
    install -m 644 todo $pkgdir/usr/share/doc/delsafe

    # Done!
    # Instructions adapted from the Manual Install section of the delsafe homepage
}

# vim:set ts=4 sw=4 et:
