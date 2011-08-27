# Maintainer : Gadget3000 <gadget3000 at msn dot com>
# Contributor: Emanuele Rossi <newdna1510@yahoo.it>

pkgname=smbriscola
pkgver=1.0
pkgrel=2
pkgdesc="Italian Card Game named Briscola in python interface"
url="http://vela.studiomasson.it/software/svago/briscola"
license=('GPL')
arch=('any')
depends=('python2' 'wxpython')
source=('http://vela.studiomasson.it/software/svago/briscola/download/smbriscola-smcarte.tgz')
md5sums=('c53d45e1c11b992942f6f57beb87f1c7')

build() {
  cd ${srcdir}/smbriscola
  echo "#!/bin/bash" > briscola
  echo "cd /usr/share/smbriscola/" >> briscola
  echo "python2 briscola.py" >> briscola
  chmod +x briscola
  mkdir -p ${pkgdir}/usr/share/smbriscola
  cp -R * ${pkgdir}/usr/share/smbriscola
  mkdir -p ${pkgdir}/usr/bin
  ln -sf /usr/share/smbriscola/briscola ${pkgdir}/usr/bin/smbriscola
}
