# Maintainer: Knut Saua Mathiesen <knut at canutes dot net>
pkgname=clooj
pkgver=0.3.6
pkgrel=1
pkgdesc="An editor for clojure written in clojure."
arch=('any')
url="http://github.com/arthuredelstein/clooj/"
license=("EPL")
depends=('java-environment')
makedepends=()
optdepends=()
provides=('clooj')
conflicts=('clooj')
source=("clooj.jar::https://github.com/downloads/arthuredelstein/clooj/clooj-${pkgver}-standalone.jar"
	clooj
        clooj.desktop)
noextract=(clooj.jar)
sha256sums=('d8433e6d71dbf061af0e6ea861dee4f0191e004f6cf9c0461d9741dfa1129790'
            '1218a43219b66b847168e961b9b807db2069d8cceb292893627363adc720e636'
            '924656dea17cf9b7bb67d6afa11daefef81b9c99b9b1be71987ba75ed6baa8e9')

package() {
  cd ${srcdir}
  install -Dm755 clooj "$pkgdir/usr/bin/clooj"
  install -Dm644 clooj.jar "$pkgdir/usr/share/clooj/clooj.jar"
  install -Dm644 "$srcdir/clooj.desktop" \
    "$pkgdir/usr/share/applications/clooj.desktop"
}
