# Maintainer: leepesjee <lpeschier at xs4all dot nl>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
pkgname=rasmol
pkgver=2.7.5
pkgrel=3
pkgdesc="A program for molecular graphics visualisation (aka openrasmol)"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.openrasmol.org/"
depends=('neartree' 'cqrlib' 'cbflib' 'xforms' 'vte' 'gtk2')
makedepends=('imake')
source=(http://www.rasmol.org/software/RasMol_${pkgver}.tar.gz
        egg-macros.patch
	rasmol.png
	rasmol.desktop)
md5sums=('2f43c606775248398dc71ce559b35245'
         'be280f84095783425e4d4139fe3d7316'
         '9eadcb6677c3b600a98e4a251612af15'
         '8ae57862f7b03007778e2be49f84ff03')

build() {
  cd ${srcdir}/rasmol-${pkgver}*/src

# apply check for 64 bit long data type snippet from build_all.sh script
  gcc checklong.c -o checklong
  if [ $(./checklong; echo $1) -gt 4 ]; then
    mv rasmol.h rasmol_amd64_save.h
    echo "#define _LONGLONG"|cat - rasmol_amd64_save.h > rasmol.h
  fi;

# keep Imakefile for later use
  cp Imakefile Imakefile_save

# use rasmol_build_options.sh to set Imakefile options
  ./rasmol_build_options.sh --use_gtk

# set PKGDIR in Imakefile
  sed -i "s|PKGDIR = \$(HOME)|PKGDIR = /usr|" ./Imakefile

# apply egg-macro.patch (thanks to b00rt00s)
  patch -p0 -i ../../../egg-macros.patch

# build and install rasmol-gtk
  xmkmf || return 1
  mv Makefile Makefile-gtk
  make -f Makefile-gtk clean
  make -f Makefile-gtk rasmol || return 1
  make -f Makefile-gtk DESTDIR=$pkgdir install || return 1
  mv $pkgdir/usr/bin/{rasmol,rasmol-gtk}

# build and install old style rasmol
  cp  Imakefile_save Imakefile
  ./rasmol_build_options.sh --use_xformslib
  sed -i "s|PKGDIR = \$(HOME)|PKGDIR = /usr|" ./Imakefile
  xmkmf || return 1
  make clean
  make rasmol || return 1
  make DESTDIR=$pkgdir install || return 1

# cleanup
  rm -rf ${pkgdir}/usr/lib64

# install docs
  install -m755 -d ${pkgdir}/usr/share/man/man1
  install -m644 ../doc/rasmol.1.gz ${pkgdir}/usr/share/man/man1
  install -m755 -d ${pkgdir}/usr/share/doc/rasmol
  install -m644 ../doc/{{manual,refcard}*.pdf,rasmol.{doc,hlp,html}}.gz ${pkgdir}/usr/share/doc/rasmol
  gunzip -f ${pkgdir}/usr/share/doc/rasmol/*.gz

# install data
  install -m755 -d ${pkgdir}/usr/share/data
  install -m644 ../data/* ${pkgdir}/usr/share/data

# install icon
  install -m755 -d ${pkgdir}/usr/share/pixmaps
  install -m644 ${srcdir}/rasmol.png ${pkgdir}/usr/share/pixmaps/
  install -m755 -d ${pkgdir}/usr/share/applications
  install -m644 ${srcdir}/rasmol.desktop ${pkgdir}/usr/share/applications/
}
