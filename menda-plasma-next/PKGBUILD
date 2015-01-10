# Maintainer: Ramon Buldó ramon@manjaro.org
# Contributor: anex <assassin.anex[@]gmail.com>
 
pkgbase=menda-plasma-next
pkgname=(menda menda-kde4 menda-plasma-desktop menda-plasma-look-and-feel sddm-menda-theme)
pkgver=20150108
pkgrel=1
arch=('any')
groups=('menda-plasma-next')
url="https://github.com/anexation/menda-plasma-next"
makedepends=('extra-cmake-modules' 'git' 'automoc4' 'ki18n' 'frameworkintegration' 'kdelibs')
source=("git+https://github.com/anexation/menda-plasma-next.git")
sha1sums=('SKIP')

pkgver() {
  cd ${pkgbase}
  printf "%s"$(git log -1 --format="%cd" --date=short | sed 's/-//g')
}

prepare() {
  cd ${pkgbase}/menda  
  mkdir -p build
  mkdir -p build-kde4
}

build() {
  cd ${pkgbase}/menda/build
  cmake ../menda \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DQML_INSTALL_DIR=lib/qt/qml \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
  
  cd ../build-kde4
  cmake ../menda \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_KDE4=ON \
    -DBUILD_TESTING=OFF
  make  
}


package_menda() {
  pkgdesc='Artwork, styles and assets for the Menda visual style for the Plasma 5 Desktop'
  arch=('i686' 'x86_64')
  license=('LGPL')
  depends=('frameworkintegration')
  optdepends=('menda-kde4: Menda widget style for KDE4 applications'
              'menda-themes: Menda theme for Gtk2, Gtk3, Metacity, Xfwm, Openbox, Cinnamon and GNOME Shell'
              'menda-themes-dark: Dark Menda theme for Gtk2, Gtk3, Metacity, Xfwm, Openbox, Cinnamon and GNOME Shell'
              'menda-circle-icon-theme: Menda Circle icon theme' 
              'menda-square-icon-theme: Menda Square icon theme'
              'xcursor-menda: Menda cursor theme')
  cd ${pkgbase}/${pkgname}/build
  make DESTDIR="${pkgdir}" install

# make QtCurve preset and color scheme available for KDE4 too
  install -d -m755 "${pkgdir}"/usr/share/apps/{QtCurve,color-schemes}
  ln -sr "${pkgdir}"/usr/share/QtCurve/Menda.qtcurve "${pkgdir}"/usr/share/apps/QtCurve
  ln -sr "${pkgdir}"/usr/share/color-schemes/Menda*.colors "${pkgdir}"/usr/share/apps/color-schemes  
}

package_menda-kde4() {
  pkgdesc='Menda widget style for KDE4 applications'
  arch=('i686' 'x86_64')
  license=('LGPL')
  depends=('kdelibs')
  cd ${pkgbase}/menda/build-kde4
  make DESTDIR="${pkgdir}" install

# needed so that pure Qt4 apps are correctly themed
  install -dm755 "${pkgdir}"/usr/lib/qt4/plugins/styles
  ln -sr "${pkgdir}"/usr/lib/kde4/plugins/styles/menda.so "${pkgdir}"/usr/lib/qt4/plugins/styles
}

package_menda-plasma-desktop() {
  pkgdesc="Menda Theme for Plasma 5"
  arch=('any')
  license=('GPL3')
  depends=('plasma-desktop')
  install -dm755 "${pkgdir}"/usr/share/plasma/desktoptheme
  cp -dr --no-preserve=ownership ${pkgbase}/${pkgname}/Menda "${pkgdir}"/usr/share/plasma/desktoptheme
}

package_menda-plasma-look-and-feel() {    
  pkgdesc="Menda Look and Feel Plugin for Plasma 5"
  arch=('any')
  license=('GPL3')
  depends=('plasma-desktop' 'menda' 'menda-kde4' 'menda-plasma-desktop' 'menda-circle-icon-theme' 'menda-square-icon-theme' 'sddm-menda-theme' 'xcursor-menda')
  install -dm755 "$pkgdir"/usr/share/plasma/look-and-feel
  cp -dr --no-preserve=ownership ${pkgbase}/menda-plasma-look-feel/org.kde.menda.desktop "$pkgdir"/usr/share/plasma/look-and-feel
}

package_sddm-menda-theme() {
  pkgdesc="Menda Theme for SDDM"
  arch=('any')
  license=('GPL3')
  depends=('sddm')
  install -dm755 "${pkgdir}"/usr/share/sddm/themes
  cp -dr --no-preserve=ownership $srcdir/${pkgbase}/menda-sddm/menda "${pkgdir}"/usr/share/sddm/themes
}

