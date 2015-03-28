# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=winff-bin
_pkgname=winff

pkgver=1.5.3
pkgrel=1
_pkgrel=1.89
_pkg_id='2117782'

pkgdesc="WinFF is a GUI for the command line video converter, FFMPEG."
arch=('i686' 'x86_64')
url="http://winff.org/"
license=('GPLv3')
md5sums=('0d7556aeb4020e907bbfee65a79d7f9d')
depends=('ffmpeg' 'gtk2' 'hicolor-icon-theme')
optdepends=('xterm: terminal emulator')
conflicts=('winff' 'winff-svn')
provides=(winff=$pkgver)

case "$CARCH" in
        i686) _arch='i586';;
        x86_64) _arch='x86_64'; _pkg_id='2117464';  md5sums=('772f7c71adb663e95584cb2289094e46');;
esac

_archive_name="${_pkgname}-${pkgver}-${_pkgrel}.${_arch}.rpm"
source=("http://packman.links2linux.org/download/${_pkgname}/${_pkg_id}/${_archive_name}")

package() {
    cp -r "$srcdir/usr/" "$pkgdir"
}
