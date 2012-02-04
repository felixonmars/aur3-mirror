# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# Maintainer: Alexandre Chataignon <alexandre@xouillet.info>

pkgname=openssh-x509
_srcname=openssh
pkgver=5.8p1
pkgrel=9
pkgdesc="A Secure Shell server/client with Roumen Petrov's X509v3 patch"
arch=('i686' 'x86_64')
license=('custom:BSD')
url='http://www.openssh.org/portable.html'
backup=('etc/ssh/ssh_config' 'etc/ssh/sshd_config' 'etc/pam.d/sshd' 'etc/conf.d/sshd')
depends=('krb5' 'openssl' 'libedit')
source=("ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${_srcname}-${pkgver}.tar.gz"
        'http://roumenpetrov.info/openssh/x509-7.0/openssh-5.8p1+x509-7.0.diff.gz'
        'sshd.confd'
        'sshd.pam'
        'sshd')
sha1sums=('adebb2faa9aba2a3a3c8b401b2b19677ab53f0de'
          'aaed50180a1426ec4893b4a6d4d478cc3ea56a98'
          'ec102deb69cad7d14f406289d2fc11fee6eddbdd'
          '07fecd5880b1c4fdd8c94ddb2e89ddce88effdc1'
          '6b7f8ebf0c1cc37137a7d9a53447ac8a0ee6a2b5')
provides=('openssh')
conflicts=('openssh')

build() {
	cd "${srcdir}/${_srcname}-${pkgver}"

	patch -p1 -i ../openssh-5.8p1+x509-7.0.diff # Roumen Petrov's X509v3 patch.

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
		--disable-strip # stripping is done by makepkg

	make
}

package() {
	cd "${srcdir}/${_srcname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	install -Dm755 ../sshd "${pkgdir}"/etc/rc.d/sshd
	install -Dm644 ../sshd.pam "${pkgdir}"/etc/pam.d/sshd
	install -Dm644 ../sshd.confd "${pkgdir}"/etc/conf.d/sshd
	install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${_srcname}/LICENCE"

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
}
