pkgname=tesseract2-opt
pkgver=2.04
pkgrel=1
pkgdesc="Legacy version of the Tesseract OCR Engine"
arch=('i686' 'x86_64')
url="http://code.google.com/p/tesseract-ocr/"
license=('Apache')
depends=('gcc-libs' 'libjpeg' 'libpng' 'libtiff' 'zlib')
makedepends=('libtool' 'autoconf' 'automake' 'gcc44')
source=(http://tesseract-ocr.googlecode.com/files/tesseract-$pkgver.tar.gz
        http://tesseract-ocr.googlecode.com/files/tesseract-2.00.eng.tar.gz
        http://tesseract-ocr.googlecode.com/files/tesseract-2.00.deu.tar.gz        
        http://tesseract-ocr.googlecode.com/files/tesseract-2.01.deu-f.tar.gz
        http://tesseract-ocr.googlecode.com/files/tesseract-2.00.fra.tar.gz
        http://tesseract-ocr.googlecode.com/files/tesseract-2.00.ita.tar.gz        
        http://tesseract-ocr.googlecode.com/files/tesseract-2.01.por.tar.gz
        http://tesseract-ocr.googlecode.com/files/tesseract-2.00.nld.tar.gz
        http://tesseract-ocr.googlecode.com/files/tesseract-2.00.spa.tar.gz
        tesseract-2.04-autotools.diff)
md5sums=('b44eba1a9f4892ac62e484c807fe0533'
         'b8291d6b3a63ce7879d688e845e341a9'
         '609d91b1ae3759a756b819b5d8403653'
         '62695819882e372cb86367c1b72cf229'
         '64896b462e62572a3708bb461820126c'
         '2759e1dae91a989a43490ff4c2253a4b'
         'eca21fed3ce1f8ded8dfcedbd1351af7'
         'b2f6ede182cea4bbfffd3b040533ce58'
         'bc26a777b2384613895677cb8e61ca75'
         '1fdf5ef5c3c9362f78a185826170f17d')

_optdir="/opt/tesseract2"

build() {

#clear bin-lib data
  if [ -d $srcdir/bin-lib ]; then
    rm -rf $srcdir/bin-lib
  fi
  mkdir $srcdir/bin-lib -p


#add gcc44 link
  ln -s /usr/bin/gcc-4.4 $srcdir/bin-lib/gcc
  ln -s /usr/bin/g++-4.4 $srcdir/bin-lib/g++
  ln -s /usr/bin/c++-4.4 $srcdir/bin-lib/c++
  ln -s /usr/bin/cpp-4.4 $srcdir/bin-lib/cpp

#add path on bin-lib
  PATH="$srcdir/bin-lib/:$PATH"


  cd "$srcdir/tesseract-$pkgver"

  msg "Applying patches..."
  # This patch adds autotools support to create shared libraries
  # and fixes cyclic redundancy and a missing cstdio include
  if [[ ! -e "patch.lock" ]]; then
    touch configure.ac
    touch config.h.in
    touch cutil/callcpp.cpp
    
    patch -Nup1 < ../tesseract-2.04-autotools.diff || return 1
    touch patch.lock
  fi

  # Autotools magic
  if [[ ! -d "m4" ]]; then
    libtoolize -c
    aclocal --verbose
    automake -a -c && autoconf
  fi

  mkdir -p $pkgdir/${_optdir}/share/tessdata
  chmod 0644 $srcdir/tessdata/*
  
  ./configure CXXFLAGS=-fPIC --prefix=${_optdir}

  msg "Starting make..."
  make || return 1
}

package() {
  cd "$srcdir/tesseract-$pkgver"  
  make DESTDIR="$pkgdir" install || return 1

  cp -R $srcdir/tessdata $pkgdir/${_optdir}/share
}

