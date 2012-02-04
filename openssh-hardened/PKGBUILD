# $Id: PKGBUILD 127399 2011-06-14 16:51:03Z bisson $
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=openssh-hardened
pkgver=5.8p2
pkgrel=10
pkgdesc='Free version of the SSH connectivity tools'
arch=('i686' 'x86_64')
license=('custom:BSD')
url='http://www.openssh.org/portable.html'
backup=('etc/ssh/ssh_config' 'etc/ssh/sshd_config' 'etc/pam.d/sshd' 'etc/conf.d/sshd')
depends=('tcp_wrappers' 'krb5' 'openssl-hardened=1.0.0.d-3' 'libedit')
source=("ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${pkgver}.tar.gz"
        'authfile.c.patch'
        'sshd.confd'
        'sshd.pam'
        'sshd')
sha1sums=('64798328d310e4f06c9f01228107520adbc8b3e5'
          '3669cb5ca6149f69015df5ce8e60b82c540eb0a4'
          'ec102deb69cad7d14f406289d2fc11fee6eddbdd'
          '07fecd5880b1c4fdd8c94ddb2e89ddce88effdc1'
          '6b7f8ebf0c1cc37137a7d9a53447ac8a0ee6a2b5')
replaces=('openssh<=5.8p2-8')
provides=('openssh=5.8p2-8')
conflicts=('openssh=>5.8p2-8')

build() {
	pkgname="openssh"
	cd "${srcdir}/${pkgname}-${pkgver}"

	# SSP is done natively already.
	export CFLAGS="${CFLAGS} -fPIE -D_FORTIFY_SOURCE=2"
	export LDFLAGS="-pie ${LDFLAGS} -Wl,-z,relro -Wl,-z,now"
	patch -p1 -i ../authfile.c.patch # fix FS#24693 using http://anoncvs.mindrot.org/index.cgi/openssh/authfile.c?revision=1.95

	./configure \
		--prefix=/usr \
		--libexecdir=/usr/lib/ssh \
		--sysconfdir=/etc/ssh \
		--with-privsep-user=nobody \
		--with-md5-passwords \
		--with-pam \
		--with-mantype=man \
		--mandir=/usr/share/man \
		--with-xauth=/usr/bin/xauth \
		--with-kerberos5=/usr \
		--with-ssl-engine \
		--with-libedit=/usr/lib \
		--disable-strip --with-tcp-wrappers

	make
}

package() {
	pkgname="openssh"
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	install -Dm755 ../sshd "${pkgdir}"/etc/rc.d/sshd
	install -Dm644 ../sshd.pam "${pkgdir}"/etc/pam.d/sshd
	install -Dm644 ../sshd.confd "${pkgdir}"/etc/conf.d/sshd
	install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

	rm "${pkgdir}"/usr/share/man/man1/slogin.1
	ln -sf ssh.1.gz "${pkgdir}"/usr/share/man/man1/slogin.1.gz

	# additional contrib scripts that we like
	install -Dm755 contrib/findssl.sh "${pkgdir}"/usr/bin/findssl.sh
	install -Dm755 contrib/ssh-copy-id "${pkgdir}"/usr/bin/ssh-copy-id
	install -Dm644 contrib/ssh-copy-id.1 "${pkgdir}"/usr/share/man/man1/ssh-copy-id.1

	# PAM is a common, standard feature to have
	sed -i	-e '/^#ChallengeResponseAuthentication yes$/c ChallengeResponseAuthentication no' \
		-e '/^#UsePAM no$/c UsePAM yes' \
		"${pkgdir}"/etc/ssh/sshd_config
pkgname="openssh-hardened"
}
