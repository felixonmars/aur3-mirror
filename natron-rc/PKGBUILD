# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>
# Contributor: maxp           <echo bWF4cEB0cnlzdGVyby5pcw== | base64 -d>

pkgname=natron-rc
pkgver=1.0.0
_pkgrc=rc3
pkgrel=1
arch=('i386' 'x86_64')
pkgdesc='Video compositing software similar to Nuke and Adobe AfterEffects'
url='http://natron.inria.fr/'
license=MPL
conflicts=('natron')
depends=('qt5-base>=5.3' 'boost-libs' 'expat' 'glew' 'cairo>=1.12')
makedepends=('boost')
optdepends=(
  'tuttleofx: plugins'
  'openfx-io: read anything else than standard 8-bits images'
  'openfx-misc: plugins'
  'openfx-yadif: yadif deinterlacer plugin'
  'openfx: sample plugins in the Support and Examples directories'
)
source=(
  "Natron::git://github.com/MrKepzie/Natron.git#tag=v${pkgver}-${_pkgrc}"
)
md5sums=('SKIP')
prepare() {
  git -C "${srcdir}/Natron" submodule update -i --recursive
}

build() {
  mkdir -p "${srcdir}/Natron-build"
  cat > ${srcdir}/Natron/config.pri << EOF
boost: LIBS += -lboost_serialization
expat: LIBS += -l expat
expat: PKGCONFIG -= expat
EOF
  cd "${srcdir}/Natron-build"
  qmake-qt5 -r "${srcdir}/Natron/Project.pro"
  make
}

package() {
  cd "${srcdir}/Natron-build"
  make install DESTDIR="${pkgdir}"  # Seems it installs nothing
  install -Dm0755 "${srcdir}/Natron-build/App/Natron" "${pkgdir}/usr/bin/Natron"
  install -m 0755 -d "${pkgdir}/usr/share"
  cp -r "${srcdir}/Natron-build/App/OpenColorIO-Configs" "${pkgdir}/usr/share/OpenColorIO-Configs"
  install -Dm0755 "${srcdir}/Natron-build/Renderer/NatronRenderer" "${pkgdir}/usr/bin/NatronRenderer"
  ln -s Natron "${pkgdir}/usr/bin/natron"
  ln -s NatronRenderer "${pkgdir}/usr/bin/natronrenderer"
}
