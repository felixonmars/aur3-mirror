# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: sausageandeggs <sausageandeggs@archlinux.us>

_pkgname=kAwOken
pkgname=kawoken-icons
pkgver=1.5
pkgrel=1
pkgdesc="Simple and quite complete icon set, Token-style. Ported to kde"
arch=(any)
url=http://alecive.deviantart.com/art/$_pkgname-244166779
license=(CCPL:by-nc-sa-3.0)
depends=(kdelibs librsvg)
optdepends=('imagemagick: to color the iconset'
    'xdg-utils: to be able to launch programs from the configuration script.'
    'zenity: for customization gui')
options=(!emptydirs !strip)
install=${_pkgname,,}.install
source=(https://dl.dropbox.com/u/8029324/$_pkgname-$pkgver.zip)
sha256sums=('513cef3ffa75a884ababcd6ffe4e7a43e214f8fb378a18197832eb2b777dd5db')
sha512sums=('767084f04721ecd8fba6393054a41808d838a932d639fbb75ea4c492a9458cb8b561201f22d4b614c818889b3b3b420c6cf11c541515cb9c579b8149c2367aae')

package() {
    cd $_pkgname-$pkgver/

    install -d "$pkgdir"/usr/share/icons/
    for archive in ${_pkgname}{,Dark,White}.tar.gz; do
        bsdtar -xf $archive -C "$pkgdir"/usr/share/icons/
    done

    cd "$pkgdir"/usr/share/icons/
    find -type d -exec chmod 755 '{}' \;
    find -type f -exec chmod 644 '{}' \;
    find -name '*.sh' -exec chmod 755 '{}' \;
    chown -R root:root *

    install -Dm644 $_pkgname/Installation_and_Instructions.pdf "$pkgdir"/usr/share/doc/$pkgname/Customization.pdf
    rm $_pkgname/Installation_and_Instructions.pdf
    ln -s /usr/share/doc/$pkgname/Customization.pdf "$pkgdir"/usr/share/icons/$_pkgname/Installation_and_Instructions.pdf


    local scripts=($_pkgname/kawoken-icon-theme-customization{,-clear}
        ${_pkgname}Dark/kawoken-icon-theme-customization-dark
        ${_pkgname}White/kawoken-icon-theme-customization-white)

    for i in ${_pkgname}{,Dark,White}/index.theme ${scripts[@]}; do
        chmod 755 $i
    done
    install -d "$pkgdir"/usr/bin/
    for i in ${scripts[@]}; do
        ln -s /usr/share/icons/$i "$pkgdir"/usr/bin/
    done
}
