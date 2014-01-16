# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: cuihao <cuihao dot leo at gmail dot com>
# Contributor: Guten <ywzhaifei@gmail.com> 

pkgname=smartladder
pkgver=3.1.4
pkgrel=1
pkgdesc="A gae proxy forked from gappproxy/wallproxy(with builtin appid)."
arch=("any")
url="https://github.com/kawaiiushio/smartladder"
license=("GPL2")
depends=('python2' 'python2-pyopenssl')
conflicts=('goagent' 'python2-gevent<0.99')
optdepends=('python2-gevent>0.99: for better performance'
            'python2-crypto: optimization for RC4'
            'python2-pacparser: PAC proxy support')
makedepends=('git')
source=("git://github.com/kawaiiushio/smartladder.git"
        "${pkgname}.service"
        "${pkgname}.user.ini")
md5sums=('SKIP'
         'fb06146e6c25066ddefb8951a221f0a3'
         'd41d8cd98f00b204e9800998ecf8427e')
install="${pkgname}.install"

package() {
    cd "${pkgname}/goagent+"
    
    sed -i -e "s|^#!/usr/bin/env python|#!/usr/bin/env python2|" "proxy.py"

    install -Dm755 "proxy.py" "${pkgdir}/usr/share/${pkgname}/${pkgname}"
    install -Dm644 "proxy.pac" "${pkgdir}/usr/share/${pkgname}/proxy.pac"
    install -Dm644 "cacert.pem" "${pkgdir}/usr/share/${pkgname}/cacert.pem"
    install -Dm644 "SwitchyOptions.bak" "${pkgdir}/usr/share/${pkgname}/SwitchyOptions.bak"
    install -Dm644 "SwitchySharp.crx" "${pkgdir}/usr/share/${pkgname}/SwitchySharp_1_9_52.crx"
  
    install -Dm644 "proxy.ini" "${pkgdir}/usr/share/${pkgname}/${pkgname}.ini"
    install -Dm640 -g nobody "${srcdir}/${pkgname}.user.ini" "${pkgdir}/etc/${pkgname}"
    ln -sf "/etc/${pkgname}" "${pkgdir}/usr/share/${pkgname}/${pkgname}.user.ini"
  
    #cp -r server "$pkgdir/usr/share/$pkgname/"
    #rm "$pkgdir/usr/share/$pkgname/server/uploader.bat"
  
    # systemd service
    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
