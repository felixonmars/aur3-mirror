# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=amazonmp3
pkgver=1.0.9
pkgrel=9
pkgdesc="The Amazon MP3 downloader"
arch=(i686 x86_64)
url=http://www.amazon.com/gp/dmusic/help/amd.html
license=(unknown)
depends=(desktop-file-utils lib32-{gtk2,lib{idn,png12,xml2},openssl098})
optdepends=('lib32-libcanberra: to get rid of an annoying error')
[[ $CARCH == "i686" ]] && depends=(${depends[@]/lib32-/}) && optdepends=(${optdepends[@]/lib32-/})
install=$pkgname.install
source=(http://mirrors.kernel.org/ubuntu/pool/main/{\
c/cairomm/libcairomm-1.0-1_1.8.0-1build2,\
c/curl/libcurl3_7.21.0-1ubuntu1,\
g/glibmm2.4/libglibmm-2.4-1c2a_2.16.4-0ubuntu1,\
g/gtkmm2.4/libgtkmm-2.4-1c2a_2.20.2-1,\
i/icu/libicu38_3.8-6ubuntu0.2,\
libg/libglademm2.4/libglademm-2.4-1c2a_2.6.7-2build1,\
libg/libglade2/libglade2-0_2.6.4-1build1,\
libs/libsigc++-2.0/libsigc++-2.0-0c2a_2.0.17-2ubuntu3,\
p/pangomm/libpangomm-1.4-1_2.26.1-1\
}_i386.deb
    http://security.ubuntu.com/ubuntu/pool/universe/b/boost/libboost-{date-time,filesystem,iostreams,regex,signals,thread}1.34.1_1.34.1-4ubuntu3_i386.deb
    http://amazonm-002.vo.llnwd.net/u/d1/clients/en_US/$pkgver/${pkgname}_$pkgver~ibex_i386.deb
)
noextract=(${source[@]##*/})
sha256sums=('02181c11384726dad7c871144da95410df63cd36d5e60596d5f04999faff68bf'
    'c08533c4a81fb8f3554aa0a06a2307608cd744ffcd35509b03cafed8826dffdb'
    'e00b4515a20e16d13fe6087c575f94efa6768f1deb2130fdab9686feda16b242'
    'ef6e5079e0006e586c33d86adc98d7f5cd6111441eed718a09c62c0f6a107d5c'
    '42d091d91cc1212b44622d4939f0e8d57c21d258bea80e8eece70465f3d5e0c2'
    '484386987f497535695ad16258ccc8fc53bf3c99fca5601705b23272d7594f49'
    '886bc1f3a9d267c99785e2046e575826583bc1dd37ab33ca0f261d35cd2d1c28'
    '3a244c050523502bb6ef31c9e5aca1b17d6d51ce650b89d53b7ea6f35d736816'
    '810430dd499c7e8c3d78c7626f75bbfda8c4e150c538cd7673af3f86fea69f6d'
    'c7dc89b0f5f9f22848cf5c4d74b6273d09ecd44baeb19aaa233b82d6d682b7ee'
    '718941af93f476badc474e06f5ce9b1bd3cd505af0606b3c2d77668704f1f47a'
    'e2fe9da285bc720a7e4628960525747583805f8f6b47b13421568cbfcdd16728'
    '78f65c83a3f719bd687144c5c3b583c9ad51fa0afd65f907583a36886f09c11f'
    '44f289f4f95e4ffed730ac22fe032a9376e92c740459f5cc6395a677655b4a80'
    '3df5ba524b994c4a60cf59f701f589554b5ca01b62419266fdd813854efb72ce'
    '65139b7dcf55c9342013d89adf7808c2011bfd1b61284f29d2d396f5389290a1')
sha512sums=('7036f2b984fa183229edd25a6299e5e612a4de7fb3debb39dc5f1995a27dbc024dfb1fc5ec2bc5d12d223b86de5b9006d3ae4cfbce4deb3c7770a4236203f832'
    '924e20d5fa0900113a95cc15228a0264ec7c261795341ba6a633d2385ef6e60329cb774950582d1f2480626e6438cbb4d1cf78114e19050bbc54c6961434d13b'
    '4775899b9ed1409737ba7a86627cc093a86f1af1207ac4fa970e360411c9db59a73491ae747b5f4e21addf2a6202d0873b207b85980be44fb6180940767111dc'
    '2583942ee3ddb169e9d20645c17b7da574c4a7c1c38bc93c0f89ff9c5fef1b87a65769634848c25641e2cf5fcc9705f5cc730550e7b04eca5192733f5e2e3e4b'
    '04f354df6be56e5ece120d0292b794a89a8a9706342646e085d24dee475050148fffed6117658d1bc6d55e80a2b96289aedefb5dfe01eadec267f6978a0b334d'
    'd0cb772a8e0b2eaa2ab85fb5159ec50a7feccef69ec18831734cdfbee0f3d73f40bfe2b1352378cad63f855ac804c1df183e8b11131c316699f594cfa2243c90'
    '334fd4ed9792045a44801371ef4657c3d88eb5e38b7c7bc2c3c62fb647b8753ec784edad8e017f7829c9b839adf547851a6bb4819df1f73b12bb63808b83da15'
    'e928b1fb14820325724fc1e835a32b914219cb01397ee9c3db97d60a366ce9221fe0162c3e27185c3232fca4ad41301a5296726cc485b4ea0ab98f7102504d49'
    'facc675e53fc0cee2da6cc9a15e50a7cf979ab163e7193ebd2e5c558e3fdd77a33208ee68cb6685791cba76e6eb5ce81889694c0fbb08d2a879d14df89c52979'
    '8e742a52e215e2b039c97f98888a590f02cfb7ecd9c09001f3635aa7f428fe532b44764d5a905c81e4d22396d9ad4f1ee3c10bea673380a9e49c4fac6cb84af1'
    'f94ca3ab45c7da36db5eb6760440f797fddbccbecc32cdaa5e9b800d2885a20a2afc95e244403755163fc38e43df5ff41abd3bbcb05a117c03834f88aa78ec1a'
    '10bdd0f7e69cf850c8384288dff5e2afbacba975bafb78386e6f23876b82424ea851a260b11eef585d10a104ad98efa8bf475d59a909e78570df79a1811bde83'
    'c65a33345cbbce0aaebf28f03e6bdd81a1d1b25abed9c027ccafd237479c51160756b71d795aae64bf65aabad2bb4941acaeda0c23f46455001a52d2473d0390'
    '711a3c5e4551c281185467aa1beba75437b2f435bc1ec207dde9700fec374787ba8701d9c3587b5ddbeb042ae45742923285063a87ba35d7f7aba1fb737fa87c'
    '4338413853dd60b2412f65b5426257a81d6f103a26673189daf17dc1eb2d52b3059372e9e7949fa3b67c261c0d52f1492e5cd97e8ae6d473e5cba3fb892cc59d'
    '152ef17957e1588da9fb67c1fd94e5793883a0227d5c099e20a708ea017301368041254139ba098f7f41fbbaed1da4befe5121b86506b84c3e44c820f9114c57')

package() {
    cd "$srcdir"
    for i in *deb; do
        ar xv "$i" data.tar.gz
        mv data.tar.gz "$i-data.tar.gz"
    done

    cd "$pkgdir"
    for i in "$srcdir"/*-data.tar.gz; do
        tar -xzf "$i"
    done
    sed -i 's/0.9.8/1.0.0/' usr/bin/$pkgname
    [[ $CARCH == "x86_64" ]] && mv usr/lib usr/lib32
    rm -rf usr/share/xml
}
