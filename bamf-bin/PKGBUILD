# Contributor: Dan Serban
# Contributor: Ner0

pkgname=bamf-bin
pkgver=0.2.122
pkgrel=1
pkgdesc="Removes the headache of applications matching into a simple DBus daemon and c wrapper library (Ubuntu prebuilt)"
arch=('i686' 'x86_64')
url="https://launchpad.net/bamf"
license=('GPL3')
provides=("bamf=$pkgver")
conflicts=('bamf' 'bamf-bzr' 'libbamf-bzr')

if [[ "$CARCH" == 'i686' ]]; then
  _arch=i386
  _soarch=i386
  md5sums=('6b8cb9c655642b0dae4d8829c94999a5' '53db1e7e1023226c818fa8d16c018fa8' 'ee24f2afd9a7f86a7f6f245c81da0b76')
elif [[ "$CARCH" == 'x86_64' ]]; then
  _arch=amd64
  _soarch=x86_64
  md5sums=('1d14086460bbaa79710c29f891993a94' '42076db287b2c956f62d999afc3e4dc6' '46e530179a4a932bba3fb503598516e8')
fi

source=("https://launchpad.net/ubuntu/+archive/primary/+files/bamfdaemon_$pkgver-0ubuntu1_$_arch.deb"
	"https://launchpad.net/ubuntu/+archive/primary/+files/libbamf3-0_$pkgver-0ubuntu1_$_arch.deb"
	"https://launchpad.net/ubuntu/+archive/primary/+files/libbamf3-dev_$pkgver-0ubuntu1_$_arch.deb")
noextract=(${source[@]##*/})

package() {
  for i in *.deb; do
    bsdtar -xf "$i" data.tar.gz
    tar -xf data.tar.gz -C "$pkgdir/"
    rm -f data.tar.gz
  done

  mv "$pkgdir/usr/lib/$_soarch-linux-gnu"/* "$pkgdir/usr/lib/"
  rm -rf "$pkgdir/usr/lib/$_soarch-linux-gnu"

  sed -i "s/\/lib\/$_soarch-linux-gnu/\/lib/" "$pkgdir/usr/lib/pkgconfig/libbamf3.pc"
}
