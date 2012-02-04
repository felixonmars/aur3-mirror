# Maintainer: Ruben Schuller <r.schuller@orgizm.net>
pkgname=silk-icons
pkgver=1.3
pkgrel=1
pkgdesc="'Silk' is a smooth, free icon set, containing over 700 16-by-16 pixel icons in strokably-soft PNG format."
arch=('i686' 'x86_64' 'ppc')
url="http://www.famfamfam.com/lab/icons/silk/"
license="CCPL-Attribution-2.5"
source=(http://www.famfamfam.com/lab/icons/silk/famfamfam_silk_icons_v013.zip)
md5sums=('7c60fef364ca681448d39726930535de')

build() {
    mkdir -p $startdir/pkg/usr/share/icons
    cp -R $startdir/src/icons $startdir/pkg/usr/share/icons/silk
}
