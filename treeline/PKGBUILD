# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=treeline
pkgver=1.4.1
pkgrel=1
pkgdesc="Tree outliner and PIM which stores any kind of information within a tree structure"
arch=(any)
url="http://treeline.bellz.org"
license=('GPL')
depends=('python2-pyqt' 'ispell' 'pyxml')
conflicts=('treeline-unstable')
replaces=('treeline-unstable')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgver}/${pkgname}-$pkgver.tar.gz" 
        "http://downloads.sourceforge.net/project/${pkgname}/${pkgver}/${pkgname}-i18n-${pkgver}a.tar.gz")
md5sums=('30dcf54436b92e8125477fe7004f6c53'
         'fbf1a709751d30506e797952465edfc4')
sha256sums=('d66e0fcae9bcb5e54f664381f6af73f360f9ff46c91787a126c7197fbe685489'
            '891f086b0718336911ef118a4e25772c639cb48c1bea007031b5da075512e478')

build() {
  cd "${srcdir}/TreeLine"
  python2 install.py -p /usr -b "${pkgdir}"
}
# vim:set ts=2 sw=2 et:
