# Maintainer: Tim Hartman <tbhartman@gmail.com>

pkgname=python-pypdf-git
pkgver=20111221
pkgrel=1
pkgdesc="A Pure-Python library built as a PDF toolkit"
arch=('any')
url="http://pybrary.net/pyPdf"
license=('BSD')
depends=('python')
#conflicts=('pypdf')
#provides=('pypdf')
#source=(http://pybrary.net/pyPdf/pyPdf-$pkgver.tar.gz 
#	license.txt)
#md5sums=('7a75ef56f227b78ae62d6e38d4b6b1da'
#         '19b1b4bc0a9a8c4b7b2f5689a16cec2c')

_gitroot="git://github.com/mfenniak/pyPdf.git"
_gitname="pyPdf"

build() {
    cd ${srcdir}

    msg "Connecting to GIT server...."
   
    if [ -d .git ]; then
      git pull
    else
      git clone $_gitroot .
      git checkout -t origin/py3
    fi
  
    msg "GIT checkout done or server timeout"
    msg "Starting build..."
    
    python setup.py install --root=${pkgdir}
    install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

