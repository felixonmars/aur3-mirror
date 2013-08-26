# Maintainer: Radim Kolar <hsn@sendmail.cz>
# Contributor: Marko Tasic <mtasic85@gmail.com>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Konstantin Nikiforov <helllamer@gmail.com>
# Thanks to Alper Kanat <alperkanat@raptiye.org> for cassandra rc.d script. 

# check() function is used to verify GPG signature. check() imports 3 keys into your GPG keyring at first build.
# See http://scarybeastsecurity.blogspot.com/2011/07/alert-vsftpd-download-backdoored.html for reason of this step.
# If you have problems with gpg, you can remove check() function, and all will be ok.

pkgname=cassandra-10
pkgname2=cassandra
pkgver=1.0.12
pkgrel=1
pkgdesc="Scalable NoSQL database (1.0 branch)"
arch=('any')
url="http://cassandra.apache.org/"
license=('APACHE')
depends=('java-runtime-headless>=6')
conflicts=('cassandra' 'cassandra-11')
makedepends=('gnupg' 'curl' 'ca-certificates')
url_tgz="http://apache.mirror.anlx.net/$pkgname2/$pkgver/apache-$pkgname2-$pkgver-bin.tar.gz"
url_sig="http://www.apache.org/dist/$pkgname2/$pkgver/apache-$pkgname2-$pkgver-bin.tar.gz.asc"
source=($url_tgz 
        cassandra.service.systemd
        cassandra.install
        stacksize.patch
)
install=cassandra.install
sha1sums=('2b9ec3e78ca7b64cace82cfbb50492c82794b2cb'
	  '99486723062d07bfba971156b3cfa52ac23a6644'
	  '398b8c62ebad1e17e30d9d4aedae67fec00e8d0d'
	  'aed096750f4671d174514d18fbf3bc387f0584ab'
)
options=(!strip)
backup=(usr/share/cassandra/conf/cassandra.yaml)
## to check gpg signature
check() {
	msg "Checking GPG signature..."
        msg2 "(To disable gpg-check: remove/rename check() function from/in PKGBUILD code.)"
	gpg --list-keys | grep 'sylvain@datastax.com' || {
		url_keys='https://www.apache.org/dist/cassandra/KEYS'
		msg "No maintainers' GPG keys found. Importing from $url_keys ..."
		curl --silent -o - $url_keys | gpg --import -
	}
	# no need to add signature to package dependences
	echo "Downloading signature from $url_sig"
	curl --silent -o - "$url_sig" | gpg --verify - "apache-$pkgname2-$pkgver-bin.tar.gz"
	msg2 "Detached GPG signature is valid."
}

prepare() {
	  cd $srcdir/apache-cassandra-${pkgver}
	  patch -p0 -i "$srcdir/stacksize.patch"
}

package() {
    install -D -m644 ${srcdir}/cassandra.service.systemd \
                 ${pkgdir}/lib/systemd/system/cassandra.service

	cd $srcdir/apache-cassandra-${pkgver}

	mkdir -p ${pkgdir}/var/{lib,log}/cassandra
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/cassandra

	sed -i 's_`dirname $0`/.._/usr/share/cassandra_' bin/cassandra.in.sh

	chown http:http ${pkgdir}/var/{lib,log}/cassandra
        chown http:log ${pkgdir}/var/log/cassandra

	cp -a {lib,conf,interface} ${pkgdir}/usr/share/cassandra/

	cd bin

	install \
		cassandra \
		cassandra-cli \
		json2sstable \
		nodetool \
		sstable2json \
		sstablekeys \
		${pkgdir}/usr/bin/

	install \
		cassandra.in.sh \
		${pkgdir}/usr/share/cassandra/
}
