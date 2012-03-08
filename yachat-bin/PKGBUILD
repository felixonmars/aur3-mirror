# Contributors: fr0stb1te <fbt@fr0stb1te.ru>, 七 <engored@ya.ru>, Von <vonderer@ya.ru>

pkgname=yachat-bin
pkgver=3.2.2
pkgrel=3
pkgdesc="Instant messenger from Yandex based on psi"
arch=('i686' 'x86_64')
url="http://online.yandex.ru/mac-linux"
license=('GPL')

depends=('aspell' 'glibc' 'fontconfig' 'freetype2' 'gcc' 'glib2' 'libice' 'libpng' 'libsm' 'libx11' 'libxcursor' 'libxext' 'libxfixes' 'libxinerama' 'libxrandr' 'libxrender' 'libxss' 'zlib' 'openssl098')

provides=(yachat)
conflicts=(yachat)

_arch='i386'
_svn_ver='9055'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://repo.yandex.ru/debian/pool/main/y/yachat/yachat_${pkgver}~svn${_svn_ver}-0.3_${_arch}.deb")

md5sums=('152a7d5c5695be9e29b484b0f964f66e')
[ "$CARCH" = "x86_64" ] && md5sums=('2fbdbcafdf6696ff817c9e6b9a7ffddd')

build() {

        cd $srcdir

            ar x *.deb
                bsdtar xf data.tar.gz -C $pkgdir

            }
