#Contributor: Jakub Luzny <Limoto94@gmail.com>
#Contributor: blasse <koralik(at)gmail(dot)com>

pkgname=ghamachi
pkgver=0.8.1
pkgrel=2
pkgdesc="GTK2 frontend to Hamachi"
url="http://www.penguinbyte.com/software/ghamachi/"
depends=('hamachi' 'gtk2')
source=("http://purebasic.myftp.org/files/3/projects/hamachi/v.0.8.1/gHamachi_0.8.1.tar.gz"
        'ghamachi.desktop'
        'hamachi.png')
md5sums=('d3af90ec3e0d41c58e9a4fe2dcd2a068'
         '365e7b5294d4ab6118b168e0e7395a87'
         'f07be2ebffbd0451096653fff868b5e5')
arch=(i686)
license=('GPL')

build() {
cd $startdir/src/
install -Dm 755 ghamachi $startdir/pkg/usr/bin/ghamachi
install -Dm 644 README $startdir/pkg/usr/share/ghamachi/README
install -m755 -d ${pkgdir}/usr/share/applications
install -m755 -d ${pkgdir}/usr/share/pixmaps
install -m644 ${srcdir}/ghamachi.desktop ${pkgdir}/usr/share/applications/ || return 1
install -m644 ${srcdir}/hamachi.png ${pkgdir}/usr/share/pixmaps || return 1
}
#category: network
# vim:set ts=2 sw=2 et:
