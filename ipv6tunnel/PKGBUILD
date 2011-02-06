
pkgname=ipv6tunnel
pkgver=20100124
pkgrel=1
pkgdesc="Scripts to enable IPv6 tunnel (isatap mode)."
url="http://somescripts.googlecode.com/"
license="GPL"
depends=('bash')
source=(http://somescripts.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('f41af0c457a7ee85a146ade4e9153741')
back=("etc/${pkgname}.conf")
arch=("any")
build() {
    cd "${srcdir}/${pkgname}"
    install -D -m 755 ipv6tunnel "${pkgdir}/usr/bin/ipv6tunnel" || return 1
    install -D -m 644 ipv6tunnel.conf "${pkgdir}/etc/ipv6tunnel.conf" || return 1
    install -D -m 755 4to6.archlinux "${pkgdir}/etc/rc.d/4to6" || return 1
}

