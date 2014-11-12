# Maintainer: adminempire <jl adminempire com>
# Contributor: Nick Lanham (nick AT afternight DOT org)
# Contributor: Yejun Yang (yejunx AT gmail DOT com)
# Contributor: vwyodajl <donjuansjiz   GmaIL   com>
pkgname=ec2-api-tools
pkgver=1.7.1.3
pkgrel=1
pkgdesc="The API tools that serve as the client interface to the Amazon EC2 web service"
arch=('any')
url="http://aws.amazon.com/developertools/351"
source=("http://ec2-downloads.s3.amazonaws.com/$pkgname-$pkgver.zip")
depends=('java-environment' 'bash')
license=('custom')
sha512sums=('7d709dc8c644ebc640ecfa92b084325d9ad7405b967ddfa9557ef19a5954467acce1c0916891c8f522734ba91e483be2790c256794b7d21e1ad9e48db63bce09')

package() {
	cd "$srcdir"/"$pkgname"-"$pkgver"
	mkdir -p "$pkgdir"/usr/lib
	# install lib i.e jar file
	cp -r lib "$pkgdir"/usr/lib/ec2-api-tools
	find "$pkgdir" -type f -exec chmod 644 {} \;

	# fix env. var. in scripts
	sed -i 's#:?EC2_HOME is not set#:=/usr#' bin/*
	sed -i -e 's#:-EC2_HOME is not set#:=/usr#' \
		-e 's#:?JAVA_HOME is not set#:-/usr#' \
		-e 's#LIBDIR="${EC2_HOME}/lib"#LIBDIR="${EC2_HOME}/lib/ec2-api-tools"#' bin/ec2-cmd
	# and install scripts
	cp -r bin "$pkgdir"/usr
	# Remove unneeded windows cmd files
	rm "$pkgdir"/usr/bin/*.cmd

	# install license files
	mkdir -p "$pkgdir"/usr/share/licenses/"$pkgname"/
	install -m 644 license.txt "$pkgdir"/usr/share/licenses/"$pkgname"/
	install -m 644 THIRDPARTYLICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/
}

