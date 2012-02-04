pkgname=goil
pkgver=svn
pkgrel=3
pkgdesc="OIL compiler"
url="http://trampoline.rts-software.org/"
arch=('i686')
#depends=('')
makedepends=('galgas>=1.8.3')
source=("http://galgas.rts-software.org/download/1.8.3/libpm-lf.tar.bz2")
md5sums=('63c66115491774d75c9aeef016e3250d') 
license="GPL"

build() {
  # Libpm #
  # Just need to be extracted

  # Subversion #
  cd $srcdir
  svn --username anonymous --password anonymous --no-auth-cache --non-interactive co http://trampoline.rts-software.org/svn/trunk/goil/ || return 1

  # C++ generating #
  #msg "C++ generating using galgas..."
  cd goil/galgas_sources/
  #rm -Rf GALSGAS_OUTPUT/*
  #galgas all_goil.ggs

  # Compiling #
  msg "Compiling"
  cd ../makefile_unix/
  make || return 1

  # Install #
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  cp goil $pkgdir/usr/bin/goil
}

