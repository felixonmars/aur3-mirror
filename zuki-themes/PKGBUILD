pkgname=zuki-themes
pkgver=47.33058c4
pkgrel=1
pkgdesc="Themes for GTK, gnome-shell and more."
arch=('any')
url="https://github.com/lassekongo83/zuki-themes"
license=('various')

depends=('gtk-engine-murrine'
         'gtk-engines')
makedepends=('git')
conflicts=('zukitwo-themes'
           'gtk3-zukitre-theme')
provides=("${conflicts[@]}" 'zuki-themes')
source=("git://github.com/lassekongo83/zuki-themes.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    mkdir -p "${pkgdir}/usr/share/themes"
    cp -r "${srcdir}/${pkgname}"/{ZukiShell,Zukitre,Zukitwo,Zukiwi} "${pkgdir}/usr/share/themes"
}
