# Contributor: Allen Li <darkfeline (at) abagofapples.com>

pkgname=ttf-dejavu-dwm-icons
pkgver=1.0
pkgrel=3
pkgdesc="DejaVu Sans font with icons for dwm statusbar"
arch=('any')
license=('custom:DejaVu free license')
source=('DejaVuSansDwmicons.ttf' 'LICENSE' 'icon_list')
url=('http://dejavu-fonts.org/')
md5sums=('9c827bf1556c2ae22259983394eaacf9' 
         'f5a482f64c7336e24b0c64ac739c81dc'
         '4230b1c710ab871d38ed822aefab30e0')
install=$pkgname.install

build() {
    mkdir -p $pkgdir/usr/share/fonts/TTF
    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    chmod a+r $srcdir/*.ttf
    cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
    cp $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname
}
