# Contributor: Brix <brix@brix-verden.dk>

pkgname=d-lib-derelict
pkgver=435
pkgrel=1
pkgdesc="A collection of C bindings with runtime library loading for the D Programming Language."
url="http://dsource.org/projects/derelict"
arch=('i686', 'x86_64')
license=('custom')
makedepends=('subversion')

_svntrunk=http://svn.dsource.org/projects/derelict/trunk/
_svnmod=derelict

build() {
  cd ${srcdir}
  
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
  fi
  
  msg "SVN checkout done or server timeout"
  
  cd $_svnmod
  
  mkdir -p ${pkgdir}/usr/include/d/derelict
  
  # Maybe this should be split into multiple packages?
  cp -r DerelictAL/derelict ${pkgdir}/usr/include/d || return 1
  cp -r DerelictFT/derelict ${pkgdir}/usr/include/d || return 1
  cp -r DerelictGL/derelict ${pkgdir}/usr/include/d || return 1
  cp -r DerelictGLU/derelict ${pkgdir}/usr/include/d || return 1
  cp -r DerelictIL/derelict ${pkgdir}/usr/include/d || return 1
  cp -r DerelictILU/derelict ${pkgdir}/usr/include/d || return 1
  cp -r DerelictILUT/derelict ${pkgdir}/usr/include/d || return 1
  cp -r DerelictODE/derelict ${pkgdir}/usr/include/d || return 1
  cp -r DerelictOgg/derelict ${pkgdir}/usr/include/d || return 1
  cp -r DerelictSDL/derelict ${pkgdir}/usr/include/d || return 1
  cp -r DerelictSDLImage/derelict ${pkgdir}/usr/include/d || return 1
  cp -r DerelictSDLMixer/derelict ${pkgdir}/usr/include/d || return 1
  cp -r DerelictSDLNet/derelict ${pkgdir}/usr/include/d || return 1
  cp -r DerelictSDLttf/derelict ${pkgdir}/usr/include/d || return 1
  cp -r DerelictUtil/derelict ${pkgdir}/usr/include/d || return 1
  cp -r DerelictVorbis/derelict ${pkgdir}/usr/include/d || return 1

  find ${pkgdir} -depth -type d -name ".svn" -exec rm -r {} ';'
}
