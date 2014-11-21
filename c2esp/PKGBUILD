# Maintainer: Gerry2k5 <aur at gerry2k5 dot com>
# Contributor: flan_suse

# CUPS printer drivers for Kodak ESP and HERO series.

# Taken from the README of the SourceForge project page:
# As 2.6 but with ppd entries for ESP 1.2 and ESP 3.2. The drv files are now installed instead of the ppd files.
# The jbig library is no longer shipped with c2esp. ShortNickName added to the drv files to pass more ppdc tests.
# The compile and install system has been changed to autoconf/automake.

# Try building and installing the cups-usblp PKGBUILD from
# the AUR if you have problems with CUPS detecting the
# printer via a USB connection.

# There is no included .install file to restart the cups
# service, since doing so may interrupt a print queue. Be
# sure to restart the cups service after installing or
# updating this driver.

# sudo rc.d restart cups
# or
# sudo systemctl restart cups.service

pkgname=c2esp
pkgver=27
pkgrel=1
pkgdesc="CUPS printer driver for Kodak ESP and HERO printers"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/cupsdriverkodak/"
license=('GPL2')
depends=('cups' 'jbigkit')
source=("http://downloads.sourceforge.net/cupsdriverkodak/$pkgname-$pkgver.tar.gz")
md5sums=('dd63fb1aa1c551ecfd1f3c585b36db74')

build() {

    # Move into the source directory
    cd "$srcdir/$pkgname-$pkgver/"

    # Compile the cups driver
    ./configure
    make
}

package() {

    # Move into the source directory
    cd "$srcdir/$pkgname-$pkgver/"

    # Install the files
    make DESTDIR="${pkgdir}/" install

}

