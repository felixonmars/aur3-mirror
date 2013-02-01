# Contributor: Sebastien Binet binet-at-cern-ch
pkgname=stratuslab-cli-user
pkgver=2.8
pkgrel=1
pkgdesc="StratusLab is developing a complete, open-source cloud distribution that allows grid and non-grid resource centers to offer and to exploit an “Infrastructure as a Service” cloud."
arch=('any')
url="http://stratuslab.eu"
license=('Apache')
depends=(python2 java-environment)
source=(http://yum.stratuslab.eu/releases/centos-6.2/stratuslab-cli-user-pkg-${pkgver}.tar.gz stratuslab-cli-setup.sh)
md5sums=('b9e4f8fb5c9de9a5e6887aafebfc7ed9'
         'af294aca5f687a372e67b5c72542a1dd')

build() {

  cd $startdir/src

  mkdir -p $startdir/pkg/opt/stratuslab

  sed -i 's@/usr/bin/env python@/usr/bin/env python2@g' {bin/stratus-*,lib/stratuslab/python/stratuslab/*.py}
  sed -i 's@/usr/bin/python@/usr/bin/python2@g' lib/stratuslab/python/stratuslab/web/*.py

  /bin/cp -rp {bin,conf,java,lib,share,windows} $startdir/pkg/opt/stratuslab/.

  /bin/cp ../stratuslab-cli-setup.sh $startdir/pkg/opt/stratuslab/setup.sh
  chmod a+x $startdir/pkg/opt/stratuslab/setup.sh


}

