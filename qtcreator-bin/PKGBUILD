# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: thotypous <matiasΘarchlinux-br·org>
# Contributor: delor <bartekpiech gmail com>
pkgname=qtcreator-bin
pkgver=2.3.1
pkgrel=1
pkgdesc="Lightweight, cross-platform integrated development environment"
arch=('i686' 'x86_64')
url="http://trolltech.com/developer/qt-creator"
license=('GPL')
depends=('qt')
optdepends=('qt-doc: inline QT documentation' 'gdb: debugging')
provides=('qtcreator')
conflicts=('qtcreator')
options=(!strip docs)
install=qtcreator.install
[ "$CARCH" = "i686" ] && _arch=x86
[ "$CARCH" = "x86_64" ] && _arch=x86_64
source=(http://get.qt.nokia.com/qtcreator/qt-creator-linux-$_arch-opensource-$pkgver.bin \
        xdg-wrapper)
if [ "$CARCH" = "i686" ]; then
  md5sums=('5957eb6ef2169c8bef443d62aece490d'
           '3e2b31c72181b87149ff995e7202c0e3')
else
  md5sums=('1db826cc496727c2ac7603f7401e65ea'
           '3e2b31c72181b87149ff995e7202c0e3')
fi

build() {
  cd "$srcdir"
  install -m755 xdg-wrapper xdg-mime
  install -m755 xdg-wrapper xdg-desktop-menu
  install -m755 xdg-wrapper xdg-icon-resource
  export PATH="${srcdir}:$PATH"

  chmod 755 qt-creator-linux-$_arch-opensource-$pkgver.bin
  ./qt-creator-linux-$_arch-opensource-$pkgver.bin \
    --installdir "$pkgdir"/opt/qtcreator --mode unattended || true

  install -d -m755  "${pkgdir}"/usr/bin
  ln -s /opt/qtcreator/bin/qtcreator "${pkgdir}"/usr/bin
  install -D -m644 "${pkgdir}"/opt/qtcreator/bin/Nokia-QtCreator.desktop \
    "$pkgdir"/usr/share/applications/Nokia-QtCreator.desktop
  for _ICON in "${pkgdir}"/opt/qtcreator/bin/*.png; do
    _RES=${_ICON#*Nokia-QtCreator-}
    _RES=${_RES%.png}
    install -D -m644 $_ICON "$pkgdir"/usr/share/icons/hicolor/${_RES}x${_RES}/apps/Nokia-QtCreator.png
  done
  rm "$pkgdir"/opt/qtcreator/bin/uninstall
  rm "$pkgdir"/opt/qtcreator/bin/*.{desktop,png}
  rm -rf "$pkgdir"/opt/qtcreator/rollbackBackupDirectory
}

# vim:set ts=2 sw=2 et:
