# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: evr <evanroman@gmail.com>

pkgname=lastagent
pkgver=0.3.02_4
pkgrel=2
pkgdesc="A Last.fm music tracker that provides some of the missing functionality of the official client"
arch=(any)
url=http://code.google.com/p/lastagent/
license=(GPL3)
depends=(pygtk python2-dbus python2-pylast python2-sexy)
options=(!emptydirs)
source=(http://lastagent.googlecode.com/files/$pkgname-${pkgver//_/-}.tar.bz2)
sha256sums=('56d7c1f9d06a13f2f1a893b98d94ba6dc89da60d98ac515b6a11c78b6cf337cf')
sha512sums=('c4895efa78b8b8ce77fa7e7e8e7ae1d8db7142fd666ff46485439a12eee8f2fd045b01e03520b55c6ac52417dcf1acf7ceb9887b880f701b3dbaca8ddc2ecbbd')

prepare() {
    cd $pkgname-${pkgver%_*}/
    sed -i 's:python$:&2:' $pkgname.py
    chmod 644 gui/images/waiting2.gif
}

package() {
    cd $pkgname-${pkgver%_*}/
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
    desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications/

    install -d "$pkgdir"/usr/share/$pkgname/
    cp -rvf * "$pkgdir"/usr/share/$pkgname/
    rm "$pkgdir"/usr/share/$pkgname/$pkgname{,.desktop}
}
