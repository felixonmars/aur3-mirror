# Maintainer: Kevin Cox <kevincox.ca@gmail.com>
pkgname='cloudprint-server-systemd'
pkgver='1' # Just incrementing this every time the source changes.
pkgrel=1
pkgdesc='A systemd service file for starting Chromium in Google Cloud Print proxy mode.'
arch=('any')
url='https://support.google.com/chromeos/a/bin/answer.py?hl=en&answer=2616503'
license=('MIT style')
depends=('chromium')
makedepends=('unzip')

source=('cloudprint-server.service'
        'https://www.google.com/support/enterprise/static/chromeos/docs/admin/en/generate_cloudprint_config.py.zip'
        'generate_cloudprint_config.py.patch'
        'generate_cloudprint_config.sh')
sha1sums=('3008e6e48bcd5a488aeec8ec4059dfe01950c8f6'
          '17aacec9aa0f11e83d46e51593bff4789c7e7bad'
          '03bd608e4670b25d1b7089287f5ea77805a6a8c1'
          '07fe33bb4b8e7376b38b565a8e8d8a42c54ac0a1')


build() {
	unzip -o generate_cloudprint_config.py.zip
	patch generate_cloudprint_config.py generate_cloudprint_config.py.patch

	mkdir -p "$pkgdir/usr/lib/systemd/system/"
	mkdir -p "$pkgdir/usr/lib/cloudprint-server/"
	mkdir -p "$pkgdir/etc/cloudprint-server/connectors/"
	chmod 600 "$pkgdir/etc/cloudprint-server/"

	install -v -m 755 -t "$pkgdir/usr/lib/cloudprint-server/" *.py *.sh
	install -v -m 644 -t "$pkgdir/usr/lib/systemd/system/" *.service
}
