# Contributor: Calimero <calimeroteknik@free.fr>

pkgname=moka-theme
pkgver=0.1
pkgrel=1
pkgdesc='Moka GTK-2.0/Openbox/Emerald dark theme'
arch=('i686' 'x86_64')
license=('GPL')
url=('http://rent0n86.deviantart.com/art/Moka-136909912')
source=('http://fc07.deviantart.net/fs71/f/2010/081/5/4/Moka_by_rent0n86.tgz')
md5sums=('c8e10dc3ee6b0c73ae275d72e64c46fc')

package() {
  #gtk & openbox themes
  mkdir -p "$pkgdir"/usr/share/themes/Moka
  cp -r "$srcdir"/Moka/{gtk-2.0,openbox-3} "$pkgdir"/usr/share/themes/Moka/

  #emerald theme
  mkdir -p "$pkgdir"/usr/share/emerald/themes/Moka
  tar xf "${srcdir}/Moka/Moka.emerald" -C "${pkgdir}/usr/share/emerald/themes/Moka"

  #tint2rc, conkyrc
  install -D -m644 "${srcdir}/Moka/tint2rc" "${pkgdir}/etc/xdg/tint2rc-moka"
  install -D -m644 "${srcdir}/Moka/.conkyrc" "${pkgdir}/etc/xdg/conkyrc-moka"
}
