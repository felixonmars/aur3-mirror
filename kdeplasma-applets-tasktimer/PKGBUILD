# Contributor: Martín Cigorraga <msx@archlinux.us>
pkgname=kdeplasma-applets-tasktimer
pkgver=0.4
pkgrel=1
pkgdesc="This is a very simple plasmoid to keep track of your time."
arch=(any)
url="http://kde-apps.org/content/show.php/Task+Timer?content=125922"
depends=('kdebase-workspace')
license=('GPL')
provides=('kdeplasma-applets-tasktimer')
conflicts=('kdeplasma-applets-tasktimer' 'kdebase-workspace')
install=tasktimer.install
source=(https://www.dropbox.com/s/43k7fnqv1etk1qn/125922-tasktimer.plasmoid)
sha256sums=('50333763e8678c2d1d06a1629e66a22c12cf81184116868a68b86dfa431553e1')

build() {
    msg "Unzipping..."
}

package() {
  install_folder="${pkgdir}/usr/share/apps/plasma/plasmoids/tasktimer/"

  install -d "${install_folder}"/contents/
  install -d "${install_folder}"/contents/{code,config,images,locale,_ui}
  install -d "${pkgdir}/usr/kde4"
  install -d "${pkgdir}/usr/kde4/services"
  
  install -m644 ${srcdir}/contents/code/SettingsConfig.py "${install_folder}"/contents/code/
  install -m644 ${srcdir}/contents/code/Task.py "${install_folder}"/contents/code/
  install -m644 ${srcdir}/contents/code/TaskConfig.py "${install_folder}"/contents/code/
  install -m755 ${srcdir}/contents/code/compileUI.sh "${install_folder}"/contents/code/
  install -m644 ${srcdir}/contents/code/config_ui.py "${install_folder}"/contents/code/
  install -m644 ${srcdir}/contents/code/settings_ui.py "${install_folder}"/contents/code/
  install -m644 ${srcdir}/contents/code/tasktimer.py "${install_folder}"/contents/code/

  install -m644 ${srcdir}/contents/config/main.xml "${install_folder}"/contents/config/
  install -m644 ${srcdir}/contents/config/default-configrc "${install_folder}"/contents/config/

  install -m644 ${srcdir}/contents/_ui/config.ui "${install_folder}"/contents/_ui/
  install -m644 ${srcdir}/contents/_ui/settings.ui "${install_folder}"/contents/_ui/

  install -m644 ${srcdir}/metadata.desktop "${install_folder}"
  
  install -Dm644 ${srcdir}/metadata.desktop \
    "${pkgdir}"/usr/share/kde4/services/plasma-applet-tasktimer.desktop
}
