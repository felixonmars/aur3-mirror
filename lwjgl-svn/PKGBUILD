# Contributor: Piotr Sobiech <sobiech at wredny dot net>
pkgname=lwjgl-svn
_pkgname=lwjgl
pkgver=3245
pkgrel=3
pkgdesc="Provides developers access to high performance crossplatform libraries such as OpenGL and OpenAL allowing for state of the art 3D games and 3D sound. All in a simple and straight forward API."
#i686 should work, report to me if it dosen't
arch=('i686' 'x86_64')
url="http://lwjgl.org/"
license=('custom')
conflicts=('jinput' 'lwjgl')
#libxxf86vm is already a dependency of libgl
depends=('java-runtime>=5' 'openal' 'libgl')
makedepends=('apache-ant>=1.4.1' 'subversion' 'libxxf86vm-static')
provides=('jinput' 'lwjgl')
install=${pkgname}.install
source=()
md5sums=()

_svntrunk="https://java-game-lib.svn.sourceforge.net/svnroot/java-game-lib/trunk/LWJGL"
_svnmod=lwjgl

build() { 
  cd ${startdir}/src
  msg "Connecting to SVN server...."
  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  svn export --force ${_svnmod} ${_svnmod}-build
  cd ${_svnmod-build}

#msg "Cleaning"
#ant clean
  mkdir -p ./bin
  ant generate-all || return 1
  ant compile || return 1
  ant compile_native || return 1

  if [ "$CARCH" = "i686" ]; then
#should work, i686 is not tested much though, check System.getProperty("java.library.path"); in java to know the path for sure
     install -d -m755 "${pkgdir}/usr/java/packages/lib/i386"
     install -m644 ./libs/linux/libjinput-linux.so "${pkgdir}/usr/java/packages/lib/i386/" || return 1
     install -m644 ./libs/linux/libopenal.so "${pkgdir}/usr/java/packages/lib/i386/" || return 1
     install -m644 ./libs/linux/liblwjgl.so "${pkgdir}/usr/java/packages/lib/i386/" || return 1
  else
     install -d -m755 "${pkgdir}/usr/java/packages/lib/amd64"
     install -m644 ./libs/linux/libjinput-linux64.so "${pkgdir}/usr/java/packages/lib/amd64/" || return 1
     install -m644 ./libs/linux/libopenal64.so "${pkgdir}/usr/java/packages/lib/amd64/" || return 1
     install -m644 ./libs/linux/liblwjgl64.so "${pkgdir}/usr/java/packages/lib/amd64/" || return 1
  fi

  ant jars || return 1

  install -d -m755 "${pkgdir}${JAVA_HOME}/jre/lib/ext"
  install -m644 ./libs/jinput.jar "${pkgdir}${JAVA_HOME}/jre/lib/ext" || return 1
  install -m644 ./libs/lwjgl.jar "${pkgdir}${JAVA_HOME}/jre/lib/ext" || return 1
  install -m644 ./libs/lwjgl_test.jar "${pkgdir}${JAVA_HOME}/jre/lib/ext" || return 1
  install -m644 ./libs/lwjgl_util.jar "${pkgdir}${JAVA_HOME}/jre/lib/ext" || return 1
  install -m644 ./libs/lwjgl_util_applet.jar "${pkgdir}${JAVA_HOME}/jre/lib/ext" || return 1

  ant javadoc

  install -d -m755 "${pkgdir}/usr/share/java/lwjgl/javadoc/"
  mv ./doc/javadoc/* "${pkgdir}/usr/share/java/lwjgl/javadoc/" 

  install -d -m755 "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m644 ./doc/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/" || return 1 
  install -m644 ./doc/3rdparty/jinput_license.txt "${pkgdir}/usr/share/licenses/${_pkgname}/" || return 1
}
# vim:set ts=2 sw=2 et:
