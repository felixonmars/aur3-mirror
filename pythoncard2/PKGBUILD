# Maintainer: Yoel Lion <yoel3ster at gmail dot com>
# Last Maintainer: realitygaps <realitygaps@yahoo.com>
pkgname=pythoncard2
libname=pythoncard
pkgver=0.8.2
pkgrel=1
pkgdesc="PythonCard is a GUI construction kit for building cross-platform desktop applications on Windows, Mac OS X, and Linux, using the Python language."
url="http://pythoncard.sourceforge.net/"
license="BSD"
arch=('i686' 'x86_64')
depends=('wxpython')
source=(http://prdownloads.sourceforge.net/sourceforge/$libname/PythonCard-$pkgver.tar.gz)
md5sums=('109913b19baba90aff5c95949e5aa1ff')

build() {
  cd $srcdir/PythonCard-$pkgver
  python2 setup.py install --root=$pkgdir
  rm $pkgdir/usr/bin/install-pythoncard.py
  echo "#!/bin/bash" > $pkgdir/usr/bin/codeEditor
  echo "python2 /usr/lib/python2.7/site-packages/PythonCard/tools/codeEditor/codeEditor.py" > $pkgdir/usr/bin/codeEditor
  chmod +x $pkgdir/usr/bin/codeEditor
  echo "PythonCard" > $pkgdir/usr/lib/python2.7/site-packages/$libname.pth
}
