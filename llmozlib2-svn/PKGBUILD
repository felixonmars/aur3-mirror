# Contributor: Lisa Denia <eiffel56@gmail.com>
pkgname=llmozlib2-svn
pkgver=26
pkgrel=1
pkgdesc="An embeddable mozilla web rendering engine"
arch=('i686' 'x86_64')
url="http://wiki.secondlife.com/wiki/LLMozLib2"
license=('MPL' 'GPL' 'LGPL')
depends=("xulrunner-linden-cvs>=20090817")
makedepends=('subversion' 'make' 'sed')
provides=("llmozlib2")

_svntrunk="https://svn.secondlife.com/svn/llmozlib/trunk/llmozlib2"
_svnmod="llmozlib2"

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #

  # We have to install everything ourself since the official install script is just a dirty hack
  _INCS="/webbrwsr/ /docshell/ /dom/ /xpcom/ /widget/ 
        /gfx/ /string/ /uriloader/ /view/ /layout/ 
        /content/ /locale/ /profdirserviceprovider/ /xulapp/ 
        /pref/ /necko/ /nkcache/ /js/ /appshell/ /sdk/"
  _LIBS="libmozjs.so libnspr4.so libplc4.so libplds4.so libprofdirserviceprovider_s.a libxpcom.so libxul.so"
  _RUNTIME="chrome components greprefs plugins res *.so"
  mkdir -p ${pkgdir}/usr/include/
  mkdir -p ${pkgdir}/usr/lib/llmozlib2/lib_release
  mkdir -p ${pkgdir}/usr/lib/llmozlib2/runtime_release
  ln -s /opt/xulrunner-linden/include/xulrunner-1.8.1.21/ ${pkgdir}/usr/include/llmozlib2
  for _i in ${_LIBS}; do
    ln -s /opt/xulrunner-linden/lib/xulrunner-1.8.1.21/${_i} ${pkgdir}/usr/lib/llmozlib2/lib_release/${_i}  || return 1
  done
  for _i in ${_RUNTIME} $(cd /opt/xulrunner-linden/lib/xulrunner-1.8.1.21/ && /bin/ls *.so); do
    ln -sf /opt/xulrunner-linden/lib/xulrunner-1.8.1.21/${_i} ${pkgdir}/usr/lib/llmozlib2/runtime_release/  || return 1
  done

  # We also have to compile and install llmozlib2 itself manually
  _SRCS='llembeddedbrowser.cpp llembeddedbrowserwindow.cpp llmozlib2.cpp'
  for _i in ${_SRCS}; do
    echo "Building ${_i}"
    g++ -DMOZILLA_INTERNAL_API -DLL_LINUX=1 -fno-stack-protector -ggdb -fvisibility=hidden\
    $(find ${pkgdir}/usr/include/llmozlib2/ -type d | sed s/^/-I/) -c ${_i} || return 1
  done
  ar rcs libllmozlib2.a $(echo ${_SRCS} | sed 's/\.cpp/.o/g') || return 1

  install -D -m644 libllmozlib2.a ${pkgdir}/usr/lib/libllmozlib2.a || return 1
  install -D -m644 llmozlib2.h ${pkgdir}/usr/include/llmozlib2.h || return 1
}
