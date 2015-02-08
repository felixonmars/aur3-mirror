# Maintainer: Matías Aereal Aeón <aereal[at]gmail[dot]com>
# Contributor: Korantin <korantin[at]infobytesec[dot]com>

pkgname=faraday-git
pkgver=b8ac560
pkgrel=1
pkgdesc='Faraday, an Integrated Penetration-Test Environment.'
arch=('any')
url=('http://faradaysec.com')
license=('GPLv3')
depends=('python2' 'python2-whoosh' 'pyqt3' 'python2-mockito' 
'python2-couchdbkit' 'python2-flask' 'python2-restkit' 'python2-ipy' 
'python2-requests' 'python2-tornado' 'python2-dateutil')
provides=('faraday')
conflicts=() 
makedepends=('git')
options=('!strip')
source=('git://github.com/infobyte/faraday.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/faraday"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g' | cut -f1-3 -d.
}

build() {
    # Setting the right _helpers.so
    faraday_platform=`uname -m` 
    faraday_base="$srcdir/faraday"
    faraday_os=`uname -s`

    if [ $faraday_platform == i386 ] || [ $faraday_platform == i686 ]; then
        if [ $faraday_os == Darwin ]; then
            cp $faraday_base/shell/core/_helpers.so.darwin $faraday_base/shell/core/_helpers.so
        else
            cp $faraday_base/shell/core/_helpers.so.i386 $faraday_base/shell/core/_helpers.so
        fi
    elif [ $faraday_platform == x86_64 ] || [ $faraday_platform == ia64 ]; then
        if [ $faraday_os == Darwin ]; then
            cp $faraday_base/shell/core/_helpers.so.darwin $faraday_base/shell/core/_helpers.so
        else
            cp $faraday_base/shell/core/_helpers.so.amd64 $faraday_base/shell/core/_helpers.so
        fi
    else
        exit 0
    fi
}

package() {
    cd "$srcdir/faraday"  

    # Base directories.
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/opt/faraday"
    cp -R --no-preserve=ownership * "$pkgdir/opt/faraday"

cat > "$pkgdir/usr/bin/faraday" << EOF
#!/bin/bash
cd /opt/faraday
./faraday "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/faraday"
}