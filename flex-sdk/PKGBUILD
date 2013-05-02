# Maintainer: Michał Górny <zrchos+arch@gmail.com>
# Contributor: Ryan Lee <ryan@swyro.com>

pkgname=flex-sdk
pkgver=4.6.0.23201
pkgrel=2
pkgdesc="Free open source framework for building and deploying web apps based on Adobe Flash"
arch=('i686' 'x86_64')
url="http://www.adobe.com/products/flex/"
license=('custom:Flex SDK License Agreement' 'MPL')
depends=('flashplugin')
source=('http://fpdownload.adobe.com/pub/flex/sdk/builds/flex4.6/flex_sdk_4.6.0.23201B.zip' 'flex_sdk.sh')
install="flex_sdk.install"
options=("!strip")
md5sums=('202bca98ee7b8db9cda3af01e99c688e'
		 '496fa1da44083a857cc4bf9123fe4a19')

package() {

	_APP_DIR=$pkgdir/opt/$pkgname
	_LICENSE_DIR=$pkgdir/usr/share/licenses/$pkgname
	_PROFILE_DIR=$pkgdir/etc/profile.d
	_DOC_DIR=$pkgdir/usr/share/doc/$pkgname

	cd $srcdir

	# copying package files
	msg "Copying package files..."
	mkdir -p $_APP_DIR || return 1
	install -m644 flex-sdk-description.xml $_APP_DIR || return 1
	cp -r ant $_APP_DIR || return 1
	cp -r asdoc $_APP_DIR || return 1
	cp -r bin $_APP_DIR || return 1
	cp -r frameworks $_APP_DIR || return 1
	cp -r lib $_APP_DIR || return 1
	cp -r samples $_APP_DIR || return 1
	cp -r templates $_APP_DIR || return 1
	chmod -R 0755 $_APP_DIR || return 1

	# copying license information
	msg "Copying license information..."
	mkdir -p $_LICENSE_DIR || return 1
	install -m644 license-adobesdk.htm $_LICENSE_DIR || return 1
	install -m644 license-adobesdk-fr.htm $_LICENSE_DIR || return 1
	install -m644 license-mpl.htm $_LICENSE_DIR || return 1
	install -m644 "AIR SDK license.pdf" $_LICENSE_DIR || return 1

	# copying documentation
	msg "Copying documentation..."
	mkdir -p $_DOC_DIR || return 1
	install -m644 "AIR SDK Readme.txt" $_DOC_DIR || return 1
	install -m644 readme.htm $_DOC_DIR || return 1

	# copying profile script
	msg "Copying profile script..."
	mkdir -p $_PROFILE_DIR || return 1
	install -m755 "$srcdir/flex_sdk.sh" $_PROFILE_DIR || return 1

	# running dos2unix (available in hd2u package) on certain files
	# dos2unix $_APP_DIR/bin/aasdoc
	# contributed by bubla, thanks!
	msg "Running dos2unix..."
	sed -i -e 's/\r$//' $_APP_DIR/bin/aasdoc || return 1

	# removing any left out exe files
	# contributed by bubla, thanks!
	msg "Removing any left out exe files..."
	find $_APP_DIR -name "*.exe" -exec rm '{}' \; || return 1

	# removing any left out bat files
	# contributed by coverslide, thanks!
	msg "Removing any left out bat files..."
	find $_APP_DIR -name "*.bat" -exec rm '{}' \; || return 1

	# removing bin/adl since it's a Mac OS X binary
	# and to prevent conflict with Air's adl binary
	msg "Removing bin/adl for future conflicts..."
	rm $_APP_DIR/bin/adl || return 1
}

