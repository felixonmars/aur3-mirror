# Maintainer: Yanis Benson <yanis.benson@gmail.com>
pkgname=haxe-bin
pkgver=2.10
pkgrel=1
pkgdesc="HaXe (pronounced as hex) is an open source programming language, multiple backends, mostly web-targeted."
url="http://haxe.org/"
license=('GPL')
arch=("i686" "x86_64")


[[ "$CARCH" = "i686" ]]   && depends=("neko>=1.8.2" "glibc" "zlib")
[[ "$CARCH" = "x86_64" ]] && depends=("neko>=1.8.2" "lib32-glibc" "lib32-zlib")

makedepends=()
conflicts=()

replaces=("haxe")
provides=("haxe=$pkgver.$pkgrel")
source=(
  "http://haxe.org/file/haxe-$pkgver-linux.tar.gz"
  )
md5sums=(
  "5c8f343afbb141b76773e663ce1ad334"
  )


build() {
  cd haxe-$pkgver-linux
  mkdir -p $pkgdir/usr/share/doc/haxe
  cp -rf doc/* $pkgdir/usr/share/doc/haxe

  mkdir -p $pkgdir/usr/bin
  cp haxe haxelib haxedoc $pkgdir/usr/bin

  mkdir -p $pkgdir/opt/haxe
  cp -rf std $pkgdir/opt/haxe/
  }
