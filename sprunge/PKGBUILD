pkgname='sprunge'
pkgver='0.1.0'
pkgrel=1
pkgdesc='Upload data to sprunge.us via stdin'
license=('MIT')
url='https://github.com/kevr/sprunge'

arch=('i686' 'x86_64' 'armv6h')
depends=('python')
source=('sprunge')
sha256sums=(
    'e36f331e35270978639555f485dc13f37298fe248f02f34dc0670665b44b2d48'
)

package()
{
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

