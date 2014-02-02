# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=duo
pkgver=0.10
pkgrel=4
pkgdesc="Duo is a crazy eight / UNO card game"
url="https://launchpad.net/duo"
license=('GPL')
arch=('any')
depends=('gettext' 'python2-imaging' 'python2-pmw')
source=(http://launchpad.net/duo/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz
        duo.desktop
        duo.png)
md5sums=('802c4149be808eff493e1d214e8c5579'
         '13fbe6f5afff6f54ee608e52e5e1d48f'
         '9c2b33a078dad25e01d333dc4b219ef7')
install=duo.install

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 make-locale.py
  
  install -dm755 "${pkgdir}/usr/bin"
  echo "cd '/usr/share/duo/' && python2 duo.py" > "${pkgdir}/usr/bin/duo.sh"
  chmod 755 "${pkgdir}/usr/bin/duo.sh"
  
  install -dm755 "${pkgdir}/usr/share/"{duo,applications}
  cp -R * "${pkgdir}/usr/share/duo"
  find "${pkgdir}/usr/share/duo" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/duo" -type f -exec chmod 644 '{}' \;
  
  install -Dm644 "${srcdir}/duo.desktop" "${pkgdir}/usr/share/applications/duo.desktop"
  install -Dm644 "${srcdir}/duo.png" "${pkgdir}/usr/share/duo/duo.png"
}
