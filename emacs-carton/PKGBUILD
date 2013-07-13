# Mantainer: Archan Paul <archan.paul@gmail.com>

pkgname=emacs-carton
_gitname=carton
pkgver=0.3.1
pkgrel=1
pkgdesc="Carton for Emacs is what Bundler is to Ruby. It aims to make ELPA dependency management in Emacs painless."
arch=(any)
conflicts=('emacs-carton')
provides=('emacs-carton')
url="https://github.com/rejeep/carton"
license=('GPLv3')
depends=('emacs')
makedepends=(git)
source=(git+https://github.com/rejeep/carton.git#tag=v${pkgver})

md5sums=('SKIP')
optdepends=()

package() {
  mkdir -p ${pkgdir}/usr/bin/
  install -Dm755 ${srcdir}/$_gitname/bin/carton ${pkgdir}/usr/bin/
}

