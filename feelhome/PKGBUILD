# Contributor: Roman Aysin <aysin.roman@gmail.com>

pkgname=feelhome
pkgver=0.3.0.504
pkgrel=1
pkgdesc="FeelHome is software that connects in a safe and secure way your personnal or professionnal computer to the internet, and lets you access your file and folders from around the world!"
arch=('i686' 'x86_64')
url="https://www.nuxinov.com"
license=('GPL')
depends=('qt>=4.5.0')
source=(http://downloads.sourceforge.net/feelhome/FeelHome-${pkgver}_linux.tar.gz)
md5sums=('194d133616f59e439f7c77312a5498cb')

build() {
  cd "$srcdir/FeelHome-linux/src"

  qmake || return 1
  make || return 1

}

package() {
  cd "$srcdir/FeelHome-linux/src"
  
  install -D -m755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
  install -D -m644 ${pkgname}.desktop \
    "$pkgdir/usr/share/applications/${pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
