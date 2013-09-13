# Maintainer: Moritz Maxeiner <moritz@ucworks.org>

pkgname=dub
pkgver=0.9.18
pkgrel=1
pkgdesc="Package manager for D packages"
arch=('i686' 'x86_64')
url="https://github.com/rejectedsoftware/dub"
license=('MIT')
depends=('dmd' 'curl')
source=(${url}/archive/v${pkgver}.tar.gz)
conflicts=('dub-git')
md5sums=('d4e1d7656b828ca685ada96b350d1f87')
sha256sums=('0cbfb67a549beefd2b65a2779eff660b9057a9d51be017f9d46f48ad6e3214bf')

build()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./build.sh
}

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m755 bin/dub "${pkgdir}/usr/bin/dub"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
