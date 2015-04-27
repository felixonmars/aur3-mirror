# Maintainer: Duncan K. <duncank@fastmail.fm>

pkgname=shout-irc
_upstreamname=shout
pkgver=0.51.0
pkgrel=1
pkgdesc="Web-based IRC client"
url='http://shout-irc.com/'
arch=('any')
license=('MIT')
depends=('nodejs')
install=install
source=("https://github.com/erming/${_upstreamname}/archive/${pkgver}.tar.gz"
        service)
sha256sums=('90866160cc1e54f2184c9009a81fa7cfacb2ef40fb79222037bb66515d3c3d3e'
            'beac3a8a25700997f0f2a154ee85e8c89d64082856d194434b01116a0f4edb91')

prepare() {
  cd ${srcdir}/${_upstreamname}-${pkgver}
  npm install
}

package() {
  _share=$pkgdir/usr/share/$pkgname
  _etc=$pkgdir/etc/$pkgname

  cd ${srcdir}/${_upstreamname}-${pkgver}

  install -dm755 $pkgdir/usr/bin
  install -dm755 $_share
  install -dm700 $_etc $_etc/users
  install -Dm600 defaults/config.js $_etc/config-dist.js
  cp -RT . $_share
  ln -s /usr/share/$pkgname/index.js $pkgdir/usr/bin/$pkgname

  install -Dm644 $srcdir/service $pkgdir/usr/lib/systemd/system/${pkgname}.service
}
