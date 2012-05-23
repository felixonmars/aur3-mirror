
# Maintainer: flowerfairy <ktj-arch ατ ktrask δοτ de>
pkgname=libanki-git
pkgver=20120523
pkgrel=1
pkgdesc="Helps you remember facts (like words/phrases in a foreign language) efficiently. Git Version."
arch=('any')
url="https://github.com/dae/libanki"
license=('AGPL')
depends=(portaudio python2-httplib2)
makedepends=('git')
conflicts=('anki')

_gitroot="git://github.com/dae/libanki.git"
_gitname="libanki"

build() {
  cd ${srcdir}

  msg "Connecting to GIT server..."
  if [[ -d ${_gitname} ]]; then
    (cd ${_gitname} && git pull origin)
  else
    git clone ${_gitroot} ${_gitname}
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${_gitname}-build
  git clone ${_gitname} ${_gitname}-build

  cd ${srcdir}/${_gitname}-build
  #make
  #./tools/build_ui.sh 
}

package() {

  cd "${srcdir}/${_gitname}-build"
  mkdir -p ${pkgdir}/usr/share/anki/libanki/
  cp -av * ${pkgdir}/usr/share/anki/libanki/
  rm -Rf ${pkgdir}/usr/share/anki/libanki/thirdparty
  #mkdir -p ${pkgdir}/usr/share/pixmaps
  #mkdir -p ${pkgdir}/usr/share/applications
  #mkdir -p ${pkgdir}/usr/share/man/man1
  #mkdir -p ${pkgdir}/usr/share/anki
  #cp -av * ${pkgdir}/usr/share/anki/
  #cd ${pkgdir}/usr/share/anki && (\
  #mv anki ${pkgdir}/usr/bin/;\
  #mv anki.xpm anki.png ${pkgdir}/usr/share/pixmaps/;\
  #mv anki.desktop ${pkgdir}/usr/share/applications;\
  #mv anki.1 ${pkgdir}/usr/share/man/man1/)
  install -Dm644 LICENSE "pkg/usr/share/licenses/$pkgname/COPYING"

}
