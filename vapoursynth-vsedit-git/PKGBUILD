# Maintainer: sl1pkn07 <sl1pkn07@gmail.com>

pkgname=vapoursynth-vsedit-git
pkgver=r3.0.g54b3cd0
pkgrel=1
pkgdesc="A simple program for edit/create VapourSynth scripts. (GIT version)"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?p=1688477"
license=('MIT')
depends=('vapoursynth' 'qt5-base')
makedepends=('git')
provides=('vapoursynth-vsedit' 'vapoursynth-editor')
conflicts=("vapoursynth-vsedit" 'vapoursynth-editor')
source=('git+https://bitbucket.org/mystery_keeper/vapoursynth-editor.git'
        'vsedit.desktop'
        'vsedit.sh')
sha1sums=('SKIP'
          '3684a2cc79fddcdebaad5aaf968f179eb089eae6'
          'c9550dc90b2a4b0de52fb77696217211b3248e9c')
_gitname='vapoursynth-editor'

pkgver() {
  cd "${_gitname}"
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd "${_gitname}/pro"
  qmake-qt5
  make
}

package() {
  install -Dm755 ../vsedit.sh "${pkgdir}/usr/bin/vsedit"
  install -Dm644 ../vsedit.desktop "${pkgdir}/usr/share/applications/vsedit.desktop"
  cd "${_gitname}/build/bin"
  install -Dm755 vsedit "${pkgdir}/usr/share/vsedit/vsedit"
  install -Dm644 vsedit.svg "${pkgdir}/usr/share/pixmaps/vsedit.svg"
  cp -R fonts "${pkgdir}/usr/share/vsedit"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README "${pkgdir}/usr/share/doc/vsedit/README"
}
