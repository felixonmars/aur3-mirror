# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Tom Wadley <tomwadley@fastmail.fm>

pkgname=manicdigger
pkgver=2015.02.17
_srcname=ManicDigger${pkgver//./-}Binary
pkgrel=1
pkgdesc="A public domain 3d block-building game similar to Minecraft"
arch=(any)
url=http://manicdigger.sourceforge.net
license=('custom:public domain')
depends=(mono openal)
source=(http://downloads.sourceforge.net/project/manicdigger/$_srcname.zip
        manicdigger
        manicdigger-server
        manicdigger-monstereditor)
sha256sums=('d10022f270599e6e6c064fc092fe878f43b61367c9ca2cd4a08669d7af06b341'
            '11c6679812ebad04f85b7e206c0a924c0fb4e5186ed4bdc2558029a3cb32a293'
            '26f66b2c075acf696b7ff95358b576fd5d9fa6a6d35eba233f39ff5829bf7da8'
            '77da8239ac13dfe01724dbff8ac1186e5c025b8b46b3fb027621f5deba79489b')
sha512sums=('0a44f5875cd535ccc5011f54fed39f22c7cff58f5c3208a56945766153cbc07810765a1572ee7f8e31d323e261c960790cd437beedeaa11bfaa3f7a98b195512'
            '7542e48a2d7ead46c400b919ac3c6f2d39565c95463350dfd021c46d1b1b48a9839a5b6ff09b20a86fa9fb5042f92f58c5025ab0636acf694672da20bc2bef60'
            '8b0ae9f4c8c327a84140a21d5dfe67b7611ae5a6e90a0ca5adf64161e7dff1e4f9a5f7434856350796e0565277963cbdf8dd60f3c84e85a950e3ed9112fd5737'
            'dd3f451fd810542e46bba84b31321399290fe03db8e95d875ad294bd212d730e0a6baea9bc47f8f04ceb0842dd4f699c0b77510a5b29c8b87f74ce5e355d637d')

package() {
    install -d "$pkgdir"/opt/$pkgname/
    cp -r ManicDiggerBinary/* "$pkgdir"/opt/$pkgname/

    for i in $pkgname{,-server,-monstereditor}; do
        install -Dm755 $i "$pkgdir"/usr/bin/$i
    done

    install -d "$pkgdir"/usr/share/licenses/$pkgname/
    mv "$pkgdir"/opt/$pkgname/credits.txt "$pkgdir"/usr/share/licenses/$pkgname/credits.txt
}
