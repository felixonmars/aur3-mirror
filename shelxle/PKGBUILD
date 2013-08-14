# Maintainer: Jens Luebben jens.luebben@stud.uni-goettingen.de
# Author: Christian Huebschle http://ewald.ac.chemie.uni-goettingen.de/shelx/

pkgname=shelxle

pkgver=1.0.647

pkgrel=0

pkgdesc="A GUI for the X-ray data refinement program ShelXl using the QT4 framework."

url="http://ewald.ac.chemie.uni-goettingen.de/shelx/"

arch=('x86_64' 'i686')

license=('LGPLv2')

depends=('qt4')

source=("http://sourceforge.net/projects/shelxle/files/latest/download")

md5sums=('64294034e9ba85a613b1ec2eccc03985')


 

build() {

  cd "${srcdir}/"

  tar xvjf download
  cd shelxle-${pkgver}
  qmake-qt4
  make

}

 

package() {

  cd "${srcdir}/shelxle-${pkgver}/"
  make INSTALL_ROOT=$pkgdir install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

}

 

