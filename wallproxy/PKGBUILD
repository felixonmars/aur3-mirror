# Maintainer: Anonymous_42 <anonymousknight96 at gmail dot com>
# Contributor: Toshio Xiang <snachx at gmail dot com>
# Contributor: 謝致邦 <Yeking@Red54.com>

pkgname=wallproxy
pkgver=2.2.4
pkgrel=1
pkgdesc="A http and socks proxy based on Google App Engine."
arch=("any")
url="https://code.google.com/p/wallproxy"
license=("MPL")
depends=('python2' 'python2-pyopenssl')
makedepends=('git' 'tar')
optdepends=('python2-gevent: for better performance')
conflicts=('python2-gevent<1.0')
backup=('etc/wallproxy.d/redirects.ini' 'etc/wallproxy.d/userlist.ini' 'etc/wallproxy.d/user.ini')
install=$pkgname.install
#source=("git+https://github.com/wallproxy/wallproxy.git#tag=v$pkgver"
source=("https://github.com/wallproxy/wallproxy/archive/master.zip"
        $pkgname.service)
md5sums=('SKIP'
         '6585482b4a969054224b2532b5fa6a10')

package() {
    cd $srcdir/"$pkgname"-master

    install -Dm640 -g nobody local/user.ini.example $pkgdir/etc/wallproxy.d/user.ini
    install -Dm644 local/misc/redirects.ini $pkgdir/etc/wallproxy.d/redirects.ini
    install -Dm644 local/misc/userlist.ini $pkgdir/etc/wallproxy.d/userlist.ini

    install -Dm644 local/proxy.ini $pkgdir/usr/share/$pkgname/local/proxy.ini
    install -Dm755 local/startup.py $pkgdir/usr/share/$pkgname/local/startup.py
    install -Dm644 local/pac $pkgdir/usr/share/$pkgname/local/pac

    cp -r local/cert $pkgdir/usr/share/$pkgname/local/cert
    cp -r local/misc $pkgdir/usr/share/$pkgname/local/misc
    cp -r local/src.zip $pkgdir/usr/share/$pkgname/local/src.zip

    ln -sf /etc/wallproxy.d/user.ini $pkgdir/usr/share/$pkgname/local/user.ini
    ln -sf /etc/wallproxy.d/redirects.ini $pkgdir/usr/share/$pkgname/local/misc/redirects.ini
    ln -sf /etc/wallproxy.d/userlist.ini $pkgdir/usr/share/$pkgname/local/misc/userlist.ini

    cp -r server $pkgdir/usr/share/$pkgname
    chmod +x $pkgdir/usr/share/$pkgname/server/uploader.py
    rm $pkgdir/usr/share/$pkgname/server/uploader.bat

    install -Dm644 $srcdir/wallproxy.service $pkgdir/usr/lib/systemd/system/wallproxy.service
}
