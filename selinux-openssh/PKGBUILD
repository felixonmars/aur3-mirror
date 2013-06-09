# $Id: PKGBUILD 186025 2013-05-20 14:49:38Z bisson $
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Maintainer: Nicky726 <Nicky726@gmail.com>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=selinux-openssh
_origname=openssh
pkgver=6.2p2
pkgrel=1
pkgdesc='Free version of the SSH connectivity tools with SELinux support'
arch=('i686' 'x86_64')
license=('custom:BSD')
url='http://www.openssh.org/portable.html'
backup=('etc/ssh/ssh_config' 'etc/ssh/sshd_config' 'etc/pam.d/sshd' 'etc/conf.d/sshd')
makedepends=('linux-selinux-headers')
depends=('krb5' 'openssl' 'libedit' 'ldns' 'selinux-usr-libselinux')
optdepends=('xorg-xauth: X11 forwarding'
            'x11-ssh-askpass: input passphrase in X')
conflicts=("${_origname}")
provides=("${_origname}=${pkgver}-${pkgrel}")
groups=('selinux' 'selinux-system-utilities')
source=("ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${_origname}-${pkgver}.tar.gz"
        'sshdgenkeys.service'
        'sshd@.service'
        'sshd.service'
        'sshd.socket'
        'sshd.pam')
sha1sums=('c2b4909eba6f5ec6f9f75866c202db47f3b501ba'
          '6df5be396f8c593bb511a249a1453294d18a01a6'
          '6a0ff3305692cf83aca96e10f3bb51e1c26fccda'
          '2d87de52a6b2f764180f9f67cb9747392784b4a5'
          'e12fa910b26a5634e5a6ac39ce1399a132cf6796'
          'd93dca5ebda4610ff7647187f8928a3de28703f3')

backup=('etc/ssh/ssh_config' 'etc/ssh/sshd_config' 'etc/pam.d/sshd')

install=install

build() {
	cd "${srcdir}/${_origname}-${pkgver}"

	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--libexecdir=/usr/lib/ssh \
		--sysconfdir=/etc/ssh \
		--with-ldns \
		--with-libedit \
		--with-ssl-engine \
		--with-pam \
		--with-privsep-user=nobody \
		--with-kerberos5=/usr \
		--with-xauth=/usr/bin/xauth \
		--with-mantype=man \
		--with-md5-passwords \
		--with-pid-dir=/run \
		--with-selinux

	make
}

check() {
	cd "${srcdir}/${_origname}-${pkgver}"

	make tests ||
	grep $USER /etc/passwd | grep -q /bin/false
	# connect.sh fails when run with stupid login shell
}

package() {
	cd "${srcdir}/${_origname}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	ln -sf ssh.1.gz "${pkgdir}"/usr/share/man/man1/slogin.1
	install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

	install -Dm644 ../sshdgenkeys.service "${pkgdir}"/usr/lib/systemd/system/sshdgenkeys.service
	install -Dm644 ../sshd@.service "${pkgdir}"/usr/lib/systemd/system/sshd@.service
	install -Dm644 ../sshd.service "${pkgdir}"/usr/lib/systemd/system/sshd.service
	install -Dm644 ../sshd.socket "${pkgdir}"/usr/lib/systemd/system/sshd.socket
	install -Dm644 ../sshd.pam "${pkgdir}"/etc/pam.d/sshd

	install -Dm755 contrib/findssl.sh "${pkgdir}"/usr/bin/findssl.sh
	install -Dm755 contrib/ssh-copy-id "${pkgdir}"/usr/bin/ssh-copy-id
	install -Dm644 contrib/ssh-copy-id.1 "${pkgdir}"/usr/share/man/man1/ssh-copy-id.1

	sed \
		-e '/^#ChallengeResponseAuthentication yes$/c ChallengeResponseAuthentication no' \
		-e '/^#PrintMotd yes$/c PrintMotd no # pam does that' \
		-e '/^#UsePAM no$/c UsePAM yes' \
		-i "${pkgdir}"/etc/ssh/sshd_config
}
