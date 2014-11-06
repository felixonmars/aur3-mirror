# Maintainer: Neven Sajko < nsajko \at\ gmail \dot\ com>

_pname=OpenNotrium
pkgname=opennotrium-git
pkgver=r59.6a28248
pkgrel=4
pkgdesc='Top-down survival game'
url=http://monkkonen.net/notrium
arch=('x86_64' 'i686')
license=('custom' 'GPL3')
depends=('physfs' 'sdl2_image' 'sdl2_mixer')
optdepends=()
makedepends=('git' 'cmake' 'physfs' 'sdl2_image' 'sdl2_mixer')
install=install-message.sh
source=("git+https://github.com/verhoevenv/${_pname}.git" 'wrapper.sh')
sha256sums=('SKIP' '3c526f6381ec9cd9bc5921a2ef133c3a721c909fdf54dda0a57e203723bbe5ca')

pkgver() {
    cd "${_pname}"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    sed -i "s|<executable>|$pkgname|g" wrapper.sh
}

build() {
    cd "${_pname}"
    cmake ./
    make
}

package() {
    cd "${_pname}"
    install -Dm755 ../wrapper.sh "$pkgdir/usr/bin/notrium"          # wrapper script
    install -dm755 "$pkgdir/usr/share/$pkgname"                     # directory with runtime files
    install -m755 "${_pname}" "$pkgdir/usr/share/$pkgname/$pkgname" # executable in shared dir with same name
    cp -r runtime_files/* "$pkgdir/usr/share/$pkgname"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# Add files to be backed up!
