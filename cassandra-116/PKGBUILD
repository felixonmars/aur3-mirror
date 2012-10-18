# Contributor: Marko Tasic <mtasic85@gmail.com>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Maintainer: Konstantin Nikiforov <helllamer@gmail.com> 
# Thanks to Alper Kanat <alperkanat@raptiye.org> for cassandra rc.d script. 

# check() function is used to verify GPG signature. check() imports 3 keys into your GPG keyring at first build.
# See http://scarybeastsecurity.blogspot.com/2011/07/alert-vsftpd-download-backdoored.html for reason of this step.
# If you have problems with gpg, you can remove check() function, and all will be ok.

pkgname=cassandra-116
pkgname2=cassandra
pkgver=1.1.6
pkgrel=1
pkgdesc="NoSQL database (precompiled official version)"
arch=('any')
url="http://cassandra.apache.org/"
license=('APACHE')
depends=('java-runtime')
makedepends=('gnupg' 'wget' 'ca-certificates')
url_tgz="http://apache.mirror.anlx.net/$pkgname2/$pkgver/apache-$pkgname2-$pkgver-bin.tar.gz"
source=($url_tgz cassandra)
md5sums=('ea55f265d131cd1e0edf9503b3b9aadc'
         '19d01c3e8c967fa4fc4456f53b36f9fd')

## to check gpg signature
check() {
	msg "Checking GPG signature..."
        msg2 "(To disable gpg-check: remove/rename check() function from/in PKGBUILD code.)"
	gpg --list-keys | grep 'sylvain@datastax.com' || {
		url_keys='https://www.apache.org/dist/cassandra/KEYS'
		msg "No maintainers' GPG keys found. Importing from $url_keys ..."
		wget --quiet -O - $url_keys | gpg --import -
	}
	# no need to add signature to package dependences
	echo "$url_tgz.asc"
	wget --quiet -O - "$url_tgz.asc" | gpg --verify - "apache-$pkgname2-$pkgver-bin.tar.gz"
	msg2 "Detached GPG signature is valid."
}

package() {
    install -D -m755 cassandra $pkgdir/etc/rc.d/cassandra

	cd $srcdir/apache-cassandra-${pkgver}

	mkdir -p ${pkgdir}/var/{lib,log}/cassandra
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/cassandra

	sed -i 's_`dirname $0`/.._/usr/share/cassandra_' bin/cassandra.in.sh

	chown http:http ${pkgdir}/var/{lib,log}/cassandra

	cp -a {lib,conf,interface} ${pkgdir}/usr/share/cassandra/

	cd bin

	install \
		cassandra \
		cassandra-cli \
		json2sstable \
		nodetool \
		sstable2json \
		sstablekeys \
		stop-server \
		${pkgdir}/usr/bin/

	install \
		cassandra.in.sh \
		${pkgdir}/usr/share/cassandra/
}
