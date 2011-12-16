# Maintainer: Tianjiao Yin <ytj000+aur@gmail.com>
pkgname=boost-cpp-lib-doc
pkgver=1.0
pkgrel=1
pkgdesc="This book is an introduction to the Boost C++ Libraries which complement the C++ standard by adding functions helpful in practice."
arch=('any')
url="http://en.highscore.de/"
license=('CCPL:cc-by-nc-nd')
makedepends=("svn")
source=("http://en.highscore.de/cpp/boost/The%20Boost%20C++%20Libraries.zip"
        "http://www.highscore.de/cpp/boost/Die%20Boost%20C++%20Bibliotheken.zip")
noextract=("The%20Boost%20C++%20Libraries.zip"
           "Die%20Boost%20C++%20Bibliotheken.zip")
md5sums=('c59a0637df2848d70e43e922229781c5'
         '7c0ec8fd23ca16c2a1a8bee12cd68565')

build() {
  # English
  mkdir -p build/en
  cd build/en
  bsdtar -xf ../../The%20Boost%20C++%20Libraries.zip
  cd $srcdir

  # German
  mkdir -p build/de
  cd build/de
  bsdtar -xf ../../Die%20Boost%20C++%20Bibliotheken.zip
  cd $srcdir

  # Chinese
  mkdir -p build/zh
  cd build
  svn checkout http://boost-cpp-lib-zh.googlecode.com/svn/trunk/ zh
  rm -rf zh/Android
  cd $srcdir
}


package() {
  cd $pkgdir
  mkdir -p usr/share/doc
  mv $srcdir/build usr/share/doc/boost-cpp-lib

	# clean svn directory
	find ${pkgdir} -type d -name ".svn" | xargs rm -rf
}

# vim:set ts=2 sw=2 et:
