#Maintainer: Nathan O <ndowens.aur at gmail dot com>
pkgname=ditrack
pkgver=0.8
pkgrel=2
pkgdesc="A distributed bug tracker with a CLI using subversion/mercurial"
arch=(i686)
url="http://packages.debian.org/sid/devel/ditrack"
license=('BSD')
depends=('python>=2.3' 'subversion>=1.3')
makedepends=('python>=2.3')
options=(docs)
source=("http://ftp.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz")
md5sums=('4f9860f4027577b67895b32558e10d71')

build() {
  cd "${srcdir}/DITrack-${pkgver}"
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  python setup.py build
  python setup.py install --prefix /usr --root "${pkgdir}" 
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
