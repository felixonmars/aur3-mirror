# Contributor: Filipp Andjelo <scorp@mauilueberfall.de>

pkgname=sleutel
pkgver=1.0
pkgrel=2
pkgdesc="Password manager based on Eclipse RCP"
arch=('i686' 'x86_64')
url="http://sleutel.sourceforge.net"
depends=('java-environment>=6' 'gtk2>=2.16.1')
install=sleutel.install
license=("Apache")
if [ "$CARCH" = "x86_64" ]; then
source=(http://downloads.sourceforge.net/project/sleutel/sleutel/${pkgver}/sleutel-${pkgver}-linux.gtk.x86_64.tgz
	sleutel.desktop
	sleutel.sh)
md5sums=('03b88020a3378c50872ab024cfb83f22'
         '5e3559906a4d74c3919cf0e8b3aa130f'
         '085d09d22326ef9a882fb8353d49c085')
else
source=(http://downloads.sourceforge.net/project/sleutel/sleutel/${pkgver}/sleutel-${pkgver}-linux.gtk.x86.tgz
	sleutel.desktop
	sleutel.sh)
md5sums=('d0158acb305a2fc69ec6a566a1db9392'
         '5e3559906a4d74c3919cf0e8b3aa130f'
         '085d09d22326ef9a882fb8353d49c085')
fi

build() {
  cd "${srcdir}/sleutel" || return 1

  # install eclipse
  install -m755 -d "${pkgdir}/usr/share"
  mv "${srcdir}/sleutel" "${pkgdir}/usr/share/" || return 1

  # install misc
  mkdir -p ${pkgdir}/usr/bin ${pkgdir}/usr/share/applications \
    ${pkgdir}/usr/share/icons/hicolor/48x48/apps || return 1
  install -m755 "${srcdir}/sleutel.sh" "${pkgdir}/usr/bin/sleutel" || return 1
  install -m644 "${srcdir}/sleutel.desktop" "${pkgdir}/usr/share/applications/" || return 1
  ln -s /usr/share/sleutel/icon.xpm \
    "${pkgdir}/usr/share/icons/hicolor/48x48/apps/sleutel.xpm" || return 1
}

