pkgname='sprunge'
pkgver='0.1.1'
pkgrel=2
pkgdesc='Upload data to sprunge.us via stdin'
license=('GPL2')
url='https://github.com/kevr/sprunge'

arch=('i686' 'x86_64' 'armv6h')
depends=('python')
source=('sprunge')
sha256sums=(
    '3162365f6edaf5d52f8ce9d57a2800ebeb7184bd1b37d107ad88b45542ed97ec'
)

package()
{
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

