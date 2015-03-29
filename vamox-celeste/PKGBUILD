# Maintainer: Efstathios Iosifidis <iosifidis@opensuse.org>
# Maintainer: (aur) Panos Pitelos <pitepana@gmail.com>
 
pkgname=vamox-celeste
pkgver=201
pkgrel=0
pkgdesc="Vamox Celeste icon theme."
arch=('any')
url="https://vamox.blogspot.com"
license=('CC BY-SA 3.0')
options=(!strip)
source=(https://dl.dropboxusercontent.com/u/34503866/$pkgname-$pkgver.tar.gz)
sha256sums=('62c41d24c0f3fd1d3d00eb30e13375b89af8ca94dfadd0cee579386d7a88a792')
 
package() {
        cd "${srcdir}"
        #mv "${pkgname}-${pkgver}" "${pkgname}"
        
        #clean package
        pushd "${srcdir}/${pkgname}"
                rm "index (copia).theme" ".icon-theme.cache"
                #install -Dm644 "VAMOX_readme.txt" "$pkgdir"/usr/share/doc/$pkgname/README.txt
                #rm "VAMOX_readme.txt"
        popd
 
  install -d "${pkgdir}/usr/share/icons"
  cp -r "${pkgname}" "${pkgdir}/usr/share/icons"
}
