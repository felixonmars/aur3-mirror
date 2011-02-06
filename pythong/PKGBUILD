# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=pythong
pkgver=2.1.5
pkgrel=1
pkgdesc="A graphic enviroment to program in python."
depends=('python' 'tk')
source=(http://www3.uji.es/~dllorens/downloads/pythong/linux/$pkgname.tgz)
url="http://www3.uji.es/~dllorens/PythonG/"

md5sums=('2ef168a7e8cc01ec3f51baaeca36f1d5')

build() {
  mkdir -p $startdir/pkg{/opt/pythong/,/usr/bin/}
  cp -R $startdir/src/pythonG-2_1_5/* $startdir/pkg/opt/pythong/

  # Create the pythong wrapper
  touch $startdir/pkg/usr/bin/pythong
  echo "#!/bin/sh" > $startdir/pkg/usr/bin/pythong
  echo "cd /opt/pythong" >> $startdir/pkg/usr/bin/pythong
  echo "python pythong.py" >> $startdir/pkg/usr/bin/pythong

  # Giving it the permission to execute
  chmod +x $startdir/pkg/usr/bin/pythong
}
