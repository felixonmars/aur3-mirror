# Contributor: domanov <domanov_NOSPAM@gmail_NOSPAM.com>
# based on http://vijaymichaeljoseph.blogspot.com/2009/10/compiling-opensg-with-qt4x.html
pkgname=opensg-cvs
pkgver=1.8.0
pkgrel=3
pkgdesc="Multithreaded, multiplatform scene graph system based on OpenGL"
arch=("x86_64")
license=('GPL')
url=('http://downloads.sourceforge.net/project/opensg/OpenSG/1.8.0/opensg_dailybuild.070704.source.tgz')
depends=('libtiff' 'libxmu' 'libpng>=1.4' 'qt')
makedepends=('cvs')
provides=()
conflicts=()
replaces=()
backup=()
options=('!makeflags')
install=
noextract=()
source=('commonQT4.patch' 'DefaultRules.patch' 'libpng14.patch')
md5sums=('5942aa5890d66d29395428752de0988f'
         '1613916bf7a938ea4bf232ddd35ddf4f'
         'c69da415eafca19769a6bae3fe58e90f')

build() {
   unset LDFLAGS
   cd ${srcdir}
   if [ -d OpenSG/CVS ]; then
     cd OpenSG
#     cvs -z3 update -d
     cd ..
   else
     mkdir OpenSG
     cvs -d:pserver:anonymous:@opensg.cvs.sourceforge.net:/cvsroot/opensg login
     cvs -z3 -d:pserver:anonymous:@opensg.cvs.sourceforge.net:/cvsroot/opensg co -P OpenSG
  fi

   msg ":: CVS checkout/update done (or server timeout)"

   # as suggested in the wiki, copy the src dir into a new build dir
   rm -rf "$srcdir/OpenSG-build"
   cp -r "$srcdir/OpenSG" "$srcdir/OpenSG-build"

   cd OpenSG-build
   msg ":: First configure...\n"

   ./configure  --prefix=/usr \
                --enable-qt4 \
 		--with-qt4bindir=/usr/bin \
		--with-qt4includedir=/usr/include \
		--with-qt4libdir=/usr/lib \
		--enable-glut --enable-x11 --enable-jpg --enable-png --enable-tif --enable-gif 

   msg "\n \n:: Patching... \n"
   patch Common/DefaultRules.mk < ../DefaultRules.patch

   patch Source/System/Image/OSGPNGImageFileType.cpp < ../libpng14.patch

   # the path x86_64 used for this PKGBUILD. Testers for i686?
   patch Builds/x86_64-unknown-linux-gnu-g++/CommonPackages/commonQT4.mk < ../commonQT4.patch

   msg ":: Make clean...\n \n" # needed, don't really understand why
   make clean
   
   msg ":: Re-config...\n \n"
   ./config.status

   msg "\n \n Starting 'make opt &> log'. Log file in src/OpenSG-build/log (be aware, it's big)"
   make opt &> log || return 1
   
   # not standard INSTALL_DIR
   NEWINSTALL_DIR=${pkgdir}/usr
   install -d -m755 ${NEWINSTALL_DIR}
   make INSTALL_DIR=${NEWINSTALL_DIR} install || return 1
   mv ${NEWINSTALL_DIR}/lib/opt/* ${NEWINSTALL_DIR}/lib
   rmdir ${NEWINSTALL_DIR}/lib/opt ${NEWINSTALL_DIR}/lib/dbg
 }
