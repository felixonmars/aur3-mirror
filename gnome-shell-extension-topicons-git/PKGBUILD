pkgname=gnome-shell-extension-topicons-git
pkgver=r16.ef589cd
pkgrel=1
pkgdesc="Shows legacy tray icons on top"
arch=('any')
url="http://94.247.144.115/~git/topicons.git"
license=('GPL')
depends=('dconf')
makedepends=('git' 'gnome-common' 'intltool')
conflicts=('gnome-shell-extensions-git'
	   'gnome-shell-extensions-topicons')
provides=('gnome-shell-extension-topicons-git')
source=("$pkgname"::'git+http://94.247.144.115/~git/topicons.git')
md5sums=('SKIP')
install="gschemas.install"

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"
    mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/topIcons@adel.gadllah@gmail.com"
    cp extension.js "${pkgdir}/usr/share/gnome-shell/extensions/topIcons@adel.gadllah@gmail.com/"
    cp metadata.json "${pkgdir}/usr/share/gnome-shell/extensions/topIcons@adel.gadllah@gmail.com/"
}
