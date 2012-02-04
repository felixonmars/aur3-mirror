# pkgbuild made by cantabile <cantabile dot desu at gmail dot com>

pkgname='alawalk'
pkgver=0.4.3
pkgrel=1
pkgdesc="A small launcher and utility for Linux systems"
arch=('any')
url="http://www.alawalk.tk/"
license=('GPL2')
depends=('bash' 'zenity' 'gxmessage' 'gksu' 'xclip' 'sed' 'xterm' 'curl' 'xorg-apps' 'wget' 'tar' 'bzip2' 'gzip' 'xz' 'unzip' 'p7zip' 'rar' 'bc')
makedepends=('sed')
#optdepends=()
#backup=()
#options=()
install="${pkgname}.install"
source=(http://dl.dropbox.com/u/1595125/${pkgname}/packages/${pkgname}_${pkgver}.tar.gz)

build() {
  cd "$srcdir/$pkgname"
  
  # it's gxmessage in arch linux
  sed -i 's/gmessage/gxmessage/g' ${pkgname}.sh

  # fix the paths in alawalk.desktop
  sed -i 's:Icon\[en_US\]=.*:Icon\[en_US\]=/usr/share/alawalk/icons/alawalk\.png:' ${pkgname}.desktop
  sed -i 's:Icon=.*:Icon=/usr/share/alawalk/icons/alawalk\.png:' ${pkgname}.desktop
}

package() {
  cd "$srcdir/$pkgname"

  # the following commands do pretty much what the _installcli() function in install.sh would do

  # create the folders
  install -d ${pkgdir}/usr/share/${pkgname}/icons
  install -d ${pkgdir}/usr/share/applications
  install -d ${pkgdir}/usr/bin

  # install the icon
  install -m644 ./icons/${pkgname}.png ${pkgdir}/usr/share/${pkgname}/icons/${pkgname}.png

  # install the main executable
  install -m755 ./${pkgname}.sh ${pkgdir}/usr/share/${pkgname}/${pkgname}
  install -m755 ./${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}

  # install the install.sh script - this should die
  install -m755 ./install.sh ${pkgdir}/usr/share/${pkgname}/install.sh

  # install the .desktop file
  install -m644 ./${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

  # install the README
  install -m644 ./README ${pkgdir}/usr/share/${pkgname}/README
}

md5sums=('cad620db1a4d820c579ab7a300061b09')
# vim:set ts=2 sw=2 et:
