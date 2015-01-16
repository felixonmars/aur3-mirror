# Maintainer: lane.wiscombe[@]gmail.com
# Contributor: Ramon Buldó ramon@manjaro.org
 
pkgbase=menda-plasma-next-git
pkgname=(menda-git menda-kde4-git menda-plasma-desktop-git menda-plasma-look-and-feel-git sddm-menda-theme-git)
_pkgname=menda-plasma-next
pkgver=r32.dd73cbb
pkgrel=1
arch=('any')
groups=('menda-plasma-next-git')
provides=('menda-plasma-next')
replaces=('menda-plasma-next')
conflicts=('menda-plasma-next')
url="https://github.com/anexation/menda-plasma-next"
makedepends=('extra-cmake-modules' 'git' 'automoc4' 'ki18n' 'frameworkintegration' 'kdelibs')
source=("git+https://github.com/anexation/menda-plasma-next.git")
sha1sums=('SKIP')

pkgver() {
	cd ${srcdir}/menda-plasma-next
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_pkgname}/menda
  mkdir -p build
  mkdir -p build-kde4
}

build() {
  cd ${_pkgname}/menda/build
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


package_menda-git() {
  pkgdesc='Artwork, styles and assets for the Menda visual style for the Plasma 5 Desktop'
  arch=('i686' 'x86_64')
  license=('LGPL')
  depends=('frameworkintegration')
  provides=('menda')
  replaces=('menda')
  conflicts=('menda')
  optdepends=('menda-kde4-git: Menda widget style for KDE4 applications'
              'menda-themes: Menda theme for Gtk2, Gtk3, Metacity, Xfwm, Openbox, Cinnamon and GNOME Shell'
              'menda-themes-dark: Dark Menda theme for Gtk2, Gtk3, Metacity, Xfwm, Openbox, Cinnamon and GNOME Shell'
              'menda-circle-icon-theme: Menda Circle icon theme' 
              'menda-square-icon-theme: Menda Square icon theme')
  cd ${_pkgname}/menda/build
  make DESTDIR="${pkgdir}" install

# make QtCurve preset and color scheme available for KDE4 too
  install -d -m755 "${pkgdir}"/usr/share/apps/{QtCurve,color-schemes}
  ln -sr "${pkgdir}"/usr/share/QtCurve/Menda.qtcurve "${pkgdir}"/usr/share/apps/QtCurve
  ln -sr "${pkgdir}"/usr/share/color-schemes/Menda*.colors "${pkgdir}"/usr/share/apps/color-schemes  
}

package_menda-kde4-git() {
  pkgdesc='Menda widget style for KDE4 applications'
  arch=('i686' 'x86_64')
  license=('LGPL')
  depends=('kdelibs')
  provides=('menda-kde4')
  replaces=('menda-kde4')
  conflicts=('menda-kde4')  
  cd ${_pkgname}/menda/build-kde4
  make DESTDIR="${pkgdir}" install

# needed so that pure Qt4 apps are correctly themed
  install -dm755 "${pkgdir}"/usr/lib/qt4/plugins/styles
  ln -sr "${pkgdir}"/usr/lib/kde4/plugins/styles/menda.so "${pkgdir}"/usr/lib/qt4/plugins/styles
}

package_menda-plasma-desktop-git() {
  pkgdesc="Menda Theme for Plasma 5"
  arch=('any')
  license=('GPL3')
  depends=('plasma-desktop')
  provides=('menda-plasma-desktop')
  replaces=('menda-plasma-desktop')
  conflicts=('menda-plasma-desktop')  
  install -dm755 "${pkgdir}"/usr/share/plasma/desktoptheme
  cp -dr --no-preserve=ownership ${_pkgname}/menda-plasma-desktop/Menda "${pkgdir}"/usr/share/plasma/desktoptheme
}

package_menda-plasma-look-and-feel-git() {    
  pkgdesc="Menda Look and Feel Plugin for Plasma 5"
  arch=('any')
  license=('GPL3')
  depends=('plasma-desktop' 'menda-git' 'menda-kde4-git' 'menda-plasma-desktop-git' 'menda-circle-icon-theme' 'menda-square-icon-theme' 'sddm-menda-theme-git' 'xcursor-menda-git')
  provides=('menda-plasma-look-and-feel')
  replaces=('menda-plasma-look-and-feel')
  conflicts=('menda-plasma-look-and-feel')  
  install -dm755 "$pkgdir"/usr/share/plasma/look-and-feel
  cp -dr --no-preserve=ownership ${_pkgname}/menda-plasma-look-feel/org.kde.menda.desktop "$pkgdir"/usr/share/plasma/look-and-feel
}

package_sddm-menda-theme-git() {
  pkgdesc="Menda Theme for SDDM"
  arch=('any')
  license=('GPL3')
  depends=('sddm')
  provides=('sddm-menda-theme')
  replaces=('sddm-menda-theme')
  conflicts=('sddm-menda-theme')   
  install -dm755 "${pkgdir}"/usr/share/sddm/themes
  cp -dr --no-preserve=ownership $srcdir/${_pkgname}/menda-sddm/menda "${pkgdir}"/usr/share/sddm/themes
}
