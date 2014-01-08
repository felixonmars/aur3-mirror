pkgname=gcc-arm-none-eabi
_pkgver_periods=4.8
_pkgver_date_dash=2013-q4-major
_pkgver_major=4_8
_pkgver_minor=2013q4-20131204
_pkgver_actual=$_pkgver_major-$_pkgver_minor
pkgver=4_8_20131204
pkgrel=1
pkgdesc="GNU Tools ARM Embedded Processors (binary distribution, includes GDB and newlib)"
arch=('i686' 'x86_64')
if [ "${CARCH}" = "x86_64" ]; then
    depends=('lib32-ncurses' 'lib32-glibc')
else
    depends=('ncurses' 'glibc')
fi
provides=('arm-none-eabi-gcc'
    'arm-none-eabi-gdb'
    'arm-none-eabi-bintutils'
    'arm-none-eabi-addr2line'
    'arm-none-eabi-ar'
    'arm-none-eabi-as'
    'arm-none-eabi-c++'
    'arm-none-eabi-c++filt'
    'arm-none-eabi-cpp'
    'arm-none-eabi-elfedit '
    'arm-none-eabi-g++'
    'arm-none-eabi-gcc'
    'arm-none-eabi-gcc-4.8.3'
    'arm-none-eabi-gcc-ar'
    'arm-none-eabi-gcc-nm'
    'arm-none-eabi-gcc-ranlib'
    'arm-none-eabi-gcov'
    'arm-none-eabi-gdb'
    'arm-none-eabi-gdbtui'
    'arm-none-eabi-gprof'
    'arm-none-eabi-ld'
    'arm-none-eabi-ld.bfd'
    'arm-none-eabi-nm'
    'arm-none-eabi-objcopy'
    'arm-none-eabi-objdump'
    'arm-none-eabi-ranlib'
    'arm-none-eabi-readelf'
    'arm-none-eabi-size'
    'arm-none-eabi-strings'
    'arm-none-eabi-strip'
)
url="https://launchpad.net/gcc-arm-embedded"
source="https://launchpad.net/gcc-arm-embedded/$_pkgver_periods/$_pkgver_periods-$_pkgver_date_dash/+download/$pkgname-$_pkgver_actual-linux.tar.bz2"
license=('custom')
options=(!strip staticlibs)
md5sums=("4869e6a6e1dc11ea0835e8b8213bb194")

package() {
    mkdir -p $pkgdir/usr
    cd $srcdir/gcc-*
    cp -a * $pkgdir/usr
}
