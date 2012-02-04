# Maintainer: J. W. Birdsong <jwbirdsong AT gmail DOT com>
pkgname=orifli
pkgver=0.2.2
pkgrel=3
pkgdesc="A simple Flickr uploader"
arch=('any')
url="http://originalcoding.com/orifli"
license=('GPL')
depends=('python2' 'gtk2')
conficts=('orifli-bzr')
md5sums=('d24b9c017c40ce57653149b900d92c19'
         '38a130547363c3746103b7e4316b21cf')

source=(http://originalcoding.com/orifli/$pkgname-$pkgver.tar.gz $pkgname.launcher)

build() {
  cd "$srcdir/$pkgname"
  sed -i "s|env python|env python2|" ${pkgname}.py
  install -d ${pkgdir}/{usr/bin/,usr/share/${pkgname}/}
  mv ${srcdir}/${pkgname}/*  ${pkgdir}/usr/share/${pkgname}/

#Install the Launcher
      install -D -m755 ${srcdir}/${pkgname}.launcher \
      ${pkgdir}/usr/bin/${pkgname}
}

# vim:set ts=2 sw=2 et:

