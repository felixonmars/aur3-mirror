# Maintainer: Faule Socke <github@socker.lepus.uberspace.de>

pkgname=elantech-tp-dkms
pkgver=3.16.2
pkgrel=1
pkgdesc="psmouse kernel module with support for elantech trackpoint"
url="https://bugs.launchpad.net/ubuntu/+source/linux/+bug/967399"
license=("GPL")
depends=('linux-headers' 'dkms')
arch=('any')
install=elantech-tp-dkms.install
kver=$pkgver
source=('elantechfull.patch'
        'elantech-tp-dkms.install'
        'elantech.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/elantech.c?id=refs/tags/v$kver'
        'Kconfig'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/Kconfig?id=refs/tags/v$kver'
        'Makefile'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/Makefile?id=refs/tags/v$kver'
        'alps.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/alps.c?id=refs/tags/v$kver'
        'alps.h'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/alps.h?id=refs/tags/v$kver'
        'amimouse.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/amimouse.c?id=refs/tags/v$kver'
        'appletouch.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/appletouch.c?id=refs/tags/v$kver'
        'atarimouse.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/atarimouse.c?id=refs/tags/v$kver'
        'bcm5974.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/bcm5974.c?id=refs/tags/v$kver'
        'cyapa.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/cyapa.c?id=refs/tags/v$kver'
        'cypress_ps2.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/cypress_ps2.c?id=refs/tags/v$kver'
        'cypress_ps2.h'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/cypress_ps2.h?id=refs/tags/v$kver'
        'elantech.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/elantech.c?id=refs/tags/v$kver'
        'elantech.h'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/elantech.h?id=refs/tags/v$kver'
        'gpio_mouse.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/gpio_mouse.c?id=refs/tags/v$kver'
        'hgpk.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/hgpk.c?id=refs/tags/v$kver'
        'hgpk.h'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/hgpk.h?id=refs/tags/v$kver'
        'inport.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/inport.c?id=refs/tags/v$kver'
        'lifebook.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/lifebook.c?id=refs/tags/v$kver'
        'lifebook.h'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/lifebook.h?id=refs/tags/v$kver'
        'logibm.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/logibm.c?id=refs/tags/v$kver'
        'logips2pp.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/logips2pp.c?id=refs/tags/v$kver'
        'logips2pp.h'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/logips2pp.h?id=refs/tags/v$kver'
        'maplemouse.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/maplemouse.c?id=refs/tags/v$kver'
        'navpoint.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/navpoint.c?id=refs/tags/v$kver'
        'pc110pad.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/pc110pad.c?id=refs/tags/v$kver'
        'psmouse-base.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/psmouse-base.c?id=refs/tags/v$kver'
        'psmouse.h'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/psmouse.h?id=refs/tags/v$kver'
        'pxa930_trkball.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/pxa930_trkball.c?id=refs/tags/v$kver'
        'rpcmouse.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/rpcmouse.c?id=refs/tags/v$kver'
        'sentelic.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/sentelic.c?id=refs/tags/v$kver'
        'sentelic.h'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/sentelic.h?id=refs/tags/v$kver'
        'sermouse.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/sermouse.c?id=refs/tags/v$kver'
        'synaptics.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/synaptics.c?id=refs/tags/v$kver'
        'synaptics.h'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/synaptics.h?id=refs/tags/v$kver'
        'synaptics_i2c.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/synaptics_i2c.c?id=refs/tags/v$kver'
        'synaptics_usb.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/synaptics_usb.c?id=refs/tags/v$kver'
        'touchkit_ps2.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/touchkit_ps2.c?id=refs/tags/v$kver'
        'touchkit_ps2.h'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/touchkit_ps2.h?id=refs/tags/v$kver'
        'trackpoint.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/trackpoint.c?id=refs/tags/v$kver'
        'trackpoint.h'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/trackpoint.h?id=refs/tags/v$kver'
        'vsxxxaa.c'::'https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/vsxxxaa.c?id=refs/tags/v$kver')

build() {
	cd ${srcdir}

    mkdir -p src
    cp *.c *.h src/
    cp Makefile src/
    cp Kconfig src/
    cd src

    # apply patch
	patch -Np4 < ${srcdir}/elantechfull.patch

	# we disable support for OLPC... this does not compile
	sed -i '/CONFIG_MOUSE_PS2_OLPC/s|^|//|' Makefile
	sed -i '/#ifdef CONFIG_MOUSE_PS2_OLPC/,/#endif/d' psmouse-base.c
}

package() {
	cd ${srcdir}/src
    pd=${pkgdir}/var/lib/dkms/psmouse/elantech-tp-${pkgver}
    ps=${pd}/source
    
	install -d -m0755 $pd
    install -dm755 $ps
    install -m644 *.c *.h $ps
    install -m644 Kconfig $ps
    install -m644 Makefile $ps

    cat > ${ps}/dkms.conf <<DKMSCONFEOF
PACKAGE_NAME="psmouse"
PACKAGE_VERSION="elantech-tp-$pkgver"
CLEAN="rm -f *.*o"

BUILT_MODULE_NAME[0]="psmouse"
MAKE[0]="make -C \$kernel_source_dir M=\$dkms_tree/\$PACKAGE_NAME/\$PACKAGE_VERSION/build/. psmouse.ko"
BUILT_MODULE_LOCATION[0]="."
DEST_MODULE_LOCATION[0]="/updates"

AUTOINSTALL="yes"
DKMSCONFEOF

    chmod 644 ${ps}/dkms.conf
}

