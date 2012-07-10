# Maintainer: Alex Rønne Petersen <alex@lycus.org>

pkgname=("mci-git")
pkgdesc="The Managed Compiler Infrastructure: A modern and intuitive compiler infrastructure."
url="http://lycus.org"
license=("MIT")
arch=("i686" "x86_64")
pkgver="2012_07_09"
pkgrel="1"

options=("!strip")
makedepends=("git" "python-waf" "dmd" "python-sphinx" "texlive-core" "texlive-formatsextra")
depends=("glibc" "libffi" "gc")
provides=("mci-cli" "mci-libs")
checkdepends=("valgrind")

if [ $CARCH == "x86_64" ]; then
    _lp64="true"
elif [ $CARCH == "i686" ]; then
    _lp64="false"
fi

_git="https://github.com/lycus/mci.git"
_name="mci"

build() {
    cd "$srcdir"

    msg "MCI: Cloning repository"
    if [ -d "$startdir/src/$_name" ]; then
        cd $_name
        git pull origin master
    else
        git clone $_git
    fi

    cd "$srcdir/$_name"

    msg "MCI: Updating submodules"
    git submodule update --init --recursive

    msg "MCI: Configuring the build system"
    waf configure --mode=debug --lp64=$_lp64 --valgrind=true --check-d-compiler=dmd

    msg "MCI: Building the sources and embedded dependencies"
    waf build

    msg "MCI: Building the infrastructure documentation"
    waf docs

    msg "MCI: Building Ddoc documentation for the API"
    waf ddoc
}

check() {
    cd "$srcdir/$_name/libffi-d/tests"

    msg "MCI: Testing embedded libffi-d"
    ./test.sh

    cd "$srcdir/$_name/libgc-d/tests"

    msg "MCI: Testing embedded libgc-d"
    ./test.sh

    cd "$srcdir/$_name"

    msg "MCI: Running unit tests"
    waf unittest

    msg "MCI: Running the test suite"
    waf test
}

package() {
    msg "MCI: Installing static libraries"
    install -Dm644 "$srcdir/$_name/build/libmci.core.a" "$pkgdir/usr/lib/libmci.core.a"
    install -Dm644 "$srcdir/$_name/build/libmci.assembler.a" "$pkgdir/usr/lib/libmci.assembler.a"
    install -Dm644 "$srcdir/$_name/build/libmci.verifier.a" "$pkgdir/usr/lib/libmci.verifier.a"
    install -Dm644 "$srcdir/$_name/build/libmci.optimizer.a" "$pkgdir/usr/lib/libmci.optimizer.a"
    install -Dm644 "$srcdir/$_name/build/libmci.linker.a" "$pkgdir/usr/lib/libmci.linker.a"
    install -Dm644 "$srcdir/$_name/build/libmci.debugger.a" "$pkgdir/usr/lib/libmci.debugger.a"
    install -Dm644 "$srcdir/$_name/build/libmci.vm.a" "$pkgdir/usr/lib/libmci.vm.a"
    install -Dm644 "$srcdir/$_name/build/libmci.compiler.a" "$pkgdir/usr/lib/libmci.compiler.a"

    msg "MCI: Installing the command line interface"
    install -Dm755 "$srcdir/$_name/build/mci" "$pkgdir/usr/bin/mci"

    mkdir -p "$pkgdir/usr/share/doc/d"

    msg "MCI: Installing the infrastructure documentation"
    cp -r "$srcdir/$_name/docs/_build/html" "$pkgdir/usr/share/doc/d/mci"
    rm -rf "$pkgdir/usr/share/doc/d/mci/_sources"
    find "$pkgdir/usr/share/doc/d/mci" -type f | xargs chmod 0644

    msg "MCI: Installing Ddoc documentation for the API"
    cp -r "$srcdir/$_name/docs/_ddoc" "$pkgdir/usr/share/doc/d/mci/ddoc"
    find "$pkgdir/usr/share/doc/d/mci/ddoc" -type f | xargs chmod 0644
}
