# Maintainer: Noel Kuntze <noel [at] familie-kuntze dot de>

pkgname=strongswan-privdrop
pkgver=5.3.1
pkgrel=1
pkgdesc="open source IPsec implementation with privilege dropping enabled and set to run as non-root user"
url='http://www.strongswan.org'
license=("GPL")
arch=('i686' 'x86_64')
depends=('curl' 'gmp' 'iproute2' 'openssl' 'sqlite' 'gperf' 'sudo' 'libcap')
conflicts=('openswan' 'strongswan' 'strongswan-git')
options=(!libtool)
backup=(etc/ipsec.conf etc/strongswan.conf etc/strongswan.d/ etc/swanctl/swanctl.conf)
source=("http://download.strongswan.org/strongswan-${pkgver}.tar.bz2" 
	"_updown" 
	"strongswan.conf"
	"strongswan-privdrop.install"
)

sha256sums=('83fa7b004e65356ff5bb755d9d0e03901d578a99e90b6328a350a4335a32f6de'
            '79d415109c8b884763ecb22207ec7a1ea13c4424e83ec99da801eb3efbb83781'
            '9975a415f9d80502bebac71021bc62ab749ff0b57c9be2a14ab63ce6f489b490'
            '6d1f2b659bf4eff11403afbaa9976505080a874b264f54de8c3806d3ba792922')

# We don't build libipsec because it would get loaded before kernel-netlink and netkey, which
# would case processing to be handled in user space. Also, the plugin is experimental. If you need it,
# add --enable-libipsec and --enable-kernel-libipsec

build() {
   cd $srcdir/strongswan-$pkgver
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
        --enable-af-alg --disable-ldap \
	--with-capabilities=libcap --enable-cmd --enable-ntru \
	--enable-vici --enable-swanctl --enable-systemd --enable-ext-auth \
	--enable-forecast --enable-connmark --enable-aesni
	make
}

package() {
  cd "$srcdir/strongswan-$pkgver"
  make DESTDIR=${pkgdir} install
  # The sudo_updown and sudo_updown_espmark scripts are simply the default updown scripts 
  # with "iptables" replaced by "sudo iptables" in order to make them work with privilege dropping
  # and running as non-root user.
  install -Dm750 -g strongswan $srcdir/_updown $pkgdir/usr/lib/strongswan/
  install -Dm644 -g strongswan $srcdir/strongswan.conf $pkgdir/etc/strongswan.conf
#  chgrp -R strongswan $pkgdir/etc/ipsec.d
#  chmod -R g+r $pkgdir/etc/ipsec.d
}