sha512sums=('41db1b5d53b22d1de9d971e7b7a6e3c9091a0b9cb154a71d3e243decbd3723e383ba1cc77200ff9294290a6badd6cacacbff7be118145f9ce601f912c8cdef35'
            '1f155ad76ab0bf0bca85b159e076928c46555848edb43a58b868b9ccf86469c2449e572d212d7d85becd84e19af6cf56e2f410d90e3da7f93de3103c67054471'
            '2106034fc45a0e99d836742bd6dd453150a696be2631302e15fcc18138d73b6445fa391ecd0a4b7e5866d751a650e1ce8af59fabb639e45937297eb9f591e821'
            '82cae70f5499157e2b02dcc70dd2ba30116b407d4be95f1f751758823d2805ef90027c93c27bdc1f41548302998cac1a4146f21d6a156a9295d5ad0f981bbe0d'
            '87cc2e4ed748bde45743cf1d2508efbdead75f1876c8607d57828b28825b77ddfbffc683e8a844b530cfee56491c3cac082b9b241ab25b418cfbc33413472987'
            '23b84306e353f133b23cc339d9d147cc62f184aca29fa8e9b996c787e0c74b37e010390ee3d5028b9223cf4ae7616624499a4168a25dede3761b54a8c9d89f0a'
            '0b0a20a5dcda37610ed83f45478ab53c7ba01e7384809a97e49a88e34037acd2ff7185d73163a953b6985e9ed33f40653ee46e3692b24348e6291ea5aaa28f25'
            '04b3d48c6d10a0d16988165c5c4e874e409a0aff549729757616589abf52e59cb017de7ba169e54e64b69bba918fec2b432256ac937a1f778eaeac3056075052'
            'ba1590a45a24d958634399fc98a6a6f8394100b9a58206b4572028b274cdc3aea2bf86ba88caa82f001d81a1bd0e82767dd0f48576eab0f290360e2fa4a66f64'
            '73bc6bd1b37dc4aa19e68ca9f9e2039f902e3830df51db32dadef3101d675b37c56f8a9d1a5a0e61c4083cf01e553ff7e4880cea5903c97548996d95cdbfddd7'
            '036474cab3af9455b682b1d6032da6552d06e26aa788a393bf413f25bd91317c51714c0a77f359c31c09123cdc676ecf15ce97b806e39de59f871fe747be0d8d'
            '9496e567320f123513ef855b6f9f4203f41c60d6c03b6c97a6b0462a1fb45ed9f3591cc399bf624e1755e21fa02a2248ad25b5981cc65a35f1362246dd6580e4'
            '54ff52348605ba7d40da17d9c488ecd45e3eb3270732174f6b05ac1ee0307a3af431f6a42df2546c5d1ddf539235cdcc32bc1ff1d1157472d6b7f4172cdae0eb'
            '65e3eea518ad9b79916483095da78bc94920b5e8980bdd1dc7dbb93112d6f22f8c23119bafc8f93dce9efd136d59c5fa0b525cb468125652ba3e7709c7db1825'
            '2106034fc45a0e99d836742bd6dd453150a696be2631302e15fcc18138d73b6445fa391ecd0a4b7e5866d751a650e1ce8af59fabb639e45937297eb9f591e821'
            '4bd6d58dc0517cb914e75e4ec297d629cd40954b8d0a4f7f2772b5a6f3ad0537239fa741b1f23b46dfd5ef0eececdcae4fc781e89353a3830328097ba624131f'
            '34b4a55962909dc662cfa2924c2204806cf79216711efd229c59d42dc0c562510fc5d1a95866a41acaf7f7724fe63a4f372386b15daadf3d5874138afc523884'
            'f12e317c8a5cd5ec7ab614968cbb2d6744468e6dfeb3728de7c7c69b1c274cadae17531c4e835f5d09f1035b272551d97b87f2f685444beddb770dc11d32312c'
            '5e640a9c6580b67e440ee050e78cec4b6e99a43a0a4350eece879fa441bce2a3d0a1c902c54b4fd3b9899103646641ecbbdf1e272df14a2cbf81337904dcd27a'
            '84194a98ef621d448fcd3889cf825a7fb22ba187eee07d4623fdb4f20e49af5522f9aa1391def4683481c1bc7b24457c0276e1d3fcefad0d440ca5f80edfba1e'
            '439fe7a68fe48216d08e4971466a1d0b94159ce36d575d68f8ab421ec4236aff1a42c8debf572b2c10d0c55b9dd24510e40ff950f146ae04c4cc6dae50918f1c'
            'f8cb82fde0bce3060bb4623c48d9e64e61d3d4940efd13d1f3f8d4adeb1429e7ad75bb90af618de99c08d7076a433196076929c128f6dbc829464408ade02c8d'
            '660fb2662aa76d7da42bdba270ce1f963ae59388c19152100429b3b017b61b2698e4ef454c5ac337d0e91fec9247c3a0132719c3552288e59c636519587fcbbd'
            '18df1308a0e4c18df27103f9739dd9bfc892b26d3f13825d124dcd238439726668d9435df4751dc2c3ecccf9c217bb326bdb2f7a8c1cbd63118aae15d0715426'
            '78450aa72198434746218f58d83f171bb55f9de4293f38560c95983075770140db866700758ac1c76beea402e3769bf38d9955dae2882aeee828e100b2245e00'
            'dd1e6606e00e94c1e36b47780ff8e031193cd3bbc6d87026927f4ec0273ed5f48bca71c224df2f65d37fce26ef78ef6d87d71fae723b26729c8a91a8d599b51f'
            'ef7f4eb98a243227c3bdc6c516475b6e36f7b4a12650bcf26c900a3f9c8f9f2e799d9fc78b36a29f6be95ec0732ae3bef1b7eb178da72ba886ec24e4beb186ef'
            '3554fb792dabbbb99fe7c3014d39b8ab51f704a66707ada62f3ae7c6f435b1f2197103b50f1cd50292d038ffcfabaf2b62117c7bc91ee0b56f41a41162c002e1'
            'ce2afb01b117ac0cbb7c737a3fef6fbc25902694eb602ae52caab7b56416a1e0bac77987b26ab4f29d1ca42d27bbfd59f00f3d91fe926f5135885825ce6db401'
            'b89801a0115fde38feaf2240f56c1f98b24cd5ccb9e231edc9068addfeb9e0c52bcdc4bab31f28778754c8cb78b6dee46af42fe6519cc3da47573607d202af82'
            '06a4f2187e74d408eeac23af6d9426eb09de3204403ea60e7589636d0a026ed8d882b121dc94fa9732ea1fdece756f5f71a52b492a72100bb59282da08422cce'
            'eb95d2bb9684099b1f4b7b06e8a7899fa8e33350ecfbd26f2906fcf8430fb603382be26b55c64f42a779189f9daf1ff94ca3413cb839bc519475485c8063f976'
            '6e610db0069bae081ca4ad76e07d340d3517de12bbf0d83ff9f81877c4edda18656338d952b3cae97daab573bb25dbd4f5963ed49c5f580635f63e11b418cbaf'
            '191e0bdf6ada2ccbe8a694f4dc161701acdd53dbe56b288d32f75c3272306dc5725570570fd401d0a48a7492f3d3770c8311ed6863343bfbdd11dde221c4a277'
            '4a91eeada94ea7d5ad0ef656f11b9cf3dc4f55715583dc42c47f959de541e0de067a0a00824bd570135ecdea4bd0cbc5ceef514898695d1c972c3cee231f7699'
            'bed477345b6c1da80edbd908bd33a9cc7b21a8f3b566b7c8a659e896a251df485f547a130d8b28a8ec48ceab6dabfbb67a84931746afae980b1e4e95bc2543d6'
            '78bf9cd9b96b337a8a0c7be80e1967a81515b31d999d0ad365564acce557214a7f9b46d78395964bb09d4b6baab4bff8cb9e99cb96ae3ba02675662dca710ab7'
            '0e63202646f18a48ccd085dd92a61773ac2391d49ad90f022a2f9bcd1b416189ba83bbddebebd4ff212b7c7c5cc80e1058965da208f2670b515c0063cd0794ab'
            '8f84118bdb1f61ad8a909391aa9b9dd9df1e6be80a071727ca17a6fd7cb3aca7fa169749bd746c59bcead2d0de44e54186a921fedca299d102d7d40b59e9a4a8'
            '31473d0451332e0438b9e397b06ddb004211213246306cc2ca98361de98aad7bbc74233d011274133d22e7cf5d215eb7e279e923f3d47d3ad83e400942c5f34b'
            '1f2e769f03c9376574b78e3d120191ab95e4c32d0c468a58469760957fd082c5d3d57390038c388a3c0f28e8a3ff75c5931cc502b13120311d201fdd63182097'
            'd89c9c9dcf3e6d9998a3430bc8779a975c2f94bab8f130a65cf89f44c89c23590b2ad3b967e7d716da70ed8f2c1f34b317f3bc421c065476e19daab4ef03f289'
            'efa983ad8e87fd640e3d2f9e68dcee28cf1041e6fca6b40d1fc2fffdbe5c2f86780e3f7cd991ad76e4b7fa4f2ce0000ecacdcda9270c1eb3ef08dac424342f4c'
            '684099246da5fa072d0ee9c00ddec097390180d4348c96a893ed72098df0e5f8519d61905a1423f147792f9ec3cba18893e0c10ded191df2e59f4e603a2abd51')
