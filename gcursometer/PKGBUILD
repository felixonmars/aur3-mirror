# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=gcursometer
pkgver=0.2.1
pkgrel=2
pkgdesc="GCursometer is a GNOME panel applet like the network-manager-applet"
arch=('i686' 'x86_64')
url="http://antoinexp.free.fr/projects/gcursometer/index.php"
license=('GPL')
depends=('libx11' 'gnome-applets')
makedepends=('gcc' 'libpanelappletmm')
source=(http://antoinexp.free.fr/download//GCursometer-$pkgver-2.tar.gz)

build()
{
   cd "${srcdir}/${pkgname}"
   make || return 1
   # Icons
   install -Dm644 ${srcdir}/${pkgname}/GCMicon16.png $pkgdir/usr/share/pixmaps/GCMicon16.png || return 1
   install -Dm644 ${srcdir}/${pkgname}/GCMicon32.png $pkgdir/usr/share/pixmaps/GCMicon32.png || return 1
   install -Dm644 ${srcdir}/${pkgname}/GCMicon48.png $pkgdir/usr/share/pixmaps/GCMicon48.png || return 1
   # Bin
   install -Dm755 ${srcdir}/${pkgname}/core/gcursometer $pkgdir/usr/bin/gcursometer || return 1
   # Lib
   install -Dm644 ${srcdir}/${pkgname}/applet/gcursometer.server $pkgdir/usr/lib/bonobo/servers/gcursometer.server || return 1
   install -Dm755 ${srcdir}/${pkgname}/applet/gcursometer $pkgdir/usr/lib/gnome-applets/gcursometer || return 1

   

}

md5sums=('56517ef141047387686c10fb9bcf920a')
