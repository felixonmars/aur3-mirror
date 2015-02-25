# Author: Tomoya kose (mitsuse) <tomoya@mitsuse.jp>

pkgname=bullet-cmd
pkgver=0.1.3
pkgrel=1
pkgdesc="A command-line tool to send a message to devices via Pushbullet."
arch=('i686' 'x86_64')
url="https://github.com/mitsuse/bullet"
license=(MIT)
depends=()
optdepends=()
backup=()

source_i686=(
    https://github.com/mitsuse/bullet/releases/download/v${pkgver}/linux_386.zip
)
sha1sums_i686=('8f8a2ca2b6cc29619c888d50990454897fe0391f')

source_x86_64=(
    https://github.com/mitsuse/bullet/releases/download/v${pkgver}/linux_amd64.zip
)
sha1sums_x86_64=('10e5992bf1b117754d6c88fb61395f642e0cdd99')

package() {
    cd "$srcdir"
    install -d "${pkgdir}/usr/bin/"
    install -m 755 bullet "${pkgdir}/usr/bin"
}
