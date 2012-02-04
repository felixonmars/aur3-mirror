pkgname=vkget
pkgver=0.2
pkgrel=1
pkgdesc="A simple CLI audio searcher/downloader for VKontakte.ru (VK.com) social network written in Python."
arch=('any')
url="http://anderson.pp.ua"
license=('GPL')
depends=('python2' 'wget')
source=(${pkgname}.py)

build() {
  install -Dm755 ${srcdir}/${pkgname}.py ${pkgdir}/usr/bin/${pkgname}
}
md5sums=('1a9113e9ed8c6de1c871573f97d5bfaa')
