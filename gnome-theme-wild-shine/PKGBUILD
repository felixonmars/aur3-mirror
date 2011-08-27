# Contributor: Jib <jbc.as (AT) free.fr>
# Last update: 01/22/11

pkgname=gnome-theme-wild-shine
_pkgname=wild-shine-theme
pkgver=1.5.1
pkgrel=2
pkgdesc="Wild-Shine theme for Gnome."
arch=(any)
license=('GPL')
depends=('gtk-engine-murrine>=0.98')
optdepends=('slim-theme-wild-shine: matching theme for slim login manager')
source=(https://launchpad.net/~bisigi/+archive/ppa/+files/wild-shine-theme_1.5.1.maverick.ppa2+nmu1.tar.gz
        arch-icon.svg
        wild-shine.patch)
install=('wild-shine.install')
url="http://www.bisigi-project.org"
md5sums=('11ccb938db9243a8768e1ffdabd42901'
         '7e749ffb77988ddba93a460942cd7a59' 
         '02fc600bd2c6f8abe0471298e765e082')

package() {
   cd ${srcdir}/${_pkgname}
   # install dirs 
   install -d ${pkgdir}/usr/share/{themes,icons,pixmaps/backgrounds/gnome/nature,gnome-background-properties,emerald/themes,doc/bisigi/wild-shine}
   tar -xzf Gtk/wild-shine.tar.gz -C Gtk/
   echo "Unpacking icons..."
   tar -xjf Icons/wild-shine.tar.bz2 -C Icons/
   rm -f Icons/wild-shine/index.theme~
   install -D -m644 ${startdir}/arch-icon.svg Icons/wild-shine/scalable/places/distributor-logo.svg
   install -D -m644 ${startdir}/arch-icon.svg Icons/wild-shine/scalable/places/gnome-main-menu.svg
   install -D -m644 ${startdir}/arch-icon.svg Icons/wild-shine/scalable/places/start-here.svg
   cd Icons/wild-shine/scalable/actions
   ln -s system-shutdown-panel.svg system-shutdown.svg
   cd ../../../..
   mkdir Emerald/wild-shine
   tar -xzf Emerald/wild_shine.emerald -C Emerald/wild-shine
   # install
   patch -Np0 <${srcdir}/wild-shine.patch
   cp -R Gtk/wild-shine/ ${pkgdir}/usr/share/themes/
   cp -R Icons/wild-shine/ ${pkgdir}/usr/share/icons
   install -D -m644 Wallpaper/wild_shine.png ${pkgdir}/usr/share/pixmaps/backgrounds/gnome/nature/
   install -D -m644 Wallpaper/wild-shine-wallpaper.xml ${pkgdir}/usr/share/gnome-background-properties
   cp -R Emerald/wild-shine ${pkgdir}/usr/share/emerald/themes/
   install -D -m644 credits.txt ${pkgdir}/usr/share/doc/bisigi/wild-shine/
}
