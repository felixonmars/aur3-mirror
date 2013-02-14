# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Adam Nielsen <malvineous@shikadi.net>
# Contributor: Vitaliy Berdinskikh ur6lad[at]archlinux.org.ua
# Contributor: Andrea Agosti <cifvts@gmail.com>
# Contributor: Charles Clement <caratorn@gmail.com>
# Contributor: Geraldo Augusto Vecchiato <geraldoav@gmail.com>

_pkgname=basic
pkgname=lib32-oracle-instantclient-${_pkgname}10
pkgver=10.2.0.5.0
pkgrel=1
pkgdesc="Light replacement for the Oracle client (files to run OCI, OCCI and JDBC-OCI programs)"
arch=(i686 x86_64)
url=http://www.oracle.com/technetwork/database/features/instant-client/
license=(custom:OTN)
depends=(gcc-libs lib32-libaio)
conflicts=(oracle-instantclient-basic)
replaces=(instantclient-basic instantclient-basiclite)
options=(!strip)

# These are the only files we want to include in the source package
source=(LICENSE
    oracle.sh)
sha256sums=('f904a30b07ddf7806a33620f93b94c3d315154d26a371ece48695bb3555064a2'
    '36b5ab97950f1667403dd9b59c3cad25d8f9e457702feaece835d1bff7c971c9')
sha512sums=('5c1b233154f0f9546a9f4d87f6a17715814af46c849e734aabcd8a4417e5067753e780cb90aeb4b8e1fa2c04e5c083bb25b5ce8804c58239b5241f528b11806f'
    'f87a23a6d74991afbe457cb00f8f1cb6b9c7534faf4650a68c8af5de6bda492ebc1dd18a6d06a39d1059bfea9d824e4770b03ead8b6988d5b45ac4fed1a97d83')


# Skip the next bit if we're building a source package for AUR, as we don't
# want these files included.
if [[ $SOURCEONLY != 1 ]]; then
    source+=($_pkgname-$pkgver-linux.zip)
    sha256sums+=('22fbb04eb6ca1957d2013d9fa5893288e1952ec9425bf14c8a9e1adb72c7df5e')
    sha512sums+=('193ac8289abfdbe2312f32a1f319a4d5c85490c31b0c0345fad2a9f14004062b73e7b1c877defde8863f150a47b2f2c444845e851519abfc41fb72565e8bd173')

        # Warn the user if they haven't downloaded the file already
    if [[ ! -f "${source[2]}" ]]; then
        error "You need to download ${source[2]}"
        echo
        msg2 "This software cannot be downloaded automatically.  You will need to sign up"
        msg2 "for an Oracle account and download the software from Oracle directly.  Place"
        msg2 "the downloaded file in the same directory as the PKGBUILD and re-run makepkg."
        msg2 ""
        msg2 "The source .zip file can be downloaded from:"
        msg2 ""
        msg2 "http://www.oracle.com/technetwork/topics/linuxsoft-082809.html"
        echo
        exit 1
    fi
fi

package() {
    local _libdir
    [[ $CARCH == "i686" ]] && _libdir=lib || _libdir=lib32

    cd "$srcdir/instantclient_10_2/"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/$_libdir"
    install -m 755 -t "$pkgdir/usr/bin" genezi
    install -m 755 -t "$pkgdir/usr/$_libdir" *.so*
    install -m 644 -t "$pkgdir/usr/$_libdir" *.jar

        # Copy across the script to set environment variables
    install -Dm755 "$srcdir/oracle.sh" "$pkgdir/etc/profile.d/oracle.sh"

        # create required symlinks
    cd "$pkgdir/usr/$_libdir"
    local lib link
    for lib in *.so*; do
        link=$lib
        while [[ ${link#*.} != so ]]; do
            link=${link%.*}
            ln -s $lib $link
        done
    done

    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
