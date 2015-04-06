# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Josh McGee <j.s.mcgee115@gmail.com>
# Contributor:  Matthew Bauer <mjbauer95@gmail.com>

pkgname=boomerang
pkgver=0.3
pkgrel=5
pkgdesc="A general, open source, retargetable decompiler of machine code programs"
arch=(i686 x86_64)
url=http://$pkgname.sourceforge.net/
license=(custom)
depends=(lib32-gc lib32-qt4)
[[ $CARCH == "i686" ]] && depends=(${depends[@]/lib32-/})
source=(http://prdownloads.sourceforge.net/$pkgname/$pkgname-linux-alpha-$pkgver.tar.gz)
sha256sums=('bf5350451037f4f22c737bf4d073cdeadbbec9d661ab1eb440277c201e175726')
sha512sums=('2521d267e42946ecac5ced834f880b41afd5f07f84bfd55eb558b48f8dd1417d8a640920b200da0b6958b309cf498d682cc0964a3bdcb26a7bf21f21460a6e43')

package() {
    cd $pkgname-linux-alpha-$pkgver/
    install -d "$pkgdir"/opt/$pkgname/
    cp -r . "$pkgdir"/opt/$pkgname/

    install -d "$pkgdir"/usr/bin/
    ln -s /opt/$pkgname/$pkgname "$pkgdir"/usr/bin/$pkgname
    ln -s /opt/$pkgname/$pkgname-gui "$pkgdir"/usr/bin/$pkgname-gui

    [[ $CARCH == "i686" ]] && _lib=lib || _lib=lib32
    install -d $pkgdir/usr/
    mv "$pkgdir"/opt/$pkgname/lib/ "$pkgdir"/usr/$_lib/
    ln -s libQtCore.so.4 "$pkgdir"/usr/$_lib/libQtCore_debug.so.4
    ln -s libQtGui.so.4 "$pkgdir"/usr/$_lib/libQtGui_debug.so.4
}
