# Maintainer: desperat <yoshibz at gmail dot com>

pkgname=pychomik
pkgver=0.5.1
pkgrel=1
pkgdesc="Uplading directories and/or files to http://chomikuj.pl. Type chomik -h for help"
arch=('i686' 'x86_64')
url="http://chomikuj.pl/adam_gr/ChomikUploader"
license=('LGPL')
#depends=('')
#optdepends=('')
#install="$pkgname.install"
source=("http://dl.dropbox.com/u/3218906/AUR/$pkgname/chomikUploader-$pkgver.zip")
md5sums=('7e3d6b4d2b3e427c18af52e7fe0de78b')

build() {
  cd "$srcdir/chomikUploader-$pkgver"

  export PYTHON="python2"
  sed -i "s|env python|&2|" `grep -Erl "env python" .`

  python2 setup.py build
}

package() {
  cd "$srcdir/chomikUploader-$pkgver"

  python2 setup.py install --prefix=/usr --root="$pkgdir/"
  alias pychomik='chomik' 
}