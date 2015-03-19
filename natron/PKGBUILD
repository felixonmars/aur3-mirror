# Maintainer: gh0st <echo ZGV2QGFudGktc3R1ZGlvLmV1Cg==|base64 -d>
# Contributor: Allen Li <darkfeline@felesatra.moe>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=natron
pkgver=1.2.1
pkgrel=1
arch=('i386' 'x86_64')
pkgdesc='Video compositing software similar to Nuke and Adobe AfterEffects'
url='http://natron.inria.fr/'
license=MPL
depends=('qt4' 'boost-libs' 'expat' 'glew' 'cairo')
makedepends=('boost' 'shiboken')
source=(
    "natron::git://github.com/MrKepzie/Natron.git#tag=${pkgver}"
)
md5sums=(
    'SKIP'
)

prepare() {
    cd natron
    # For OpenFX
    git submodule update -i --recursive

    # Configure library paths
    cat > config.pri << EOF
boost: LIBS += -lboost_serialization
expat: LIBS += -lexpat
expat: PKGCONFIG -= expat
EOF
}

build() {
    if [[ -d build ]]; then
        rm -r build
    fi
    mkdir build
    cd build
    qmake-qt4 -r $srcdir/natron/Project.pro
    make
}

package() {
    local builddir=$srcdir/build
    local natrondir=$pkgdir/opt/Natron
    local rundir=$pkgdir/usr/bin
    install -D $builddir/App/Natron $natrondir/bin/Natron
    install -D $builddir/Renderer/NatronRenderer $natrondir/bin/NatronRenderer
    install -d $natrondir/share
    cp -r $srcdir/natron/Gui/Resources/OpenColorIO-Configs $natrondir/share
    mkdir -p "$rundir"
    echo -e "#!/bin/bash""\n""cd /opt/Natron/bin""\n""./Natron">"$rundir/natron"
    echo -e "#!/bin/bash""\n""cd /opt/Natron/bin""\n""./NatronRenderer">"$rundir/natronRender"
    chmod +x "$rundir/natron"
    chmod +x "$rundir/natronRender"
}
