# Maintainer: Prometheus

pkgname=dark-australis-qupzilla-theme
pkgver=0.1
pkgrel=2
pkgdesc="Theme based on Firefox's Australis theme and nowrep's Qupzilla Chrome theme"
arch=('any')

if pacman -Qq qupzilla-git >/dev/null 2>&1; then
  depends=('qupzilla-git')
elif pacman -Qq qupzilla >/dev/null 2>&1; then
  depends=('qupzilla')
elif pacman -Qq qupzilla >/dev/null 2>&1; then
  depends=('qupzilla-qt4')  
elif pacman -Qq qupzilla-qt5 >/dev/null 2>&1; then
  depends=('qupzilla-qt5')
elif pacman -Qq qupzilla-qt5-git >/dev/null 2>&1; then
  depends=('qupzilla-qt5-git')
else
  depends=('qupzilla')
fi

optdepends=('oxygen-transparent-git')
url="https://github.com/PrometheusGit/${pkgname}"
license=('MPL')
source=(https://github.com/PrometheusGit/${pkgname}/archive/master.zip)
md5sums=('69886cb786e8898f9c08069b55a5e0c4')

package() {
  find ${pkgname}-master/ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/qupzilla/themes/{}" \;
}
