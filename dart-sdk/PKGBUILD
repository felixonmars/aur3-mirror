# Maintainer: Claudio d'Angelis <claudiodangelis at gmail dot com>

pkgname=dart-sdk
pkgver=1.6.0
pkgrel=1
pkgdesc="Tools and libraries for Dart development"
arch=(i686 x86_64)
url="https://www.dartlang.org/tools/sdk/"
license=('BSD 3-Clause')
provides=('dart-sdk')
conflicts=('dart-sdk-dev' 'dart-editor')
makedepends=('unzip')

revision=39553
md5sum64=c3f34e58f097f35b58a2bd9d4bba485a
md5sum32=cd3aed7b21d525263ed5a399577581bb

if [[ ${CARCH} = x86_64 ]]; then
	source=("http://storage.googleapis.com/dart-archive/channels/stable/release/$revision/sdk/dartsdk-linux-x64-release.zip")
	md5sums=("$md5sum64")
else
	source=("https://storage.googleapis.com/dart-archive/channels/stable/release/$revision/sdk/dartsdk-linux-ia32-release.zip")
	md5sums=("$md5sum32")
fi

package() {

    cd $pkgdir

    mkdir -p opt/dart-sdk usr/bin usr/share/licenses/dart-sdk
    cp -r $srcdir/dart-sdk/* opt/dart-sdk

    find . -type f -exec chmod 644 "{}" \;
    find . -type d -exec chmod 755 "{}" \;

    chmod +x opt/dart-sdk/bin/*

    ln -s /opt/dart-sdk/bin/pub            usr/bin/pub
    ln -s /opt/dart-sdk/bin/dart           usr/bin/dart
    ln -s /opt/dart-sdk/bin/docgen         usr/bin/docgen
    ln -s /opt/dart-sdk/bin/dart2js        usr/bin/dart2js
    ln -s /opt/dart-sdk/bin/dartfmt        usr/bin/dartfmt
    ln -s /opt/dart-sdk/bin/dartanalyzer   usr/bin/dartanalyzer

    sed -n '2,4p' opt/dart-sdk/bin/dart2js > usr/share/licenses/dart-sdk/license

}
