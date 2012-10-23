# Contributor: fnord0 < fnord0 AT riseup DOT net >

pkgname=alienfx-lite
_pkgname=alienFX-lite
pkgver=0.4b
pkgrel=2
pkgdesc="a simple cross-platform Java applet that interacts with the AlienFX device on Alienware laptops and computers - create profiles, set the AlienFX lightning, and colors. Tested on Alienware m11x, m15x, and m17x."
arch=('i686' 'x86_64')
url="http://forum.notebookreview.com/alienware/458528-alienfx-lite-linux-windows-alienfx-tool.html"
license=('GPL')
depends=('java-runtime' 'libusb')
source=("http://web.archive.org/web/20100926113143/http://progger.co.uk/alienfx/AlienFXLite-0.4b.jar")
md5sums=('d4366d28a9a8ce1f7b6d84a4f1710dca')
sha1sums=('8aba18a39e7bf5c2b1b2a08db85f7c66f5d1e4b0')

build() {
  install -d ${pkgdir}/usr/share/${_pkgname} || return 1
  install -d ${pkgdir}/usr/bin || return 1
  install -Dm755 ${startdir}/AlienFXLite-0.4b.jar ${pkgdir}/usr/share/${_pkgname} || return 1

  #create startup app
  echo "#!/bin/sh" > ${pkgdir}/usr/bin/${_pkgname}
  echo "cd /usr/share/alienFX-lite" >> ${pkgdir}/usr/bin/${_pkgname}
  echo "sudo \$JAVA_HOME/bin/java" -jar '/usr/share/alienFX-lite/AlienFXLite-0.4b.jar' >> ${pkgdir}/usr/bin/${_pkgname}
  echo "cd -" >> ${pkgdir}/usr/bin/${_pkgname}
  chmod +x ${pkgdir}/usr/bin/${_pkgname}
}
