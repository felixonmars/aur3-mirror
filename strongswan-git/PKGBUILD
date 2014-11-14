# Maintainer: Noel Kuntze <noel [at] familie-kuntze dot de> IPv6 f
pkgname=strongswan-git
pkgver=r13601.8ab1b29
pkgrel=2
pkgdesc="open source IPsec implementation built from the official repository"
url='http://www.strongswan.org'
license=("GPL")
arch=('i686' 'x86_64')
depends=('curl' 'gmp' 'iproute2' 'openssl' 'sqlite' 'gperf')
makedepends=('git')
provides=('strongswan')
conflicts=('openswan' 'strongswan')
options=(!libtool)
backup=(etc/ipsec.conf etc/strongswan.conf etc/swanctl/swanctl.conf)
source=('strongswan-git::git+https://git.strongswan.org/strongswan.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/strongswan-git
  git revert --no-edit 90854d28
  ./autogen.sh
  ./configure --prefix=/usr \
        --sbindir=/usr/bin \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --with-ipsecdir=/usr/lib/strongswan \
        --enable-sqlite \
        --enable-openssl --enable-curl \
        --enable-sql --enable-attr-sql \
        --enable-farp --enable-dhcp \
        --enable-eap-sim --enable-eap-sim-file --enable-eap-simaka-pseudonym \
        --enable-eap-simaka-reauth --enable-eap-identity --enable-eap-md5 \
        --enable-eap-gtc --enable-eap-aka --enable-eap-aka-3gpp2 \
        --enable-eap-mschapv2 --enable-eap-radius --enable-xauth-eap \
        --enable-ha --enable-gcm --enable-ccm --enable-ctr --enable-unity \
	--enable-integrity-test --enable-load-tester --enable-test-vectors \
        --enable-af-alg --disable-ldap --with-capabilities=libcap --enable-cmd
  make
}

package() {
  cd "$srcdir/strongswan-git"
  make DESTDIR=${pkgdir} install
}
