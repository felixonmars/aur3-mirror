# Maintainer: Fabio Rämi <fabio[at]dynamix-tontechnik[dot]ch>
pkgname=experms
pkgver=0.8
pkgrel=1
pkgdesc="Runs as daemon, monitors file-changes and adjusts permissions and ownership."
arch=('any')
url="https://github.com/open-dynaMIX/$pkgname"
license=('GPL')
depends=('python2' 'python2-pyinotify' 'python2-psutil')
source=("http://dynamix-tontechnik.ch/code/experms/$pkgver/$pkgname.tar.gz")
noextract=("experms.1.gz" "experms.conf.5.gz")
backup=('etc/experms.conf')
install=experms.install
md5sums=('6f248d44f502b6f772fc06195f974f34')

package() {
    cd "$srcdir"
    install -d $pkgdir/usr/share/$pkgname
    install -d $pkgdir/etc
    install -d $pkgdir/usr/bin
    install -d $pkgdir/usr/share/man/man1
    install -d $pkgdir/usr/share/man/man5
    install -m644 -t $pkgdir/usr/share/$pkgname/ check_config.py daemon.py COPYING README CHANGELOG
    install -m755 experms.py $pkgdir/usr/share/$pkgname/
    install -m644 experms.conf $pkgdir/etc/
    install -m644 experms.1.gz $pkgdir/usr/share/man/man1/
    install -m644 experms.conf.5.gz $pkgdir/usr/share/man/man5/
    ln -sf /usr/share/$pkgname/experms.py $pkgdir/usr/bin/experms
}
