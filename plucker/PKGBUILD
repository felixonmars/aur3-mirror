pkgname=plucker
pkgver=1.8
pkgrel=6
pkgdesc="Plucker is an offline Web and e-book viewer for PalmOS based handheld devices and PDAs."
url="http://www.plkr.org/"
license=("GPL")
arch=('i686')
makedepends=('rpmextract')
depends=("netpbm" "python>=2.5")
_python_ver=${depends[1]}
_python_ver=${_python_ver:8}
source=(http://downloads.hideho.org/plucker/1.8/$pkgname-$pkgver-1.i386.rpm)
md5sums=(1c2eb8f064b0b9d9bfdb8cc1652dd24d)
options=(!LIBTOOL)

build() {

  # Extract the rpm
  rpmextract.sh $pkgname-$pkgver-1.i386.rpm &> /dev/null

  # Correct permissions
  chmod 755 $startdir/src/usr{,/{bin,lib{,/python{,/site-packages}},share{,/{doc{,/packages},man{,/man1}}}}}

  # Move the containt of the package
  mv ./usr $startdir/pkg

  cd $startdir/pkg/usr/lib
  mv python python${_python_ver}

  # Create symbolic links
  cd $startdir/pkg/usr/bin
  ln -s /usr/lib/python${_python_ver}/site-packages/PyPlucker/Spider.py plucker-build

  # Correct the encoding
  sed '1 i # -*- coding: latin1 -*- ' -i $startdir/pkg/usr/lib/python${_python_ver}/site-packages/PyPlucker/helper/doc_compress.py
  sed '1 i # -*- coding: latin1 -*- ' -i $startdir/pkg/usr/lib/python${_python_ver}/site-packages/PyPlucker/helper/prc.py

  echo "PyPlucker" > $startdir/pkg/usr/lib/python${_python_ver}/site-packages/plucker.pth
}
