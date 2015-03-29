# Maintainer: Efstathios Iosifidis <iosifidis@opensuse.org>
# Maintainer: (aur) Panos Pitelos <pitepana@gmail.com>

pkgname=vamox-mate
pkgver=201
pkgrel=0
pkgdesc="Vamox MATE icon theme."
arch=('any')
url="https://vamox.blogspot.com"
license=('CC BY-SA 3.0')
options=(!strip)
source=(https://dl.dropboxusercontent.com/u/34503866/$pkgname-$pkgver.tar.gz)
sha256sums=('a0998f630f14e7368d227b8dfc4e1311c5ea7c638c1839b732e6d810a2228d75')
 
package() {
        cd "${srcdir}"
        #mv "${pkgname}-${pkgver}" "${pkgname}"
        
        #clean package
        pushd "${srcdir}/${pkgname}"
                rm "index (copia).theme" ".icon-theme.cache"
               # install -Dm644 "VAMOX_readme.txt" "$pkgdir"/usr/share/doc/$pkgname/README.txt
               # rm "VAMOX_readme.txt"
        popd
 
  install -d "${pkgdir}/usr/share/icons"
  cp -r "${pkgname}" "${pkgdir}/usr/share/icons"
}
