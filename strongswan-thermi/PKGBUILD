# Maintainer: Thermi <noel@familie-kuntze.de>

pkgname=strongswan-thermi
pkgver=5.3.1
pkgrel=1
pkgdesc="open source IPsec implementation"
url='http://www.strongswan.org'
license=("GPL")
arch=('i686' 'x86_64')
depends=('curl' 'gmp' 'iproute2' 'openssl' 'sqlite' 'libcap' 'libmariadbclient' 'python-setuptools' 'ruby')
conflicts=('openswan' 'strongswan')
provides=('strongswan')
options=(!libtool)
backup=(etc/ipsec.conf etc/strongswan.conf etc/strongswan.d/* etc/swanctl/swanctl.conf)
source=("http://download.strongswan.org/strongswan-${pkgver}.tar.bz2")

sha256sums=('83fa7b004e65356ff5bb755d9d0e03901d578a99e90b6328a350a4335a32f6de')

# We don't build libipsec because it would get loaded before kernel-netlink and netkey, 
# which would case processing to be handled in user space. Also, the plugin is experimental. If 
# you need it, add --enable-libipsec and --enable-kernel-libipsec

build() {
  cd ${srcdir}/strongswan-${pkgver}

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
        --enable-af-alg --disable-ldap --enable-kernel-libipsec --enable-libipsec \
        --with-capabilities=libcap --enable-cmd --enable-ntru \
	--enable-vici --enable-swanctl --enable-systemd --enable-ext-auth --enable-xauth-noauth \
	--enable-forecast --enable-connmark --enable-aesni
# 	--enable-python-eggs --enable-ruby-gems
  make
}

package() {
  cd "${srcdir}/strongswan-${pkgver}"
  make DESTDIR=${pkgdir} install
}
