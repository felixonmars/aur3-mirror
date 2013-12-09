# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=f-dark-icon-theme
pkgver=0.9
pkgrel=3
pkgdesc="Faenza Dark icon theme designed for Equinox GTK theme"
arch=(any)
url='http://gnome-look.org/content/show.php/F-Dark+(Faenza)+?content=135696'
license=(GPL3)
optdepends=(faenza-icon-theme)
source=(http://voyager.legtux.org/icones/F-Dark.zip)
sha256sums=('e9b482d53346c8b4ce4beef3a43397d17a394a5bc20ec7e86fe68af87a29b951')
sha512sums=('2cd019455a89e2129e67a365302a051fe63229872ef22669c96fedc9db2c6232c828cd5f4e78ede6bfa5621f6c680959961de9546e71c0456cbd6ebe5542d01b')

package() {
    install -d "$pkgdir"/usr/share/icons/
    cd F-Dark/
    bsdtar -xf F-Dark.tar.gz -C "$pkgdir"/usr/share/icons/
    bsdtar -xf F-Dark-Black.tar.gz -C "$pkgdir"/usr/share/icons/

    # Adding in symlinks for distributor and start menu icons
    cd "$pkgdir"/usr/share/icons/F-Dark/places/
    for size in 16 22 24 32 48
    do
        pushd $size
        ln -sf distributor-logo{-archlinux,}.png
        ln -sf start-here{-archlinux,}.png
        popd
    done

    pushd scalable/
    ln -sf distributor-logo{-archlinux,}.png
    popd

    cd ../../F-Dark-Black/places/
    for size in 16 22 24 32 48
    do
        pushd $size
        ln -sf start-here{-archlinux,}.png
        popd
    done
}
