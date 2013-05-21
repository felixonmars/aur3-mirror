# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TuxSpirit <tuxspirit@archlinux.fr>

pkgname=freearc
pkgver=0.666
_pkgname=FreeArc-$pkgver-linux-i386
pkgrel=4
pkgdesc="Combines unrivaled speed and compression ratio with a multitude of features"
arch=(i686 x86_64)
url=http://freearc.org
license=(GPL)
depends=(desktop-file-utils lib32-curl lib32-gmp4 lib32-gtk2 lib32-ncurses)
[[ $CARCH == "i686" ]] && depends=(${depends[@]/lib32-/})
options=(!emptydirs)
install=$pkgname.install
source=($url/download/$pkgver/$_pkgname.tar.bz2
    $pkgname.desktop
    freearcusercfg.sh)
sha256sums=('84b53a3151493ae40408458b19a099e65526b6a589be343e48954d8c8446a1b9'
    'bc1028e8e36e560a1a8581a2e0ac0ea255bb519a97f9e5d801d3fa6899c43371'
    '848c77ba5660a3459ab840d9951b9ae9ee8ec525232bbb4b18d198478670ddbc')
sha512sums=('bfe166d4baaf38a66b55ef88c573800ad93f145a41235673368470f2f3d2b359e1cf867e3d8d07a45365061ffe69413a72d2f277cf77376ac060fd4cf536b310'
    'ec640964ec448c1af28bae297b82921a14c0ab0ca68c31de730f68f4922ff04bf05b31d6b1b7589d1cf956ea8d8f6f596b40ae9e3c086cab172c1ff1a69c5c12'
    'fc851ac2b7890420ba16977bd4c20441690a7da15f1dc0e9c8a384aebae02fdfdf83cfaaebd25b7ef7568333f90899d48e6d39ff1a60c500f1b99335814dbe40')

prepare(){
    [[ $CARCH == "x86_64" ]] && sed -i 's:libdir=.*:&32:' freearcusercfg.sh
}

package(){
    _libdir=lib
    [[ $CARCH == "x86_64" ]] && _libdir+=32
    desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications/
    cd $_pkgname/
    install -d "$pkgdir"/usr/{share/doc/,$_libdir/FreeArc}
    mv Documentation "$pkgdir"/usr/share/doc/$pkgname/
    cp -r bin "$pkgdir"/usr/
    cp -r lib/* scripts Addons "$pkgdir"/usr/$_libdir/FreeArc/
    install -Dm755 ../freearcusercfg.sh "$pkgdir"/usr/$_libdir/FreeArc/scripts/freearcusercfg.sh

    install -d "$pkgdir"/etc/
    cp -r cfg "$pkgdir"/etc/
}  
