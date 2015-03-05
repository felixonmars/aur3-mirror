# Maintainer: fauno <fauno@kiwwwi.com.ar>

pkgname=trisquel-themes
pkgver=7.0
_ver=8
_miniver="7.0-2"
pkgrel=1
pkgdesc="Themes from Trisquel, including GTK2, Metacity, XFWM and Openbox themes"
arch=('any')
url=http://trisquel.info
license=('GPL')
optdepends=('gtk-engine-equinox: for Trisquel GTK2 theme')
source=(http://archive.trisquel.info/trisquel/pool/main/t/trisquel-gtk-theme/trisquel-gtk-theme_${pkgver}-${_ver}.tar.gz
        http://archive.trisquel.info/trisquel/pool/main/t/trisquel-mini-data/trisquel-mini-data_${_miniver}.tar.gz)
md5sums=('1342affa3a7342de76f04076eab2f4ea'
         '7ed4d5b9a7e7e829826506dd9a135d29')

build() {
	:
}

package() {
	install -d ${pkgdir}/usr/share/themes

    for trisquelsrc in trisquel-gtk-theme/data trisquel-mini-data; do
	    cp -R ${srcdir}/${trisquelsrc}/usr/share/themes/* \
              ${pkgdir}/usr/share/themes/
    done
}
