# Maintainer: 4679kun <4679kun@outlook.com>

pkgname=smartladder-git
_pkgname=smartladder
pkgrel=1
pkgdesc="A gae proxy forked from gappproxy/wallproxy(with builtin appid)."
arch=("any")
url="https://github.com/kawaiiushio/smartladder"
license=("GPL2")
pkgver=20140622
depends=('python2' 'python2-pyopenssl')
optdepends=('python2-gevent: for better performance'
            'python2-gevent-beta: for better performance')
makedepends=('git')
source=("git://github.com/kawaiiushio/smartladder.git"
        "${_pkgname}.service")
md5sums=('SKIP'
         'SKIP')
install='smartladder-git.install'

pkgver() {
    cd "$srcdir/$_pkgname"
    git log -1 --format="%cd" --date=short | sed 's|-||g'
}


package() {
    cd "$srcdir/$_pkgname"

    sed -i -e "s|^#!/usr/bin/env python|#!/usr/bin/env python2|" \
            "goagent+/proxy.py"
  
    install -Dm755 goagent+/proxy.py \
            "$pkgdir/usr/share/$_pkgname/goagent+/proxy.py"
    install -Dm644 goagent+/proxy.pac \
            "$pkgdir/usr/share/$_pkgname/goagent+/proxy.pac"
    install -Dm644 goagent+/cacert.pem \
            "$pkgdir/usr/share/$_pkgname/goagent+/cacert.pem"
    install -Dm644 goagent+/CA.crt \
            "$pkgdir/usr/share/$_pkgname/goagent+/CA.crt"
    install -Dm644 goagent+/proxy.ini \
            "$pkgdir/usr/share/$_pkgname/goagent+/proxy.ini"

    # systemd service
    install -Dm644 "${srcdir}/smartladder.service" \
            "${pkgdir}/usr/lib/systemd/system/smartladder.service"
}

# vim:set ts=2 sw=2 et: