# Contributor: Vitaliy Berdinskikh <skipper13@archlinux.org.ua>
# Contributor: Andrea Agosti <cifvts@gmail.com>
# Contributor: Viliam Pucik <viliam.pucik@gmail.com>
# Maintainer: xduugu
pkgname=instantclient-sdk
pkgver=11.2.0.3.0
pkgrel=1
pkgdesc="Additional header files for developing Oracle applications with Instant Client"
arch=('i686' 'x86_64')
url="http://www.oracle.com/technetwork/database/features/instant-client/"
license=('custom:OTN')
depends=(instantclient-basic=$pkgver)
#
# Grab the source from
# i686  : http://www.oracle.com/technetwork/topics/linuxsoft-082809.html
# x86_64: http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html
# AMD64: http://www.oracle.com/technetwork/topics/linux-amd64-093390.html
#
source=($pkgname-linux-$pkgver.zip LICENSE)
sha1sums=(''44538c3c26aa6af16c325463743846a7da814a
            'd94b96308489ebc026c7dc62674a7a086b0bc5b3')

if [[ $CARCH = x86_64 ]]; then
    source=($pkgname-linux.x64-$pkgver.zip LICENSE)
    sha1sums=('ed8041eac30ccbd5d964e60b44eb3f5a4f3d8773'
                'd94b96308489ebc026c7dc62674a7a086b0bc5b3')
fi

package() {
        local dest=$pkgdir/opt/${pkgname%%-*}

        # copy files
        local pkgver=${pkgver/./_}
        install -d "${dest%/*}" &&
        cp -a "$srcdir/${pkgname%%-*}_${pkgver%%.*}" "$dest" || return 1

        # fix permissions
        cd "$dest/sdk" &&
        chmod -R a=r,u+w,a+X * || return 1

        install -Dm644 "$srcdir/LICENSE" \
                "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1
}

# vim:set ts=2 sw=2 noet:
