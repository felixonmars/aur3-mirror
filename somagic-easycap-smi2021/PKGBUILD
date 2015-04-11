# Maintainer: David Manouchehri <david@davidmanouchehri.com>

pkgname=somagic-easycap-smi2021
_gitname=$pkgname
_gitbranch=master
_gitauthor=Manouchehri
pkgver=v0.0.1
pkgrel=1
pkgdesc="EasyCap driver module"
url="https://github.com/$_gitauthor/$_gitname"
license=('GPL')
source=("https://github.com/Manouchehri/smi2021/releases/download/v0.0.1/smi2021.ko.xz"
        "https://github.com/stevelacy/EasyCap/raw/master/somagic_firmware.bin")
validpgpkeys=('F0FE029614EA35BC9E4F9768A6ECFD0C40839755') # David Manouchehri
sha512sums=('2e636fa4b0e47ac441b40a6ace01348b35dde889e14d59568163889995484d20226f301880d8cdedb9c871c9f15032f96f566d1d374863e26daade53fc774177'
            '722128600bd982b1ff6af8e372e361d22ee872282aeab50b62d8769ad2ee08bb2c6612f59ba48736a26c2c47704a7e192af2746ac0746a074bc3aa242bffa712')
arch=('x86_64')
depends=('')
conflicts=("$pkgname-git")
provides=("$pkgname-git")

package() {
  _major=$(pacman -Q linux | grep -Po "\d+\.\d+")
  _extramodules=extramodules-$_major-ARCH
  _kernel=$(cat /usr/lib/modules/$_extramodules/version)
  install -Dm644 "$srcdir/smi2021.ko.xz" "$pkgdir/usr/lib/modules/$_extramodules/smi2021.ko.xz"
  install -Dm644 "$srcdir/somagic_firmware.bin" "$pkgdir/usr/lib/firmware/smi2021_3c.bin"
}

# vim:set sw=2 sts=2 et:
