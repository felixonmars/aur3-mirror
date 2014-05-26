# Maintainer: Roman Titov <titovroman@gmail.com>
pkgname=java-wm-patch
_pkgname=JavaMatePatch
pkgver=1.0
pkgrel=1
pkgdesc="Hack, allowing manually set WM name, Java apps would get (to fix some Java-bugs)"
url="https://github.com/zheludkovm/$_pkgname"
license=('GPL')
arch=('i686' 'x86_64')
depends=()
source=("git+https://github.com/zheludkovm/$_pkgname")
sha1sums=('SKIP')
install='java-wm-patch.install'
package() {
  cd "${srcdir}/$_pkgname"
  mkdir -p "${pkgdir}/usr/share/java-wm-patch/"
  install -D -m644 "${srcdir}/$_pkgname/builds/$pkgver/JavaMatePatch-1.0.0-SNAPSHOT.jar" "${pkgdir}/usr/share/java-wm-patch/"
  install -D -m644 "${srcdir}/$_pkgname/builds/$pkgver/javassist-3.12.1.GA.jar" "${pkgdir}/usr/share/java-wm-patch/"
}
