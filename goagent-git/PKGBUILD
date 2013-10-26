# Maintainer:  cuihao <cuihao dot leo at gmail dot com>
# Contributor: Felix Yan <felixonmars at gmail dot com>
# Contributor: Guten <ywzhaifei at gmail dot com> 

pkgname=goagent-git
_pkgname=goagent
pkgver=20131026
pkgrel=1
pkgdesc="A gae proxy forked from gappproxy/wallproxy (git version)"
arch=("any")
url="http://goagent.googlecode.com"
license=("GPL2")
depends=('python2' 'python2-pyopenssl')
optdepends=('python2-gevent: for better performance'
            'python2-gevent-beta: for better performance')
conflicts=('goagent')
provides=('goagent')
source=(
    "$pkgname::git://github.com/goagent/goagent.git"
    "goagent.service"
)
sha512sums=(
    'SKIP'
    'b8f5f6342303edd520a577d0348deef7017ba79aa5c6f43c4e1c368d7b204f6364f4537f2a5e21f3b63a321bdcf3d407e5dea9883211c11a4d11801b057cddc2'
)
backup=('etc/goagent')
install='goagent-git.install'

pkgver() {
    cd "$srcdir/$pkgname"
    git log -1 --format="%cd" --date=short | sed 's|-||g'
}


package() {
    cd "$srcdir/$pkgname"

    sed -i -e "s|^#!/usr/bin/env python|#!/usr/bin/env python2|" \
            "local/proxy.py"
  
    install -Dm755 local/proxy.py \
            "$pkgdir/usr/share/$_pkgname/local/proxy.py"
    install -Dm644 local/proxy.pac \
            "$pkgdir/usr/share/$_pkgname/local/proxy.pac"
    install -Dm644 local/cacert.pem \
            "$pkgdir/usr/share/$_pkgname/local/cacert.pem"
    install -Dm644 local/SwitchyOptions.bak \
            "$pkgdir/usr/share/$_pkgname/local/SwitchyOptions.bak"
    install -Dm644 local/SwitchySharp.crx \
            "$pkgdir/usr/share/$_pkgname/local/SwitchySharp_1_9_52.crx"

    install -Dm644 local/proxy.ini \
            "$pkgdir/etc/goagent"
    ln -sf "/etc/goagent" \
            "${pkgdir}/usr/share/$_pkgname/local/proxy.ini"
  
    cp -r server "$pkgdir/usr/share/$_pkgname/"
    rm "$pkgdir/usr/share/$_pkgname/server/uploader.bat"

    # systemd service
    install -Dm644 "${srcdir}/goagent.service" \
            "${pkgdir}/usr/lib/systemd/system/goagent.service"
}

# vim:set ts=2 sw=2 et:
