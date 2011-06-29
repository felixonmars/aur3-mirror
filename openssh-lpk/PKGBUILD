# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# Maintainer: Dan Vratil <dan@progdan.cz>

pkgname=openssh-lpk
_srcname=openssh
pkgver=5.8p2
pkgrel=1
pkgdesc='A Secure Shell server/client with LPK patch'
arch=('i686' 'x86_64')
license=('custom:BSD')
url='http://www.openssh.org/portable.html'
backup=('etc/ssh/ssh_config' 'etc/ssh/sshd_config' 'etc/pam.d/sshd' 'etc/conf.d/sshd')
depends=('tcp_wrappers' 'krb5' 'openssl' 'libedit')
provides=('openssh')
conflicts=('openssh')
source=("ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${_srcname}-${pkgver}.tar.gz"
	"http://gentoo.mirrors.tera-byte.com/distfiles/openssh-lpk-5.8p2-0.3.14.patch.gz"
        'authfile.c.patch'
        'sshd.confd'
        'sshd.pam'
        'sshd')

build() {
	cd "${srcdir}/${_srcname}-${pkgver}"

	patch -p1 -i ../openssh-lpk-5.8p2-0.3.14.patch 
	patch -p1 -i ../authfile.c.patch # fix FS#24693 using http://anoncvs.mindrot.org/index.cgi/openssh/authfile.c?revision=1.95

	./configure \
		--prefix=/usr \
		--libexecdir=/usr/lib/ssh \
		--sysconfdir=/etc/ssh \
		--with-tcp-wrappers \
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
md5sums=('0541579adf9d55abb15ef927048d372e'
         '8bec4d7496719f0bd890ac0a306163cb'
         'fbddd47a6abc3b90a86970e2486d6f03'
         'e2cea70ac13af7e63d40eb04415eacd5'
         '479b47d750ef6f62703ec75144eb9701'
         '0f286945d846f2ddd02bc4a4e14b0b85')
