# $Id: PKGBUILD 153965 2012-03-21 06:20:49Z pierre $
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# Contributor: Wolfgang Bumiller <fc2.oyho@fcrrq.ng> (rot13 encoded)

pkgname=openssh-xattr
_pkgname=openssh
pkgver=5.9p1
pkgrel=8
pkgdesc='Free version of the SSH connectivity tools with the xattr patch for sftp.'
arch=('i686' 'x86_64')
license=('custom:BSD')
url='http://www.openssh.org/portable.html'
backup=('etc/ssh/ssh_config' 'etc/ssh/sshd_config' 'etc/pam.d/sshd' 'etc/conf.d/sshd')
depends=('krb5' 'openssl' 'libedit')
provides=("$_pkgname=$pkgver-$pkgrel")
conflicts=("$_pkgname")
optdepends=('x11-ssh-askpass: input passphrase in X without a terminal')
source=("ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${_pkgname}-${pkgver}.tar.gz"
        'sshd.close-sessions'
        'sshd.confd'
        'sshd.pam'
        'sshd'
        'openssh-5.9p1_xattr.patch')
md5sums=('afe17eee7e98d3b8550cc349834a85d0'
         'd9d8829887482f137406d145230465f9'
         'e2cea70ac13af7e63d40eb04415eacd5'
         '0f494f12464e844654c53ac5da2323a5'
         'e44715d16fa16b586994fc1ffb6719f7'
         '110292211f3f6a40a95732947a2d1e7c')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	patch -Np1 -i "$srcdir/openssh-5.9p1_xattr.patch"

	./configure \
		--prefix=/usr \
		--libexecdir=/usr/lib/ssh \
		--sysconfdir=/etc/ssh \
		--with-privsep-user=nobody \
		--with-md5-passwords \
		--with-pam \
		--with-mantype=man \
		--with-xauth=/usr/bin/xauth \
		--with-kerberos5=/usr \
		--with-ssl-engine \
		--with-libedit=/usr/lib \
		--disable-strip # stripping is done by makepkg

	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	install -Dm755 ../sshd "${pkgdir}"/etc/rc.d/sshd
	install -Dm644 ../sshd.pam "${pkgdir}"/etc/pam.d/sshd
	install -Dm644 ../sshd.confd "${pkgdir}"/etc/conf.d/sshd
	install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENCE"
	install -Dm755 ../sshd.close-sessions "${pkgdir}/etc/rc.d/functions.d/sshd-close-sessions" # FS#17389

	rm "${pkgdir}"/usr/share/man/man1/slogin.1
	ln -sf ssh.1.gz "${pkgdir}"/usr/share/man/man1/slogin.1.gz

	install -Dm755 contrib/findssl.sh "${pkgdir}"/usr/bin/findssl.sh
	install -Dm755 contrib/ssh-copy-id "${pkgdir}"/usr/bin/ssh-copy-id
	install -Dm644 contrib/ssh-copy-id.1 "${pkgdir}"/usr/share/man/man1/ssh-copy-id.1

	sed \
		-e '/^#ChallengeResponseAuthentication yes$/c ChallengeResponseAuthentication no' \
		-e '/^#UsePAM no$/c UsePAM yes' \
		-i "${pkgdir}"/etc/ssh/sshd_config
}
