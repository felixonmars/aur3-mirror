pkgname=wine-mono-bin
pkgver=0.0.8
pkgrel=1
epoch=1
pkgdesc="Open-source and cross-platform implementation of the .NET Framework for Wine."
arch=('any')
url="http://wiki.winehq.org/Mono"
license=('custom')
depends=('wine>=1.5.6')
conflicts=('wine-mono')
provides=('wine-mono')
source=("COPYING" "http://sourceforge.net/projects/wine/files/Wine%20Mono/${pkgver}/wine-mono-${pkgver}.msi")
md5sums=('2c0bd42c7e94ca6343027bd66282ff8f'
         'a79eb547bcb562aea5c7096bc97fff11')

package() {
  install -Dm644 ${srcdir}/COPYING ${pkgdir}/usr/share/licenses/wine-mono/LICENSE
  install -Dm644 ${srcdir}/wine-mono-${pkgver}.msi ${pkgdir}/usr/share/wine/mono/wine-mono-${pkgver}.msi
}
