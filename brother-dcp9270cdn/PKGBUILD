# Maintainer: Jonas Amstutz <jonas.amstutz@gmail.com>

pkgname=brother-dcp9270cdn
pkgver=1.1.1
pkgrel=3
pkgdesc="Brother cupd and lpd driver for DCP-9270CDN"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#DCP-9270CDN"
license=('custom')
install=(${pkgname}.install)

depends=('cups' 'ghostscript' 'gsfonts' 'tcsh')

source=(http://download.brother.com/welcome/dlf005575/dcp9270cdnlpr-$pkgver-5.i386.deb
        http://download.brother.com/welcome/dlf005577/dcp9270cdncupswrapper-$pkgver-5.i386.deb)

md5sums=('e895344fbdb77bc00a236ffc1f8abf59'
         '62d4418a83bc9d26ae3436d5fdd29500')
sha256sums=('c385aafc8a7fcb89afbdc8b1af50284b30059beec0128d096a6099399a011f64'
            'af538e452fdc2a91210d1a49469e08f65741192ca0d00ff8c004244b3630f149')

build() {
  srcdir="$startdir/src"
  mkdir -p "$srcdir" && cd "$srcdir"

  for i in $startdir/*.deb; do
    ar -x $i
    tar xzf data.tar.gz
  done
  
  echo "Replacing paths and file names in scripts:"
  for i in `egrep -rl "printcap.local" $srcdir/usr`
    do replace "printcap.local" "printcap" -- $i
  done;
}

package() {
  srcdir="$startdir/src"
  cd $srcdir

  cp -r "$srcdir/usr" "$pkgdir"

  install -d -m755 "$pkgdir/usr/bin"
  install -d -m755 "$pkgdir/usr/share"
}

