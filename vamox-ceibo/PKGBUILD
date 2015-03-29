# Maintainer: Efstathios Iosifidis <iosifidis@opensuse.org>
# Maintainer: (aur) Panos Pitelos <pitepana@gmail.com>
 
pkgname=vamox-ceibo
pkgver=201
pkgrel=0
pkgdesc="Vamox Ceibo icon theme."
arch=('any')
url="https://vamox.blogspot.com"
license=('CC BY-SA 3.0')
options=(!strip)
source=(https://dl.dropboxusercontent.com/u/34503866/$pkgname-$pkgver.tar.gz)
sha256sums=('cb41411c6c33ab9145fdbf8ce8be0d7a768e6fb01790a044a21d4af4497da951')
 
package() {
        cd "${srcdir}"
        #mv "${pkgname}" "${pkgname}"
        
        #clean package
        pushd "${srcdir}/${pkgname}"
                rm "index (copia).theme" ".icon-theme.cache"
                #install -Dm644 "VAMOX_readme.txt" "$pkgdir"/usr/share/doc/$pkgname/README.txt
                #rm "VAMOX_readme.txt"
        popd
 
  install -d "${pkgdir}/usr/share/icons"
  cp -r "${pkgname}" "${pkgdir}/usr/share/icons"
}
