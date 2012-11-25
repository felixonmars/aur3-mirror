# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=convirt
pkgver=1.1
#pkgver=2.1
pkgrel=5
pkgdesc="Graphical virtualization management tool for KVM and Xen"
arch=(any)
#arch=(i686 x86_64)
url=http://www.convirture.com
license=(GPL2)
depends=(python2-paramiko openssh socat xen vte)
## Version 2.1 dependencies below (names converted from Convirt's own build scripts):
#depends=(dnsmasq expect multipath-tools openssh python2-{paramiko,pexpect} socat uml_utilities xen vte)
source=($url/downloads/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz
    http://www.convirture.com/wiki/images/6/68/Patch_cumulative_convirt_9_oct_09.txt)
sha256sums=('bbd8a02d6f5a3e3b65137329b582d3b559fc96d4693ce691fec4c3a9eb2cecc8'
    'f8f639427dfcb304e2cd95dc2ffdac51454459db3b29c3b1471e36fcd14f4414')
sha512sums=('ec50c456e71fe069b07a8096a48245fab9c3ae1a0c33d660efe11b8edcbe73d74d6cfbd31a5de9828a13274200889ba08a800241ae5ed13f0d17d8cf49bd1518'
    '6aa114239c9deaba2330a35119c850be0977dc5af9863d93cddad1ab138826f850b17951abe21d56738b4a91610a6896170bae7ef59bd6adbc01c95fc51539ef')
## Version 2.1 checksums (note that patch is no longer necessary in 2.1):
#sha256sums=('cdb74a0eae105d4bf2f36b67f8ae3a1f07193cb14d2a76aa015cf48020cb7cee')
#sha512sums=('71c2a6a6757544f5af10e0eda7515523cb120dc71b9cadf18cb58b99dddfc402772692580625803883590f95cf930d19b9e08df4701093a9ffdce4eba48ac1a3')

build() {
    cd "$srcdir"/$pkgname-$pkgver/

    for i in $(find -name '*.py') ConVirt install/common/patches/patch_paramiko; do
        sed -ri 's:^#!/usr/bin/(env )?python$:&2:'
    done

    # add the 1.1 Cumulative Patch
    patch -Np0 -i ../Patch_cumulative_convirt_9_oct_09.txt

    install -d "$pkgdir"/var/cache/$pkgname/
    cp -a appliance_store image_store "$pkgdir"/var/cache/$pkgname/

    install -d "$pkgdir"/usr/share/doc/$pkgname/
    cp -a doc "$pkgdir"/usr/share/doc/$pkgname/

    install -d "$pkgdir"/usr/share/$pkgname/
    cp -a ConVirt src install storage doc "$pkgdir"/usr/share/$pkgname/

    install -Dm644 install/client/distros/ubuntu/$pkgname.conf "$pkgdir"/etc/$pkgname.conf

    install -d "$pkgdir"/usr/bin/
    ln -s ../share/$pkgname/ConVirt "$pkgdir"/usr/bin/$pkgname
}
