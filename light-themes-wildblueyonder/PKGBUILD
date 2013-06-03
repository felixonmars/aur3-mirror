# Maintainer: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
# Contributor: D. Can Celasun <dcelasun@gmail.com>

pkgname=light-themes-wildblueyonder
_pkgname=light-themes
pkgver=0.1.93
pkgrel=1
pkgdesc="Ubuntu 'light' themes (GTK2 and GTK3.8), with a slight colour variation."
arch=('i686' 'x86_64')
url="https://launchpad.net/light-themes/"
license=("CCPL")
depends=("gtk-engine-murrine" "ubuntu-mono" "gtk3" "gtk-engine-unico")
source=(https://launchpad.net/ubuntu/quantal/+source/${_pkgname}/${pkgver}/+files/${_pkgname}_${pkgver}.tar.gz
        #"http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/x11-themes/${_pkgname}/files/${_pkgname}-${pkgver}-gtk3.8-1.patch"
        #"http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/x11-themes/${_pkgname}/files/${_pkgname}-${pkgver}-gtk3.8-2.patch"
        #"http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/x11-themes/${_pkgname}/files/${_pkgname}-${pkgver}-gtk3.8-3.patch"
        ${_pkgname}-${pkgver}-gtk3.8-1.patch
        ${_pkgname}-${pkgver}-gtk3.8-2.patch
        ${_pkgname}-${pkgver}-gtk3.8-3.patch
        gtk2.patch gtk3.patch)
conflicts=(light-themes)

prepare () {
  cd "$srcdir"/${_pkgname}-${pkgver}/
  patch -Np0 -i ../${_pkgname}-0.1.93-gtk3.8-1.patch
  patch -Np0 -i ../${_pkgname}-0.1.93-gtk3.8-2.patch
  patch -Np0 -i ../${_pkgname}-0.1.93-gtk3.8-3.patch
  patch Ambiance/gtk-2.0/gtkrc -i "$srcdir/gtk2.patch"
  patch -Np0 -i "../gtk3.patch"
}

package () {
	mkdir -p "$pkgdir"/usr/share/themes/
	cd "$srcdir"/light-themes-${pkgver}/
	cp -r "Ambiance" "$pkgdir/usr/share/themes"
	cp -r "Radiance" "$pkgdir/usr/share/themes"
	sed -i -e "/shadow radius/d" "$pkgdir/usr/share/themes/Ambiance/metacity-1/metacity-theme-1.xml"
	sed -i -e "/shadow radius/d" "$pkgdir/usr/share/themes/Radiance/metacity-1/metacity-theme-1.xml"
	sed -i -e "/padding/d" "$pkgdir/usr/share/themes/Ambiance/metacity-1/metacity-theme-1.xml"
	sed -i -e "/padding/d" "$pkgdir/usr/share/themes/Radiance/metacity-1/metacity-theme-1.xml"

	sed -i -e "/trough/d" "$pkgdir/usr/share/themes/Ambiance/metacity-1/metacity-theme-1.xml"
	sed -i -e "/trough/d" "$pkgdir/usr/share/themes/Radiance/metacity-1/metacity-theme-1.xml"

}

md5sums=('57baa4b1ab33288e2f31454fe39be25c'
         '80e06c25d3b3ae4dc1e30eed06b3d31d'
         'd82d6ef1dd7b92f639cdd4cd915abce6'
         'fa275111d53bb381577405fab51f6c01'
         '82ca564f78217c88358fedc5003bf149'
         'b3808ebed9a637971a934646349cde69')
