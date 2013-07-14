# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributer: rpj8 (Factory) <semidigerati@gmail.com>

pkgname=shoddybattle
pkgver=1
pkgrel=1
pkgdesc="Shoddy Battle is the most popular pokemon simulator, a program that allows you to play pokemon matches with other people over the internet."
arch=('any')
url="http://pokemonlab.com"
license=('AGPL')
depends=(java-runtime)
source=(http://pokemonlab.com/client/$pkgname.jnlp)
md5sums=('d43cc35c34961f2576900ab0c7373e55')

package() {
  cd "$srcdir"
  install -D ${pkgname}.jnlp ${pkgdir}/usr/share/shoddybattle/${pkgname}.jnlp
  mkdir -p ${pkgdir}/usr/bin/
  echo -e "#!/bin/bash\njavaws /usr/share/${pkgname}/${pkgname}.jnlp" > ${pkgdir}/usr/bin/shoddybattle
  chmod +x ${pkgdir}/usr/bin/shoddybattle
}
