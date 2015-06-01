# Contributor: Yamashita Ren <lemaitre dot lotus at gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TuxSpirit <tuxspirit@archlinux.fr>

pkgname=peazip-qt-opensuse
pkgver=5.6.0
pkgrel=1.6
pkgdesc="QT archiver utility"
arch=(x86_64)
url=http://peazip.sourceforge.net/peazip-linux.html
license=(Artistic2.0 LGPL2.1)
depends=(balz desktop-file-utils curl gmp4 libx11 ncurses qt4pas p7zip upx zpaq)
optdepends=(quad unace)
provides=(${pkgname%-*-*})
conflicts=(${pkgname%-*-*}-gtk2 ${pkgname%-*})
install=${pkgname%-*-*}.install
source=(http://download.opensuse.org/repositories/devel:/languages:/pascal/openSUSE_Factory/${CARCH}/${pkgname%-*-*}-${pkgver}-${pkgrel}.${CARCH}.rpm)
sha256sums=('d7ded8be86da1c7ff342da653653471b0ccf5ca8a2c7ab0295b5b6cb649ead82')
sha512sums=('b93a7a216405f9d5d16f3a8341358b3a818f8a78380c8614e928f7703ad40a50c327cacbd139bfe0ad2fcfa5c7715aafde68bcfc300562dfde9ca6e0bc46d73e')

package() {
    _resdir="$pkgdir"/usr/lib/${pkgname%-*-*}/res/

    cd "$srcdir"/usr/lib64/peazip/res/

    install -Dm755 ../${pkgname%-*-*} "$pkgdir"/usr/lib/${pkgname%-*-*}/${pkgname%-*-*}

    for i in pea pealauncher; do
        install -Dm755 $i "$_resdir"/$i
    done
    for i in altconf.txt lang/* themes/{{nographic,seven}-embedded/*,*.7z}; do
        install -Dm644 $i "$_resdir"/$i
    done

    install -d "$_resdir"/7z/Codecs/
    for i in 7z{,a,r,.so,Con.sfx,.sfx} Codecs/Rar29.so; do
        ln -sf /usr/lib/p7zip/$i "$_resdir"/7z/$i
    done
    for i in quad/{balz,quad} unace/unace upx/upx lpaq/lpaq8 paq/paq8o zpaq/zpaq; do
        install -d "$_resdir"/$(dirname $i)/
        ln -sf /usr/bin/$(basename $i) "$_resdir"/$i
    done
    install -d "$pkgdir"/usr/bin/
    for i in /usr/lib/${pkgname%-*-*}/{${pkgname%-*-*},res/pea,res/pealauncher}; do
        ln -sf $i "$pkgdir"/usr/bin/$(basename $i)
    done

    install -Dm644 "$srcdir"/usr/share/pixmaps/${pkgname%-*-*}.png "$pkgdir"/usr/share/pixmaps/${pkgname%-*-*}.png
    desktop-file-install "$srcdir"/usr/share/applications/${pkgname%-*-*}.desktop --dir "$pkgdir"/usr/share/applications/
}
