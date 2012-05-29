# Contributor: James Tauber <jtauber at jtauber dot com>
# Maintainer: Brett Heinkel <bheinks at gmail dot com>

pkgname=dcpu16py-git
pkgver=20120529
pkgrel=1
pkgdesc="A Python implementation of Notch's DCPU-16 (complete with assembler, disassembler, debugger and video terminal implementations)"
arch=('i686' 'x86_64')
url="https://github.com/jtauber/dcpu16py"
license=('custom')
depends=('python')
makedepends=('git')
source=()

_gitroot="git://github.com/jtauber/dcpu16py.git"
_gitname="dcpu16py"

build() {
    cd "$srcdir"
    msg "Connected to Git server..."

    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin
        msg "The local files are updated."
    else
        git clone "$_gitroot" "$_gitname"
    fi

    msg "Git checkout done or server timeout"
    msg "Starting build..."
    
    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"
    
    mkdir -p "$pkgdir/usr/lib/dcpu16py"
    cp -r * "$pkgdir/usr/lib/dcpu16py"
}

package() {
    mkdir -p "$pkgdir/usr/bin"

    ln -s /usr/lib/dcpu16py/asm.py "$pkgdir/usr/bin/dcpu16py-asm"
    ln -s /usr/lib/dcpu16py/disasm.py "$pkgdir/usr/bin/dcpu16py-disasm"
    ln -s /usr/lib/dcpu16py/dcpu16.py "$pkgdir/usr/bin/dcpu16py"

    msg "Installing license..."
    install -D -m644 "$_gitname-build/LICENSE" \
        "$pkgdir/usr/share/licenses/dcpu16py/LICENSE"
}
