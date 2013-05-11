# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: slubman <slubman@slubman.net>
# Contributor: hardfalcon <hardfalcon@gpfclan.de>
# Contributor: Laszlo Papp <djszapi@gmail.com>

pkgname=ktigcc
pkgver=1.10
pkgrel=1
pkgdesc="IDE for the tigcc cross-toolchain"
arch=(i686 x86_64)
url=http://tigcc.ticalc.org
license=(GPL2)
depends=(desktop-file-utils kdelibs3 libticalcs tigcc)
groups=(ti68k)
source=(http://downloads.sourceforge.net/sourceforge/tigcc-linux/$pkgname-$pkgver.tar.bz2
    http://downloads.sourceforge.net/sourceforge/tigcc-linux/ktigcc-completion-data-0.96b08r1-1.tar.bz2 
    const-char.patch
    use-moc.patch
    $pkgname.desktop)
sha256sums=('ff585edb3a7c078ab3fd1630e67b07c2516383a4568cad463c10234fe7d1fa9b'
    'eafbab85cdd81af48e9806b3a0e162ea251243c0d1ceee04137542ffb31f502c'
    '156467081feaff7040072536d2d3c3ed6a858603c1df70f372b39c1c0c72e2f1'
    'ea781869ec8cf1773bcffae03e29b585aa8fc56bf5ee0711d8eb59490d4b0675'
    'c0c9be116b8564bed3019e334368e06c2b25866ade5de98d247836e5f9fe0df5')
sha512sums=('ae7ad58ceffd0331fc61f5cab9e8f502df6ab740f71c61ec44aa6478af531601a7e7a625301150bfb899aa5b606f8ebaf0a0464355aa70e0dd173679245b9b80'
    '5cd8523e3926a63f69852dafdf85cf008392006f3715aad7269dfc666928bb148c714ec6e9e38ad09a782094755ad1aef7463444fb8b7215dbf4f95c255368af'
    '550d1e2006f11973995fb2d0768bca6eb971d8e523b33b4978c75a4908623af9a35d9082a24305db9191ab72d3aead5b93125f1eb2a3b726d12d5a9b54ff11a9'
    '56814f443edfce9af17338a6ae87634e46b29431ca35e6668b7af338224d4c1cc544eaaf883448b7716540f12bfee6d5df6b41deccfd0be3cefad0846c586e41'
    '90c79dea888a23d40f4d294b4fae9df61936cf7de0265da587f4ea88eedf316e081e57f871d7df8e8a9211623bc4577f0912ba27a15ecb666831c4aa896c416a')

prepare() {
    cd $pkgname/
    sed -i 's|kde-config|/opt/kde/bin/&|g' $pkgname.pro
    patch -p1 -i ../const-char.patch
}

build() {
    cd $pkgname/
    qmake-qt3 PREFIX=/usr MOC=moc-qt3
    patch -p1 -i ../use-moc.patch
    make MOC=moc-qt3 UIC=uic-qt3 INCPATH=' -I/usr/include/qt3 -I/opt/kde/include -I./.ui/ -I.'
}

package() {
    desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications/
    install -Dm644 completion "$pkgdir"/$(/opt/kde/bin/kde-config --expandvars --install data)/ktigcc/completion

    cd $pkgname/
    make INSTALL_ROOT="$pkgdir" install
    install -Dm644 images/$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}
