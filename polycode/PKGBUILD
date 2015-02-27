pkgname=polycode
pkgrel=1
pkgver=4eb4f1a
pkgdesc="A cross-platform framework for creative code."
arch=("i686" "x86_64")
url="http://polycode.org/"
license=("MIT")
groups=()
depends=("gcc-libs" "glu" "openal" "sdl")
makedepends=("git" "cmake" "python" "python2-ply" "doxygen")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
noextract=()
source=("$pkgname::git://github.com/ivansafrin/Polycode.git#commit=4eb4f1a" "fix-abs.patch")
md5sums=("SKIP" "SKIP")

prepare() {
    cd "$srcdir/$pkgname"
    git am --signoff < ../fix-abs.patch
}

build() {
    msg "Building Dependencies"
    cd "$srcdir/$pkgname"
    if [[ ! -d "Dependencies/Build/Debug" ]]; then
        mkdir -p Dependencies/Build/Debug
    fi
    cd Dependencies/Build/Debug
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Debug ../..
    make
    if [[ ! -d "../Release" ]]; then
        mkdir -p ../Release
    fi
    cd ../Release
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ../..
    make
    msg "Building PolyCode"
    cd "$srcdir/$pkgname"
    if [[ ! -d "Documentation/Doxygen/output/standalone/Polycode/Core" ]]; then
        mkdir -p Documentation/Doxygen/output/standalone/Polycode/Core
    fi
    if [[ ! -d "Build/Debug" ]]; then
        mkdir -p Build/Debug
    fi
    cd Build/Debug
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Debug -DPOLYCODE_BUILD_BINDINGS=ON -DPOLYCODE_BUILD_PLAYER=ON -DPYTHON_EXECUTABLE=/usr/bin/python2 ../..
    make
    make install
    if [[ ! -d "../Release" ]]; then
        mkdir -p ../Release
    fi
    cd ../Release
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DPOLYCODE_BUILD_BINDINGS=ON -DPOLYCODE_BUILD_PLAYER=ON -DPYTHON_EXECUTABLE=/usr/bin/python2 ../..
    make
    make install
    cd "$srcdir/$pkgname"
    if [[ ! -d "Standalone/Build" ]]; then
        mkdir -p Standalone/Build
    fi
    cd Standalone/Build
    cmake -G "Unix Makefiles" ..
    make install
    msg "Building IDE"
    cd "$srcdir/$pkgname"
    cd IDE/Build/Linux
    make
}

package() {
    mkdir -p "$pkgdir/opt/polycode/IDE"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/doc"
    cp -r "$srcdir/$pkgname/Release/Linux/Framework" "$pkgdir/opt/polycode/"
    cp -r "$srcdir/$pkgname/Release/Linux/Standalone" "$pkgdir/opt/polycode/"
    cp -r "$srcdir/$pkgname/IDE/Build/Linux/Build" "$pkgdir/opt/polycode/IDE/"
    cp -r "$srcdir/$pkgname/Documentation" "$pkgdir/opt/polycode/"
    ln -s "/opt/polycode/Framework/Tools/polybuild" "$pkgdir/usr/bin/polybuild"
    ln -s "/opt/polycode/Framework/Tools/polyimport" "$pkgdir/usr/bin/polyimport"
    ln -s "/opt/polycode/Documentation" "$pkgdir/usr/share/doc/polycode"
    echo -e "#!/bin/bash\ncd /opt/polycode/Standalone/Player && ./PolycodePlayer" > "$pkgdir/usr/bin/PolycodePlayer"
    echo -e "#!/bin/bash\ncd /opt/polycode/IDE/Build && ./Polycode" > "$pkgdir/usr/bin/Polycode"
    chmod +x "$pkgdir/usr/bin/PolycodePlayer" "$pkgdir/usr/bin/Polycode"
    mkdir -p "$pkgdir/usr/share/licenses/polycode"
    cp "$srcdir/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/polycode/"
}
