# Contributor: 3ED <krzysztof1987@gmail.com>
pkgbase=alsa-tools-emu10k1
pkgname=("alsa-tools-emu10k1" "alsa-tools-as10k1" "alsa-tools-ld10k1" "alsa-tools-sbiload")
pkgver=1.0.27
pkgrel=2
pkgdesc="ALSA tools package for emu10k1 sound cards"
url="http://alsa-project.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('alsa-lib' 'alsa-utils')
source=("ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${pkgver}.tar.bz2"
        "alsa-emu10k1d"
        "alsa-emu10k1d.conf")
sha256sums=('6562611b5a6560712f109e09740a9d4fa47296b07ed9590cb44139c5f154ada2'
            '4db2b08b8391b60bc4306977090562ba226761e7fcd3932d5780dbf8b34480ff'
            '7f6c82a038ed891fe706552baf401eec65b5b396634d217d8e6a9f1f37d45dfe')

build() {
  local i

  for i in as10k1 ld10k1 seq/sbiload
  do
    cd "$srcdir/alsa-tools-$pkgver/$i"
    ./configure --prefix=/usr --sbindir=/usr/bin
    make
  done
}

package_alsa-tools-emu10k1() {
  pkgdesc="ALSA tools package for emu10k1 sound cards"
  depends=('alsa-lib' 'alsa-utils' 'alsa-tools-ld10k1')
  optdepends=("alsa-tools-sbiload: An OPL2/3 FM instrument loader for ALSA sequencer")
  install=alsa-tools-emu10k1.install
  backup=(etc/rc.d/alsa-emu10k1d etc/conf.d/alsa-emu10k1d)

  # Old stuff! :< I don't use it anymore but someday I look at it..
  # If anyone have systemd service that's working well, please shed..
  install -dm755 "$pkgdir/etc/"{rc.d,conf.d}
	install -m 755 "$srcdir/alsa-emu10k1d" "$pkgdir/etc/rc.d/alsa-emu10k1d"
	install -m 644 "$srcdir/alsa-emu10k1d.conf" "$pkgdir/etc/conf.d/alsa-emu10k1d"
}

package_alsa-tools-as10k1() {
  pkgdesc="AS10k1 Assembler version A0.99"
  depends=('alsa-lib' 'alsa-utils')

  make -C "$srcdir/alsa-tools-$pkgver/as10k1/" DESTDIR="$pkgdir/" install
  find "$pkgdir/" -name '*.la' -type f -delete
}

package_alsa-tools-ld10k1() {
  pkgdesc="Attempt to make EMU10K1 (EMU10K2) patch loader for ALSA"
  depends=('alsa-lib' 'alsa-utils' 'alsa-tools-as10k1')
  optdepends=("alsa-tools-emu10k1-gui: dsp editor with gui (qt3 needed)")

  make -C "$srcdir/alsa-tools-$pkgver/ld10k1/" DESTDIR="$pkgdir/" install
  find "$pkgdir/" -name '*.la' -type f -delete
}

package_alsa-tools-sbiload() {
  pkgdesc="An OPL2/3 FM instrument loader for ALSA sequencer"
  depends=('alsa-lib' 'alsa-utils')

  make -C "$srcdir/alsa-tools-$pkgver/seq/sbiload/" DESTDIR="$pkgdir/" install
  find "$pkgdir/" -name '*.la' -type f -delete
}

#AUR:
pkgname=alsa-tools-emu10k1
pkgdesc="ALSA tools package for emu10k1 sound cards"
depends=('alsa-lib' 'alsa-utils')
