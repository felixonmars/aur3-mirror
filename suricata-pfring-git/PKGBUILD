# Maintainer: Thomas Marchsteiner <tommy[0x2e]m86[0x40]gmail[0x2e]com>
pkgname=suricata-pfring-git
_pkgname=oisf
pkgver=20150209
pkgrel=2
pkgdesc="A NextGen multithreaded IDS/IPS with pf_ring, JSON Output and GeoIP support"
arch=('i686' 'x86_64')
url="http://openinfosecfoundation.org/index.php/download-suricata"
license=('GPL2')
depends=('libcap-ng' 'libnet' 'libpfring-svn' 'libyaml' 'pcre' 'jansson' 'geoip'  'libnfnetlink' 'python' 'libpcap-pfring-svn' 'libhtp-git') 
optdepends=('snort: suricata can use rulesets provided by snort' 'coccinelle')
makedepends=('autoconf' 'make' 'pkg-config' 'git')
backup=('etc/suricata/suricata.yaml')
conflicts=('suricata' 'suricata-dev')
provides=('suricata')
install='suricata.install'
source=('git+git://phalanx.openinfosecfoundation.org/oisf.git'
                'suricata.tmpfile'
                'suricata.defaults'
                'suricata.service'
                'suricata.yaml'
                'suricata.install')
sha1sums=('SKIP'
                'c688d217fe17a31639b4f80cdd49e3f15c24dca3'
                'd1991f4a29bc2587456b12e1941baa837381d6e8'
                'd526fb6eb95f4c0a19174485eebd780c60cda9c8'
                '5deb7617fe4b9ba49bbdc2754a2076e7da779a91'
                '78891e2a2623584082da0296b90e811090caa0e6')

pkgver() {
        cd "$srcdir/$_pkgname"
        ( set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
        )
}                
                
build() {

        cd ${srcdir}/$_pkgname
        ./autogen.sh
        sed -i s/pfring_recv_chunk=\"no\"/pfring_recv_chunk=\"yes\"/ configure
        LIBS="-lrt -lnuma" ./configure --prefix=/usr \
        --sysconfdir=/etc --localstatedir=/var \
        --enable-pfring --enable-geoip --enable-non-bundled-htp \
#        --with-libpcap-includes=/usr/include/libpcap  --with-libpcap-libraries=/usr/lib/libpcap
        make
}

package() {
        cd ${srcdir}/$_pkgname
        make DESTDIR=${pkgdir} install

        install -d ${pkgdir}/etc/suricata/rules
        install -d ${pkgdir}/var/log/suricata

        install -d "${pkgdir}"/run/suricata
        install -Dm644 ${srcdir}/suricata.tmpfile ${pkgdir}/etc/tmpfiles.d/suricata.config
        install -Dm644 ${srcdir}/suricata.defaults ${pkgdir}/etc/default/suricata
        install -Dm644 ${srcdir}/suricata.service ${pkgdir}/usr/lib/systemd/system/suricata.service
        install -Dm644 ${srcdir}/suricata.yaml ${pkgdir}/etc/suricata/suricata-arch.yaml
        install -Dm644 ${srcdir}/${_pkgname}/suricata.yaml ${pkgdir}/etc/suricata/suricata.yaml
        install -Dm644 ${srcdir}/${_pkgname}/classification.config ${pkgdir}/etc/suricata/classification.config
        install -Dm644 ${srcdir}/${_pkgname}/reference.config ${pkgdir}/etc/suricata/reference.config
        install -Dm644 ${srcdir}/${_pkgname}/threshold.config ${pkgdir}/etc/suricata/threshold.config
        
        install -d  ${pkgdir}/usr/share/licenses/${pkgname}
        install -d  ${pkgdir}/usr/share/doc/${pkgname}
        install -Dm644 ${srcdir}/${_pkgname}/LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
        install -Dm644 ${srcdir}/${_pkgname}/ChangeLog $pkgdir/usr/share/doc/suricata/ChangeLog

}
