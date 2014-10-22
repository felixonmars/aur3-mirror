# Maintainer: Filip Brcic <brcha@gna.org>

pkgname=octopi-frameworks-git
pkgver=0.5.0_692.349b8e5
pkgrel=1
pkgdesc="A powerful Pacman frontend using Qt libs (Qt5 & KF5 build)"
arch=('i686' 'x86_64')
url="https://github.com/aarnt/octopi"
license=('GPL2')
install=$pkgname.install
makedepends=('automoc4' 'cmake' 'git')
depends=('qt5-base' 'knotifications')
provides=('octopi' 'octopi-notifier' 'octopi-repoeditor')
conflicts=('octopi' 'octopi-notifier' 'octopi-repoeditor' 'oktopi-git')
source=("${pkgname}::git://github.com/aarnt/octopi.git"
        'octopi-repoeditor.desktop')
sha256sums=('SKIP'
            '131f16745df685430db55e54ede6da66aed9b02ca00d6d873a002b2a3e1c90ef')

pkgver() {
  cd ${srcdir}/${pkgname}
  _basever=$(grep pkgver PKGBUILD | awk -F= -- '{print $2}')
  echo ${_basever}_$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
  #git log -1 --format='%cd.%h' --date=short | tr -d -
  #git describe --always | sed 's|-|_|g' | sed 's|^v||'
}


build() {
  msg "Building octopi..."
  cd ${srcdir}/${pkgname}
  qmake-qt5 octopi.pro 
  make

  msg "Building pacmanhelper..."
  cd ${srcdir}/${pkgname}/notifier/pacmanhelper
  qmake-qt5 pacmanhelper.pro
  make
  
  msg "Building octopi-notifier..."
  cd ${srcdir}/${pkgname}/notifier/octopi-notifier
  qmake-qt5 octopi-notifier.pro 'DEFINES+=KSTATUS'
  make
    
  msg "Building octopi-repoeditor..."
  cd ${srcdir}/${pkgname}/repoeditor
  qmake-qt5 repoeditor.pro
  make
}

package() {
  # Octopi
  cd "${srcdir}/${pkgname}"

  install -D -m755 "${srcdir}/${pkgname}/bin/octopi" "${pkgdir}/usr/bin/octopi"
  install -D -m644 "${srcdir}/${pkgname}/octopi.desktop" "${pkgdir}/usr/share/applications/octopi.desktop"
  install -D -m644 "${srcdir}/${pkgname}/resources/images/octopi_green.png" "${pkgdir}/usr/share/icons/octopi.png"
  install -D -m644 "${srcdir}/${pkgname}/resources/images/octopi_green.png" "${pkgdir}/usr/share/icons/gnome/32x32/apps/octopi.png"
  install -D -m644 "${srcdir}/${pkgname}/resources/images/octopi_red.png" "${pkgdir}/usr/share/icons/octopi_red.png"
  install -D -m644 "${srcdir}/${pkgname}/resources/images/octopi_yellow.png" "${pkgdir}/usr/share/icons/octopi_yellow.png"

  #Pacmanhelper service files
  install -D -m755 "${srcdir}/${pkgname}/notifier/bin/pacmanhelper" "${pkgdir}/usr/lib/octopi/pacmanhelper"

  install -D -m644 "${srcdir}/${pkgname}/notifier/pacmanhelper/polkit/org.octopi.pacman.policy" "${pkgdir}/usr/share/polkit-1/actions/org.octopi.pacman.policy"
  install -D -m644 "${srcdir}/${pkgname}/notifier/pacmanhelper/polkit/org.octopi.pacmanhelper.conf" "${pkgdir}/etc/dbus-1/system.d/org.octopi.pacmanhelper.conf"
  install -D -m644 "${srcdir}/${pkgname}/notifier/pacmanhelper/polkit/org.octopi.pacmanhelper.xml" "${pkgdir}/usr/share/dbus-1/interfaces/org.octopi.pacmanhelper.xml"
  install -D -m644 "${srcdir}/${pkgname}/notifier/pacmanhelper/polkit/org.octopi.pacmanhelper.service" "${pkgdir}/usr/share/dbus-1/system-services/org.octopi.pacmanhelper.service"

  # Octopi notifier
  install -D -m755 "${srcdir}/${pkgname}/notifier/bin/octopi-notifier" "${pkgdir}/usr/bin/octopi-notifier"
  install -D -m644 "${srcdir}/${pkgname}/octopi-notifier.desktop" "${pkgdir}/usr/share/applications/octopi-notifier.desktop"
  install -D -m644 "${srcdir}/${pkgname}/octopi-notifier.desktop" "${pkgdir}/etc/xdg/autostart/octopi-notifier.desktop"

  # Repoeditor
  install -D -m755 "${srcdir}/${pkgname}/repoeditor/bin/octopi-repoeditor" "${pkgdir}/usr/bin/octopi-repoeditor"
  install -D -m644 "${srcdir}/octopi-repoeditor.desktop" "${pkgdir}/usr/share/applications/octopi-repoeditor.desktop"
  install -D -m644 "${srcdir}/${pkgname}/resources/images/octopi_red.png" "${pkgdir}/usr/share/icons/octopi-repoeditor.png"
}
