# Author: ~0rAX0 <http://0rax0.deviantart.com/>
# Maintainer: foalsrock <foalsrock at gmail dot com>

pkgname=gnome-shell-theme-sud
pkgver=1.0
pkgrel=1
pkgdesc="The dark version of the GNOME Shell theme Nord"
url="http://0rax0.deviantart.com/gallery/#/d5ooker"
license=('cc-by-nc-sa-3.0')
arch=('any')
depends=('gnome-shell')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.'
            'ttf-lato: The intended font.')
source=("http://www.deviantart.com/download/343787859/gnome_shell__sud_by_0rax0-d5ooker.zip")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('7414782120cef8bce147e351584a0824')

package() {
  mkdir -p "${pkgdir}/usr/share/themes/"
  cp -r "${srcdir}/Sud" "${pkgdir}/usr/share/themes/"

  mkdir -p "${pkgdir}/usr/share/licenses/gnome-shell-theme-sud"
  mv "${pkgdir}/usr/share/themes/Sud/gnome-shell/COPYING" \
    "${pkgdir}/usr/share/licenses/gnome-shell-theme-sud/"
}

