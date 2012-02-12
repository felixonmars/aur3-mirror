# readahead-fedora
# Maintainer: ying
# Contributor: ying

pkgname=readahead-fedora
pkgver=1.5.6
pkgrel=5
pkgreldiff=4
pkgdesc="Fedora's implementation of readahead to preload boot process files"
arch=("i686" "x86_64")
url="https://fedorahosted.org/readahead/"
license=('GPL')
depends=('gcc-libs' 'audit' 'util-linux-ng' 'initscripts')
makedepends=('quilt' 'autoconf' 'automake')
install=readahead-fedora.install
source=(http://ftp.de.debian.org/debian/pool/main/r/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz
http://ftp.de.debian.org/debian/pool/main/r/${pkgname}/${pkgname}_${pkgver}-${pkgreldiff}.diff.gz
readahead.conf
readahead
readahead-kill.sh
kill-readahead)

build() {
patch -p1 < ${pkgname}_${pkgver}-${pkgreldiff}.diff

cd "$srcdir/$pkgname-$pkgver"
export QUILT_PATCHES=../debian/patches
quilt push -a

sh autogen.sh
./configure --prefix=/usr --mandir=/usr/share/man

# fix error with make
sed -i "s|^dnl ||" scripts/Makefile

make || return 1
make DESTDIR="$pkgdir/" install

mkdir -p ${pkgdir}/etc/{readahead.d,profile.d,rc.d/functions.d}
mkdir -p ${pkgdir}/usr/bin
rm -rf ${pkgdir}/etc/{cron.daily,cron.monthly,default}

install -m 644 ${srcdir}/readahead.conf ${pkgdir}/etc/readahead.conf
install -m 755 ${srcdir}/readahead ${pkgdir}/etc/rc.d/functions.d/readahead
install -m 755 ${srcdir}/readahead-kill.sh ${pkgdir}/etc/profile.d/readahead-kill.sh
install -m 755 ${srcdir}/kill-readahead ${pkgdir}/usr/bin/kill-readahead
}



md5sums=('295d7ab128b2c8a1f0df2aeb7b6bccee'
         '7ecca5a4e8f3041281169b937ceaccfe'
         '0a421143daf5394f965d17cf2cf51512'
         '5349973297ad12b175c6ba1c4174a315'
         'ad1b4f398b0b5b2282036d4507b9c935'
         '1cb5ea0bf5ff867f2fdd73f23d7c3db4')
