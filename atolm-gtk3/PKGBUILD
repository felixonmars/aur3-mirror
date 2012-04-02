# Maintainer:  Stunts <f.pinamartins@gmail.com>
# Contributor: Synthead	<synthead@gmail.com>

pkgname=atolm-gtk3
_up_pkgname=Atolm-gtk3
pkgver=2011.11.17
pkgrel=3
pkgdesc="Gtk3 Dark theme by MrMars (with support for gtk2)"
arch=(any)
license=('CCPL')
depends=('gtk3' 'gnome-themes-standard')
optdepends=('gtk-engine-equinox: quiet some gtk2 warnings' 'gtk-engine-murrine: quiet some more gtk2 warnings')
url="http://thedeviantmars.deviantart.com/art/Atolm-gtk3-206663190"
source=(http://www.deviantart.com/download/206663190/${pkgname}_by_thedeviantmars-d3f1ic6.zip)
md5sums=('71307477ec82cfb5e0e9baf198fce2fa') 

package() {
  cd "${srcdir}/"
  tar xfz ${_up_pkgname}.tar.gz
  mkdir -p "${pkgdir}/usr/share/themes"
  cp -r "${srcdir}/${_up_pkgname}" "${pkgdir}/usr/share/themes"

  # fix incorrect executable bits
  find "$pkgdir/usr/share/themes/Atolm-gtk3" -type f -executable -exec chmod 644 {} \;
  # remove unused copies and temporary files
  find "$pkgdir/usr/share/themes/Atolm-gtk3" -type f -regex '\(.* (copy)\..*\|.*~$\)' -exec rm {} \;

}
