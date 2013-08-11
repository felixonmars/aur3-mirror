# Maintainer: Andreas Grosse <andig.net at bugs> (Flip mail around, receiving too much spam...)

pkgname=blackboard
_gitname=blackboard_git
pkgver=1.1
pkgrel=5
pkgdesc="Blackboard is an editor for circuit design on a stripboard."
arch=(any)
license=('GPL')
url="http://blackboard.serverpool.org"
depends=('java-runtime' 'xorg-server-utils')
makedepends=('apache-ant' 'git')
source=($_gitname::git+https://github.com/mpue/blackboard.git#commit=53caeb7fe1abf118d4685291fd382153bd82a337
        blackboard.desktop
        blackboard.png
        blackboard
        Linux_Start.sh.patch
        build.xml.patch)
md5sums=('SKIP'
         '46b8e6e9e505904c4f4aa60316fc8578'
         '2a1795e63bf6c71a679d0eb9ef36933b'
         'b6b417be0008bfa5ea59b57e4bc9f6e3'
         '1f4a753935366bdc2ec62e7681b46e1a'
         '765edf0bf7fc19a992b41a8317d2c793')


build() {
  cd $_gitname
  
  patch -p1 -i ../Linux_Start.sh.patch
  patch -p1 -i ../build.xml.patch
  
  ant -Dfile.encoding=UTF8
}

package() {
  cd "${srcdir}" || return 1
  mkdir -p "${pkgdir}"/usr/{bin,share/{applications,pixmaps,blackboard}} || return 1

  # Copy files and set attributes
  cp -r "${srcdir}/$_gitname/dist/lib/." "${pkgdir}/usr/share/blackboard" || return 1

  # Executable
  install -m755 "${srcdir}/blackboard"         "${pkgdir}/usr/bin/"

  # Desktop launcher with icon
  install -m644 "${srcdir}/blackboard.desktop" "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/blackboard.png"     "${pkgdir}/usr/share/pixmaps/"
}

