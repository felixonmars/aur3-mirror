# Mantainer: dmiranda at gmail dot com

pkgname=gtk-theme-zukimac
pkgver=2014.06.15
pkgrel=1
pkgdesc="A Mac OS X theme for gtk based on zuki. For GTK 3.12."
arch=('any')
url="http://gnome-look.org/content/show.php/Zukimac?content=165450"
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines')
_sourcefile=165450-Zukimac.tar.bz2
source=(http://gnome-look.org/CONTENT/content-files/165450-Zukimac.tar.bz2)
md5sums=('466a17d19ef04b4eb8a004bc3c3169ec ')

noextract=("${source[@]%%::*}")
_foldername=165450-Zukimac

package() {
	mkdir -p ${pkgdir}/usr/share/themes/
	mkdir "${_foldername}"
        tar xvf "${_sourcefile}" -C  "${_foldername}"
        cd "${_foldername}"
        chmod 775 -R *
       	cp -rv ${srcdir}/${_foldername}/* ${pkgdir}/usr/share/themes/
}
