# Maintainer: jfperini <@jfperini>
# Contributor: jfperini <@jfperini>

pkgname=linux-remote-control-git
pkgver=0.4+r137.0a637b9
pkgrel=1
pkgdesc="Turn any device into a complete remote control for your GNU/Linux."
url="https://github.com/Agneli/linux-remote-control"
arch=('any')
license=('GPL v2')
depends=('nodejs' 'xdotool' 'xorg-xbacklight')
makedepends=('git')
optdepends=('rhythmbox: to display music info.' 'totem: to control the video.')
conflicts=('linux-remote-control')
provides=('linux-remote-control')
install="$pkgname.install"
source=("$pkgname"::'git+https://github.com/Agneli/linux-remote-control.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {

    cd "$srcdir/$pkgname"
      
    # Use the tag of the last commit
    printf "0.4+r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
      
}

package() {
      
    cd "$srcdir/$pkgname/opt"
      
    rm -rf {.git,.gitignore,CONTRIBUTORS,COPYING,CREDITS,LICENSE.txt,README.md}
    
    msg2 "  -> Installing program..."
    install -dm755 "$pkgdir/opt/linux-remote-control"
    cp -r . "$pkgdir/opt/linux-remote-control"
    
}




