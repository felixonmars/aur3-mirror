# $Id: PKGBUILD 143646 2011-11-28 00:51:51Z bisson $
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Maintainer: Nicky726 <Nicky726@gmail.com>
# Maintainer: Max Fierke <max@maxfierke.com>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=openssh-dnsval
_origname=openssh
pkgver=5.9p1
pkgrel=5
pkgdesc='OpenSSH with DNSSEC-tools.org patches for local DNSSEC validation'
arch=('i686' 'x86_64')
license=('custom:BSD')
url='http://www.openssh.org/portable.html'
backup=('etc/ssh/ssh_config' 'etc/ssh/sshd_config' 'etc/pam.d/sshd' 'etc/conf.d/sshd')
depends=('krb5' 'openssl' 'libedit' 'dnssec-tools')
optdepends=('x11-ssh-askpass: input passphrase in X without a terminal')
options=(!buildflags)
conflicts=("${_origname}")
provides=("${_origname}=${pkgver}-${pkgrel}")
source=("ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${_origname}-${pkgver}.tar.gz"
		'openssh-dnssec.patch'
        'sshd.confd'
        'sshd.pam'
        'sshd')
md5sums=('afe17eee7e98d3b8550cc349834a85d0'
         '3fffa84b7dc037631bc0bc20b980676c'
         'e2cea70ac13af7e63d40eb04415eacd5'
         '0f494f12464e844654c53ac5da2323a5'
         'e44715d16fa16b586994fc1ffb6719f7')
sha1sums=('ac4e0055421e9543f0af5da607a72cf5922dcc56'
          '26638a78862a1c758d2ad509e1483a3cb3b34bfa'
          'ec102deb69cad7d14f406289d2fc11fee6eddbdd'
          '3413909fd45a28701c92e6e5b59c6b65346ddb0f'
          '21fa88de6cc1c7912e71655f50896ba17991a1c2')


build() {
	cd "${srcdir}/${_origname}-${pkgver}"

	patch -Np1 -i "${srcdir}/openssh-dnssec.patch"
	
	autoconf
	
	autoheader
	
	./configure --prefix=/usr --libexecdir=/usr/lib/ssh --sysconfdir=/etc/ssh --with-privsep-user=nobody --with-md5-passwords --with-pam --with-mantype=man --with-xauth=/usr/bin/xauth --with-kerberos5=/usr --with-ssl-engine --with-libedit=/usr/lib --disable-strip --with-local-dnssec-validation

	make
}

package() {
	cd "${srcdir}/${_origname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	install -Dm755 ../sshd "${pkgdir}"/etc/rc.d/sshd
	install -Dm644 ../sshd.pam "${pkgdir}"/etc/pam.d/sshd
	install -Dm644 ../sshd.confd "${pkgdir}"/etc/conf.d/sshd
	install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${_origname}/LICENCE"

	rm "${pkgdir}"/usr/share/man/man1/slogin.1
	ln -sf ssh.1.gz "${pkgdir}"/usr/share/man/man1/slogin.1.gz

	# additional contrib scripts that we like
	install -Dm755 contrib/findssl.sh "${pkgdir}"/usr/bin/findssl.sh
	install -Dm755 contrib/ssh-copy-id "${pkgdir}"/usr/bin/ssh-copy-id
	install -Dm644 contrib/ssh-copy-id.1 "${pkgdir}"/usr/share/man/man1/ssh-copy-id.1

	# PAM is a common, standard feature to have
	sed \
		-e '/^#ChallengeResponseAuthentication yes$/c ChallengeResponseAuthentication no' \
		-e '/^#UsePAM no$/c UsePAM yes' \
		-i "${pkgdir}"/etc/ssh/sshd_config
	echo 'Host *' >> "${pkgdir}"/etc/ssh/ssh_config	
	echo '	VerifyHostKeyDNS ask' >> "${pkgdir}"/etc/ssh/ssh_config
	echo '	StrictDnssecChecking ask' >> "${pkgdir}"/etc/ssh/ssh_config
	echo '	AutoAnswerValidatedKeys yes' >> "${pkgdir}"/etc/ssh/ssh_config
}

sha256sums=('8d3e8b6b6ff04b525a6dfa6fdeb6a99043ccf6c3310cc32eba84c939b07777d5'
            'f8f97f8fee4be85db229fea3326ed484cb091b27bf5575f56f1e01ab5957d04c'
            '4eab4e844567c5bd3b6102658f2a2592164c783f9657cdd689f48e546f6b17f1'
            'eaef9d761629ee4c7c99a9f29b7ed88907d37b6dae4bc0a8472600c7b86bdcb0'
            '6660406d761f76106fc2de1d643051686fa05709af335b75b46180e789eea685')
sha384sums=('5af9bef16d964ba664fdaed53f5f7749f05991e5c90c04fa3ce3290ff85e76f201870b17dc1a5c1dc8b099d5f7bf549b'
            '1e91c115f7c6683df489349d873acc36664cbd548d26ca98659150e496213521aa4908c4d46bec580260b73a5dd4e3dc'
            '5d3c8dd52a30efb6f54bdca4a7e54c4392853a3ba9e40a241a1f848fd7890a8efc59a59ab97a97c17f44d55f3763dd32'
            '48e1fcb29bec9a2af163e56784d368cbef1dc9d35e8401f4eae9290a6c01160215d0c62082b93b177a4766b743168999'
            '2dafeb1d013431f09de7fb31f0f27382fb12c392fbb278d7fbc10a1aabcc5cfc5fe21f575e9fc2b73f101cc77b3d1f9e')
sha512sums=('ccf13e3cb11489f9f7e4788f93ffae1f2c39d48819f0e9cd9197842abc922173d2c3c1ad1a87a2acf4497d67cb9edd48416098388fa33fc0b8e09456b1be7e2f'
            '62cde1d3ead74a94f8ce33d42748323d5df79be865b01ea1a11665b0fa5dbb0b06d2e5eb55a918c15a95a6cb8b806896dd67f563eb8b80e2dc577e684499772b'
            'c3b771778a62c0eeadd56994a0a9863fc16945a9e1b10b747dc5985463fb27028b3bdc1fd2b101db0d8cc6ad9ba42a145bd4c6eae561f50e49093bd8e8d84c96'
            '003f11d44fb3d2f7b203a75da86bc8ce2e963cb643f242f685414a2e58ee0429802365373d60543dad32e1d9faa9e986db88351b3e34ab24bae54dce2e0101db'
            '132399ccbfc9b6fd0aa53bed8390a56035a4dd95d0e860e4a231e1805aaa442405b8442a6715de67aecf864aa9ade3d4125c707264864c971f9537064048d0af')

