# Maintainer: Miroslav Koskar (http://miroslavkoskar.com)

pkgname='gtk3-theme-mist-git'
pkgver='r0'
pkgrel=1
pkgdesc="GTK 3.x theme matching GTK 2.x Mist theme"
arch=('any')
url='https://github.com/miroslavkoskar/gtk-theme-mist'
license=('GPL3')
makedepends=('git')

source=('git+https://github.com/miroslavkoskar/gtk-theme-mist')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/gtk-theme-mist"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/gtk-theme-mist"
    install -d "$pkgdir/usr/share/themes/Mist"
    cp -dpr --no-preserve=ownership Mist/gtk-3.0 "$pkgdir/usr/share/themes/Mist"
}
