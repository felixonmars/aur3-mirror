# Maintainer: foalsrock <foalsrock at gmail dot com>

pkgname=gnome-shell-extension-desktop-scroller
pkgver=8
pkgrel=2
_gpkgid=525
pkgdesc="Switch between desktops scrolling at right edge of the screen"
arch=('any')
url="https://extensions.gnome.org/extension/136/desktop-scroller/"
license=('GPL')
depends=('gnome-shell')
makedepends=('unzip')
groups=('gnome-shell-extensions')
source=("https://extensions.gnome.org/review/download/${_gpkgid}.shell-extension.zip"
        "3.4metadata.patch")
noextract=("${_gpkgid}.shell-extension.zip")
md5sums=('110fc2057e3f3bc58f6c24f373b216cb'
         'b91c9f527b87477fbe9220769672d1d5')

package()
{
    mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/desktop-scroller@gnome.org"
    mkdir -p "${pkgdir}/usr/share/licenses/gnome-shell-extension-desktop-scroller"
    unzip "${srcdir}/${_gpkgid}.shell-extension.zip" -d "${pkgdir}/usr/share/gnome-shell/extensions/desktop-scroller@gnome.org/"
    mv "${pkgdir}/usr/share/gnome-shell/extensions/desktop-scroller@gnome.org/LICENSE" "${pkgdir}/usr/share/licenses/gnome-shell-extension-desktop-scroller/"
    find "${pkgdir}" -name '*' -type f -exec chmod 644 -f '{}' \;

    cd "${pkgdir}/usr/share/gnome-shell/extensions/desktop-scroller@gnome.org"
    patch -i "${srcdir}/3.4metadata.patch"
}
