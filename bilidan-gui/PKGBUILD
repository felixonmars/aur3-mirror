pkgname=bilidan-gui
pkgver=2
pkgrel=2
pkgdesc="Play videos on Bilibili.com using MPV and Danmaku2ASS"
url="https://github.com/m13253/BiliDan"
arch=('any')
license=('ZLIB')
depends=('bash' 'bilidan-git' 'xterm' 'zenity')
source=('hg+https://bitbucket.org/butangmucat/bilidan-gui')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo $(hg identify -n)
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 bilidan-gui.sh ${pkgdir}/usr/bin/bilidan-gui
  install -Dm644 bilidan-gui.desktop ${pkgdir}/usr/share/applications/bilidan-gui.desktop
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}

# vim:set ts=2 sw=2 et:
