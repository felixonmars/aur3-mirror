# Maintainer:  danyf90 <daniele.formihelli@gmail.com>
# Contributor: totoloco <totoloco@gmx.com>

pkgname=sigram
pkgver=0.5.5
pkgrel=1
pkgdesc="A different telegram client from Sialan.labs"
arch=('i686' 'x86_64')
url="http://labs.sialan.org/projects/sigram"
license=('GPL')
depends=('qt5-base' 'qt5-declarative')
if [[ $CARCH == x86_64 ]]; then
  source=("http://dl.labs.sialan.org/sigram_$pkgver-x64.tar.xz")
  sha512sums=('1358d4a48a1079e043c01fb05492876ade1bd06802519af53bbc85912fe9cf506b74ace5a369f0219265e6677788ba5ceabadba14da7adc16d1211784bda281a')
else
  source=("http://dl.labs.sialan.org/sigram_$pkgver-x32.tar.xz")
  sha512sums=('ac195503b3e62205327c39fb38b6b0a7fd36ddc0012f33243281641af8a2ef68418ef2928b201d14bb15384eb0472f2c17fd43ad92524199c1cbdcdc222d0d59')
fi

package() {
  cd $srcdir

  install -d $pkgdir/{opt,usr/bin}
  mv $pkgname $pkgdir/opt/sigram

  ln -s /opt/sigram/Sigram $pkgdir/usr/bin/sigram
}