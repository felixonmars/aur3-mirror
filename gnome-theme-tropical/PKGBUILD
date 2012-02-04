# Contributor: Jib <jbc.as (AT) free.fr>
# Last update: 01/26/11

pkgname=gnome-theme-tropical
_pkgname=tropical-theme
pkgver=1.7.1
pkgrel=2
pkgdesc="Tropical theme for Gnome."
arch=(any)
license=('GPL')
depends=('gtk-engine-murrine>=0.98' 'xcursor-vanilla-dmz')
optdepends=('slim-theme-tropical: matching theme for slim login manager')
install=tropical.install
source=(https://launchpad.net/~bisigi/+archive/ppa/+files/tropical-theme_1.7.1.maverick.ppa2+nmu1.tar.gz
        tropical.patch)
url="http://www.bisigi-project.org"
md5sums=('0b45cd81dc26396147ced13900a0e016'
         'b37498861dcd33467a63701f0bb53f4e')

build() {
   cd ${srcdir}/${_pkgname}
   # install dirs
   install -d ${pkgdir}/usr/share/{themes,icons,pixmaps/backgrounds/gnome/nature,gnome-background-properties,emerald/themes,doc/bisigi/tropical}
   #GTK theme
   tar -xzf Gtk/tropical.tar.gz -C Gtk/
   #Icons theme
   tar -xjf Icons/tropical.tar.bz2 -C Icons/
   cd Icons/tropical/scalable/actions
   ln -s system-shutdown-panel.svg system-shutdown.svg
   cd ../../../..
   #Emerald theme
   mkdir Emerald/tropical
   tar -xzf Emerald/Tropical.emerald -C Emerald/tropical/
   # install files
   patch -Np0 <${srcdir}/tropical.patch
   cp -R Gtk/tropical/ ${pkgdir}/usr/share/themes/
   cp -R Icons/tropical/ ${pkgdir}/usr/share/icons
   install -D -m644 Wallpaper/{Naturelle-leaf.jpg,Naturelle_leaf_4-3.jpg} ${pkgdir}/usr/share/pixmaps/backgrounds/gnome/nature/
   install -D -m644 Wallpaper/tropical-wallpaper.xml ${pkgdir}/usr/share/gnome-background-properties
   cp -R Emerald/tropical ${pkgdir}/usr/share/emerald/themes/
   install -D -m644 credits ${pkgdir}/usr/share/doc/bisigi/tropical/credits.txt
}

