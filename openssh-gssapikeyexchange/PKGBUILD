# $Id$
# Maintainer: cra <c6h10o5@gmail.com>
# Contributor: Daniel Funke <daniel.funke@student.kit.edu>
# 
# original openssh package by:
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=openssh-gssapikeyexchange
_basepkgname=openssh
pkgver=6.2p2
pkgrel=2
pkgdesc='OpenSSH patched to support GSSAPIKeyExchange option'
url='http://www.openssh.org/portable.html'
license=('custom:BSD')
arch=('i686' 'x86_64')
makedepends=('linux-headers')
depends=('krb5' 'openssl' 'libedit' 'ldns')
optdepends=('xorg-xauth: X11 forwarding'
            'x11-ssh-askpass: input passphrase in X')
conflicts=('openssh')
provides=('openssh=${pkgver}')
source=("ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${_basepkgname}-${pkgver}.tar.gz"
        'sshdgenkeys.service'
        'sshd@.service'
        'sshd.service'
        'sshd.socket'
        'sshd.pam'
        "openssh-${pkgver}-gsskex.patch")

backup=('etc/ssh/ssh_config' 'etc/ssh/sshd_config' 'etc/pam.d/sshd')

install=install

build() {
	cd "${srcdir}/${_basepkgname}-${pkgver}"

	patch -Np1 -i "${srcdir}/openssh-${pkgver}-gsskex.patch"

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

	make
}

package() {
	cd "${srcdir}/${_basepkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	ln -sf ssh.1.gz "${pkgdir}"/usr/share/man/man1/slogin.1.gz
	install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${_basepkgname}/LICENCE"

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

md5sums=('be46174dcbb77ebb4ea88ef140685de1'
         '1949e417ac269b8467f325c956c6d89d'
         '4659aa2be272db65bd77028dd133d822'
         '36db016390876526e5361f7c1d0ae169'
         '76f52c66fb3193f301fe0a666e047ab1'
         '9d71ea52cd15e9d7c172b7b71cb03bc0'
         '87a3c5e2d3ca7254f4f7c8670bf63b96')
