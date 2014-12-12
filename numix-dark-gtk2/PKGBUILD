# Maintainer: Simonas Racinas <racinas at icloud.com>
pkgname=numix-dark-gtk2
pkgver=1.0
pkgrel=1
url='https://plus.google.com/+NumixProjectOrg'
pkgdesc="Numix Dark theme for GTK2 apps (chrome,eclipse,netbeans etc.)"
arch=('any')
depends=('gtk-engines')
license=('GPL')
source=('gtkrc')
sha256sums=('b27f74983a45ea10430db149c15bffb3b6fa863f9002dd502fab1762802d8544')

package() {
  mkdir -p "${pkgdir}/usr/share/themes/Numix-Dark-GTK2/gtk-2.0/"
  cp "gtkrc" "${pkgdir}/usr/share/themes/Numix-Dark-GTK2/gtk-2.0/gtkrc"
}
