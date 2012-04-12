# Maintainer: Gabriel Chavez <gabrielchavez02 at gmail dot com>
pkgname=linuxtycoon
_pkgname=LinuxTycoon
pkgver=1.0b2.1
pkgrel=1
pkgdesc="Build and manage your own Linux Distro."
arch=('i686' 'x86_64')
url="http://lunduke.com/?page_id=2646"
license=('custom')

if [[ $CARCH = 'i686' ]]; then
    source=(linuxtycoon.deb)
    depends=('glibc>=2.3' 'expat>=1.95.8' 'glib2>=2.2.0' 
    'gtk2>=2.2.0' 'libcanberra>=0.22')
    md5sums="1caea958460675c08bbe86597b027c36"
else
    source=(linuxtycoon64.deb)
    md5sums="1a9a51c71030a12d6ba870aa0123cc83"
    depends=('lib32-glibc>=2.3' 'lib32-expat>=1.95.8' 'lib32-glib2>=2.2.0' 
    'lib32-gtk2>=2.2.0' 'lib32-libcanberra>=0.22')
fi

    optdepends=('libgtkhtml: Provides HTML')

if [[ ! -e $source ]]; then
    echo "You need to download the $source file from the developer"
fi

package() {
    msg "Extracting..."
    if [[ $CARCH = 'i686' ]]; then
        ar -xv linuxtycoon.deb || return 1
    else
        ar -xv linuxtycoon64.deb || return 1
    fi
    tar -xvf data.tar.gz || return 1
    msg2 "Done extracting!"
    msg "Moving files"
    mv $srcdir/opt $pkgdir
    mv $srcdir/usr $pkgdir
    msg2 "Done moving files"
}

