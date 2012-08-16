# Contributor: Truong Xuan Tinh (xuantinh at gmail dot com)

pkgname=elb-api-tools
pkgver=1.0.17.0
pkgrel=1
pkgdesc="The API tools serve as the client interface to the Elastic Load Balancing web service"
arch=('any')
url="http://aws.amazon.com/developertools/2536"
source=(http://ec2-downloads.s3.amazonaws.com/ElasticLoadBalancing.zip)
depends=(java-runtime)
license=('custom')
md5sums=('56844dcb2f5f78f9952f0e63259c4924')
install=$pkgname.install
_installDir=/opt/$pkgname
build() {
	cd $srcdir/ElasticLoadBalancing-$pkgver
	mkdir -p $pkgdir$_installDir
	# install lib i.e jar file
	cp -r lib $pkgdir$_installDir
	find $pkgdir -type f -exec chmod 644 {} \;

	# and install scripts
	cp -r bin $pkgdir$_installDir
	# Remove unneeded windows cmd files
	rm $pkgdir$_installDir/bin/*.cmd

	# install license files
	mkdir -p $pkgdir/usr/share/licenses/$pkgname/
	install -m 644 license.txt $pkgdir/usr/share/licenses/$pkgname/
	install -m 644 THIRDPARTYLICENSE.TXT $pkgdir/usr/share/licenses/$pkgname/
	install -m 600 credential-file-path.template $pkgdir/opt/$pkgname/credential-file
}

