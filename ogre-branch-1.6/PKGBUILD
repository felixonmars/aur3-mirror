# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Tiago Camargo <tcamargo@gmail.com>
# Contributor: Josh Taylor (deficite) <joshtaylor.mail@gmail.com>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=ogre-branch-1.6
pkgver=1.6.5
pkgrel=3
pkgdesc="A scene-oriented, flexible 3D engine written in C++"
arch=('i686' 'x86_64')
url='http://www.ogre3d.org'
license=('LGPL')
depends=('boost' 'freeimage' 'freetype2' 'libxaw' 'libxrandr' 'nvidia-cg-toolkit' 'mesa' 'zziplib' 'ois' 'cegui-0.6' 'libtool')
conflicts=('ogre')
provides=('ogre=1.6.5')
source=("http://downloads.sourceforge.net/ogre/ogre-v${pkgver//./-}.tar.bz2")
md5sums=('9e863029f3befe013adefa7f66dbb13c')

build() {
  # First of all, I apologize to anyone attempting to read this PKGBUILD. 
  # I know it is ugly, horrible and hacky but please trust me when I say
  # that this is 90% due to OGRE's horrible build system which has thankfully
  # been replaced with CMake in Ogre 1.7.x. For now, we will have to cope
  # with Ogre 1.6.x so please hang with me.

  cd ${srcdir}/ogre

  # Fix up Cg not being recognised
  sed -i s/ac_cv_lib_Cg_cgCreateProgram=no/ac_cv_lib_Cg_cgCreateProgram=yes/g configure
  ./configure --prefix=/usr --enable-static --with-platform=GLX --enable-openexr || return 1
  echo "#include <cstddef>" > ./OgreMain/include/OgreOptimisedUtil.h.tmp
  cat ./OgreMain/include/OgreOptimisedUtil.h >> ./OgreMain/include/OgreOptimisedUtil.h.tmp
  mv ./OgreMain/include/OgreOptimisedUtil.h.tmp ./OgreMain/include/OgreOptimisedUtil.h
  echo "#include <cstddef>" > ./Tools/XMLConverter/include/OgreXMLMeshSerializer.h.tmp
  cat ./Tools/XMLConverter/include/OgreXMLMeshSerializer.h >> ./Tools/XMLConverter/include/OgreXMLMeshSerializer.h.tmp
  mv ./Tools/XMLConverter/include/OgreXMLMeshSerializer.h.tmp ./Tools/XMLConverter/include/OgreXMLMeshSerializer.h
  make || return 1 
  make DESTDIR=${pkgdir} install || return 1

  # Copy docs
  install -dm755 ${pkgdir}/usr/share/doc
  cp -r ${srcdir}/ogre/Docs ${pkgdir}/usr/share/doc/OGRE

  # Lots of magic needed here because the stupid Makefile doesn't install the
  # samples to the correct directory. In fact, it tries to make our life really
  # hard by being inconsistent and generally just not nice.
  _build_dir=`grep -m 1 -i abs_top_builddir ${srcdir}/ogre/Makefile| sed s/'abs_top_builddir = '//`
  install -dm755 ${pkgdir}/usr/share/OGRE/
  echo "Samples are in /opt/OGRE/Samples!" > ${pkgdir}/usr/share/OGRE/README_samples.txt
  install -dm777 ${pkgdir}/opt/OGRE/Samples/ # This *needs* to be world writable, it is ugly, I know
  cp -r ${_build_dir}/Samples/Common/bin ${pkgdir}/opt/OGRE/Samples/ || return 1
  cp -r ${pkgdir}${_build_dir}/Samples/Common/bin/* ${pkgdir}/opt/OGRE/Samples/bin/Release/ || return 1
  cd ${pkgdir}/opt/OGRE/Samples/bin/ && ls | grep -v Release | xargs rm -rf || return 1
  sed -e s/PluginFolder.*/"PluginFolder=\/usr\/lib\/OGRE"/ -e s'/Plugin=RenderSystem_Direct3D9//' -e s'/\.dll//' -e s'/Plugin_PCZSceneManager/libPlugin_PCZSceneManager/' < ${pkgdir}/opt/OGRE/Samples/bin/Release/Plugins.cfg > ${pkgdir}/opt/OGRE/Samples/bin/Release/plugins.cfg 
  sed s'/\.\.\///' < Release/resources.cfg > temp-ogre-resources.cfg && mv temp-ogre-resources.cfg Release/resources.cfg
  sed s'/\.\.\///' < Release/quake3settings.cfg > temp-ogre-quake3settings.cfg && mv temp-ogre-quake3settings.cfg Release/quake3settings.cfg
  cp -r ${srcdir}/ogre/Samples/Media ${pkgdir}/opt/OGRE/Samples/ || return 1
  chmod -R 777 ${pkgdir}/opt/OGRE/Samples/bin

  # Example framework stuff
  install -Dm644 ${srcdir}/ogre/Samples/Common/include/ExampleApplication.h ${pkgdir}/usr/include/OGRE/Samples/ExampleApplication.h
  install -Dm644 ${srcdir}/ogre/Samples/Common/include/ExampleFrameListener.h ${pkgdir}/usr/include/OGRE/Samples/ExampleFrameListener.h
  install -Dm644 ${srcdir}/ogre/Samples/Common/include/ExampleLoadingBar.h ${pkgdir}/usr/include/OGRE/Samples/ExampleLoadingBar.h

  # We need to clean up manually because somehow the install litters something
  # into here
  cd ${pkgdir} && ls | grep -v usr | grep -v opt | xargs rm -rf
}

# vim: ts=2 sw=2 et ft=sh
