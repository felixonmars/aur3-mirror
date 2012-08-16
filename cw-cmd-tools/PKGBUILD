# Contributor: Truong Xuan Tinh (xuantinh at gmail dot com)

pkgname=cw-cmd-tools
pkgver=1.0.12.1
pkgrel=1
pkgdesc="The Command Line Tool serves as the client interface to the CloudWatch web service"
arch=('any')
url="http://aws.amazon.com/developertools/2534"
source=(http://ec2-downloads.s3.amazonaws.com/CloudWatch-2010-08-01.zip)
depends=(java-runtime)
license=('custom')
md5sums=('2c8fb900beab1450db334f8b09811d98')
install=$pkgname.install
_installDir=/opt/$pkgname
build() {
	cd $srcdir/CloudWatch-$pkgver
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

