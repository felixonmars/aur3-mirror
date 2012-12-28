# Maintainer: Hubert Kario <hubert@kario.pl>

pkgname=instantclient-basic
_major=11
_minor=2
_application=0
_component=3
_platform=0
_dlDir=${_major}${_minor}${_application}${_component}
pkgver=$_major.$_minor.$_application.$_component.$_platform
pkgrel=1
pkgdesc="Oracle database basic client libraries"
arch=('i686' 'x86_64')
url=http://www.oracle.com/technetwork/database/features/instant-client/index-097480.html
license=('custom:OTN')
depends=()
provides=("instantclient=$_major" )
options=('!emptydirs')
_arch=; [ "$CARCH" = 'x86_64' ] && _arch=.x64
source=("manual_download://download.oracle.com/otn/linux/instantclient/11203/instantclient-basic-linux${_arch}-$pkgver.zip"
        LICENSE)
sha1sums=('8c52a7888df6c2655e81983e5921d017d5a65922'  # instantclient-basic-linux-11.2.0.3.0.zip
	  'd94b96308489ebc026c7dc62674a7a086b0bc5b3') # LICENSE
[ "$CARCH" = 'x86_64' ] && sha1sums[0]='53583b2af1efede910b1ef2a76708dab9563671f'  # instantclient-basic-linux.x64-11.2.0.3.0.zip 

PKGEXT=".pkg.tar"

package() {
    local dest=$pkgdir/opt/${pkgname%%-*}

    # copy files
    #local pkgver=${pkgver/./_}
    install -d "${dest%/*}" &&
    cp -a "$srcdir/${pkgname%%-*}_${_major}_${_minor}" "$dest" || return 1

    # create required symlinks
    cd "$dest" || return 1
    local lib link
    for lib in *.so*; do
        link=$lib
        while [[ ${link#*.} != so ]]; do
            link=${link%.*}
            ln -s $lib $link
        done
    done

    # fix permissions
    chmod a=rx,u+w * &&
    chmod a-x *_README *.jar || return 1

    # set ld path
    install -d "$pkgdir/etc/ld.so.conf.d" &&
    echo "/opt/instantclient" > "$pkgdir/etc/ld.so.conf.d/$pkgname.conf" || return 1

    install -Dm644 "$srcdir/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1

}
