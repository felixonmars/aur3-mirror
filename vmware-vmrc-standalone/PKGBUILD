# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: mortzu <me@mortzu.de>

pkgname="vmware-vmrc-standalone"
pkgver="3.0.0_309851"
pkgrel="1"
pkgdesc="Standalone remote console for VMware Server."
arch=("i686" "x86_64")
url="https://github.com/vmware/rvc/downloads"
license=("custom")

case $CARCH in
  "x86_64")
    source=("https://github.com/downloads/vmware/rvc/vmware-vmrc-linux-x64-${pkgver/_/-}.xpi")
    sha1sums=("5611772e7bf240a2cd35f4d3eee431bdca7bf5e2") ;;
  "i686")
    source=("https://github.com/downloads/vmware/rvc/vmware-vmrc-linux-x86-${pkgver/_/-}.xpi")
    sha1sums=("67270328a705100f6af3cefaf36ba1b3c9cabb03") ;;
esac

source+=("vmware-vmrc-standalone.desktop" "configure-libaries.patch")
sha1sums+=("c1826fc6162ba39e75a77b96e2704b964ffa9363" "3dfb0ac8c4462b7408928d6d63e3bba681d3f74d")


prepare() {
  patch -p 1 -d "$srcdir" < "$srcdir/configure-libaries.patch"
}


package() {
  install -m 755 -d "$pkgdir/opt"
  cp -r "$srcdir/plugins" "$pkgdir/opt/$pkgname"

  install -m 755 -d "$pkgdir/usr/bin"
  for file in vmware-desktop-entry-creator vmware-vmrc vmware-vmrc-daemon vmware-vmrc-legacy; do
    ln -s "/opt/$pkgname/$file" "$pkgdir/usr/bin/$file"
  done

  install -Dm 644 "$srcdir/vmware-vmrc-standalone.desktop" "$pkgdir/usr/share/applications/vmware-vmrc-standalone.desktop"
  
  install -m 755 -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/opt/$pkgname/share/EULA.txt" "$pkgdir/usr/share/licenses/$pkgname"
}
