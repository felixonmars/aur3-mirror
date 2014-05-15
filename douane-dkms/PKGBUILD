pkgname=douane-dkms
pkgver=0.8.2
pkgrel=1
pkgdesc="Douane Firewall Kernel Module (DKMS)"
arch=('i686' 'x86_64')
url="http://douaneapp.com/"
license=('GPL2')
depends=('dkms')
makedepends=('git')
install=${pkgname}.install
source=('git+https://github.com/Douane/douane-dkms.git'
"${pkgname}.install")
md5sums=('SKIP'
'SKIP')
 
 
package() {
# Install
cd "$srcdir/$pkgname"
# Copy dkms.conf
install -Dm644 dkms.conf "${pkgdir}"/usr/src/douane-${pkgver}/dkms.conf
 
# Set name and version
sed -e "s/@_PKGBASE@/${_pkgbase}/" \
-e "s/@PKGVER@/${pkgver}/" \
-i "${pkgdir}"/usr/src/douane-${pkgver}/dkms.conf
 
for i in "${srcdir}/${pkgname}/"{Makefile,douane.c,network_activity_message.h,VERSION}; do
install -D -m644 "${i}" "${pkgdir}/usr/src/douane-${pkgver}/"
done
}
