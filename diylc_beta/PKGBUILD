# Contributor: aggaZ <aggaz@paranoici.org>

pkgname=diylc_beta
pkgver=3.0.9
pkgrel=2
arch=('any')
pkgdesc="PCB, Perfboard and Stripboard drawing utility."
depends=('java-environment>=6' 'bash')
makedepends=('unzip')
url="http://diy-fever.com/index.php?project=software"
license=('GPL3')
source=(http://diy-layout-creator.googlecode.com/files/diylc-3.0.9-beta.zip)
md5sums=('25baebdbc2d68db6c3f921caaf959a5d')

build() {
  mkdir -p $pkgdir/usr/share/$pkgname
  rm $srcdir/log/*
  cp -R $srcdir/* $pkgdir/usr/share/$pkgname

  rm $pkgdir/usr/share/$pkgname/diylc.exe
  rm $pkgdir/usr/share/$pkgname/diylc-3.0.9-beta.zip
  chmod -x $pkgdir/usr/share/$pkgname/diylc*

  mkdir -p $pkgdir/usr/bin
  cat <<EOF > ${pkgdir}/usr/bin/$pkgname
#!/bin/bash
cd /usr/share/$pkgname
./run.sh
EOF
  chmod 755 ${pkgdir}/usr/bin/$pkgname
}

