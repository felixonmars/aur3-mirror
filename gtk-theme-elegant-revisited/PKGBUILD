# Maintainer: pixy <raeonz@gmail.com>
# Contributor: pixy <raeonz@gmail.com>

pkgname=gtk-theme-elegant-revisited
pkgver=0.3
pkgrel=1
pkgdesc="Variation of Elegant Brit gtk-theme with blue highlights. Includes gtk2, gtk3, Metacity, Xfce and GNOME Shell themes."
url="http://gnome-look.org/content/show.php/Elegant+Brit+Re-Revisited?content=149487"
license=('GPL3')
arch=('any')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://gnome-look.org/CONTENT/content-files/149487-elegant_brit_re_revisited-03.tar.gz")
md5sums=('0f3acef1aa10bb8dd3e6a6e31a7499b4')

package() {
  mkdir -p "${pkgdir}/usr/share/themes"
  cp -r "${srcdir}/elegant_brit_re_revisited-03" "${pkgdir}/usr/share/themes/elegant_brit_re_revisited"
}
