# Contributor: Adam Hani Schakaki (krzd) <krzd@krzd.net>
pkgname=brother-mfc5490cn-cupswrapper
_printer=mfc5490cn
pkgver=1.1.2_2
pkgrel=2
pkgdesc="LPR-to-CUPS wrapper for Brother MFC-5490CN multifunction network printer"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('gpl')
optdepends=('cups: useless otherwise' 'brother-mfc5490cn-lpr>=1.1.2_2: needed to print')
makedepends=('binutils')
provides=("$pkgname=${pkgver%_*}")
conflicts=("$pkgname")
replaces=("$pkgname")
install="$pkgname.install"
source=("http://www.brother.com/pub/bsc/linux/dlf/${_printer}cupswrapper-${pkgver/_/-}.i386.deb")
md5sums=('285c81c3e86fd1217f53cc908c0d8bcf')

build() {
  cd $srcdir
  # Extract the archive
  ar x ${_printer}cupswrapper-${pkgver/_/-}.i386.deb || return 1
  mkdir data
  tar -xzvf data.tar.gz -C data || return 1
  # Fix the directory structure. Moves /usr/local/Brother to /usr/share/brother and fix links
  mkdir -p data/usr/share
  mv data/usr/local/Brother data/usr/share/brother
  rm -r data/usr/local
  sed -i 's|/usr/local/Brother|/usr/share/brother|g' `grep -lr '/usr/local/Brother' data/` || return 1
  sed -i 's|/etc/init.d|/etc/rc.d|' "data/usr/share/brother/Printer/${_printer}/cupswrapper/cupswrapper${_printer}" || return 1
  # copy into place
  cp -r data/usr $pkgdir || return 1
}

