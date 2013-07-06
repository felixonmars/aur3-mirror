# Maintainer: Johannes Löthberg <demizide@gmail.com>

pkgname=sv-dvorak-extended
pkgver=1
pkgrel=1
pkgdesc="An extended Swedish Dvorak keyboard layout."
arch=(any)
url="http://github.com/kyrias/sv-dvorak-extended"
license=('GPL')
depends=('xorg-server')
makedepends=('git')
install='sv-dvorak-extended.install'
source=('git+https://github.com/kyrias/sv-dvorak-extended.git'
        'sv-dvorak-extended.install')
md5sums=('SKIP'
         '0103cae034454383b00e36f3abd1fd9c')

package() {  
  mkdir -p ${pkgdir}/usr/share/X11/xkb/symbols/
  install -Dm644 ${srcdir}/${pkgname}/sv-dvorak-extended ${pkgdir}/usr/share/X11/xkb/symbols/sv-dvorak-extended
}
