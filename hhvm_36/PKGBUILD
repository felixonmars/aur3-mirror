# Author: Daniel Kozak <kozzi11@gmail.com>
_pkgname=hhvm
pkgname=hhvm_36
pkgver=3.6.0
_thirdparty_commit=1b6b1a5e311df5e2b57f580657666be7778def54
_folly_commit=7d2497f0e57fb14b6ea43a5a2d180604d7e1e7e5
_thrift_commit=d30280a33ed2c67672b0295872397e5affb60f8c
_proxygen_commit=d17b4e7735ab728d77266a538cef4dcfc57b5fbd
_webscalesql_commit=004b6b348fdf48f0aa4e3fe1010b891d4fdb9f70
_re2_commit=bdb5058dcf7a3e6e8fe524a6214d5a7a6e9dcba2
_squangle_commit=269cd2e30a88b16b1cdf12f1eec5a1c16cb8be10


pkgrel=4
pkgdesc="Virtual Machine, Runtime, and JIT for PHP"
arch=('x86_64')
url="http://hhvm.com"
license=('PHP')
depends=('boost-libs' 'google-glog' 'libmemcached' 'libzip'
         'libxslt' 'intel-tbb' 'libmcrypt' 'oniguruma' 'jemalloc' 'curl' 'libvpx'
         'libdwarf' 'imagemagick' 'libedit' 'sqlite' 'libyaml' 'fribidi')
makedepends=('git' 'cmake' 'gcc' 'boost' 'gflags' 'python2' 'pfff-git')
source=("https://github.com/facebook/hhvm/archive/HHVM-$pkgver.tar.gz"
        "hhvm-third-party-$_thirdparty_commit.tar.gz::https://github.com/hhvm/hhvm-third-party/archive/$_thirdparty_commit.tar.gz"
        "folly-$_folly_commit.tar.gz::https://github.com/facebook/folly/archive/$_folly_commit.tar.gz"
        "thrift-$_thrift_commit.tar.gz::https://github.com/facebook/fbthrift/archive/$_thrift_commit.tar.gz"
        "proxygen-$_proxygen_commit.tar.gz::https://github.com/facebook/proxygen/archive/$_proxygen_commit.tar.gz"
        "webscalesql-$_webscalesql_commit.tar.gz::https://github.com/webscalesql/webscalesql-5.6/archive/$_webscalesql_commit.tar.gz"
        "squangle-$_squangle_commit.tar.gz::https://github.com/facebook/squangle/archive/$_squangle_commit.tar.gz"
        "re2-$_re2_commit.tar.gz::https://github.com/google/re2/archive/$_re2_commit.tar.gz"
        'hhvm.tmpfile'
        'hhvm.service'
        'hhvm@.service'
        'php.ini'
        'server.ini')

provides=(hhvm)
install=hhvm.install
backup=(etc/hhvm/{php,server}.ini)
options+=('!buildflags')

prepare() {
    cd "$srcdir"/$_pkgname-HHVM-$pkgver

    rm -rf third-party
    ln -s "$srcdir"/hhvm-third-party-$_thirdparty_commit third-party

    cd third-party/folly
    rm -rf src
    ln -s "$srcdir"/folly-$_folly_commit src

    cd ../thrift
    rm -rf src
    ln -s "$srcdir"/fbthrift-$_thrift_commit src

    cd ../proxygen
    rm -rf src
    ln -s "$srcdir"/proxygen-$_proxygen_commit src
    
    cd ../squangle
    rm -rf src
    ln -s "$srcdir"/squangle-$_squangle_commit src
    
    cd ../re2
    rm -rf src
    ln -s "$srcdir"/re2-$_re2_commit src
   
    cd ../webscalesqlclient
    rm -rf src webscalesql-5.6
    ln -s "$srcdir"/webscalesql-5.6-$_webscalesql_commit webscalesql-5.6
    ln -s "$srcdir"/webscalesql-5.6-$_webscalesql_commit src

    cd "$srcdir"
}

build() {
    cd "$srcdir"/$_pkgname-HHVM-$pkgver
    msg2 "Building hhvm"

    cmake -Wno-dev \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_PREFIX_PATH="$srcdir" \
        -DENABLE_MCROUTER=Off \
        .

    make -j8

    for hacktool in hackificator remove_soft_types; do
        cd "$srcdir"/$_pkgname-HHVM-$pkgver/hphp/hack/tools/$hacktool
        make depend
        make
    done
}


package() {
    cd "$srcdir"/$_pkgname-HHVM-$pkgver
    make DESTDIR="$pkgdir/" install
    mv "$pkgdir"/usr/lib{64,}

    cd hphp/hack/bin
    for bin in hh_* tools/*; do
        install -Dm755 $bin "$pkgdir"/usr/bin/$(basename $bin)
    done

    cd "$srcdir"
    install -Dm644 hhvm.tmpfile "$pkgdir"/usr/lib/tmpfiles.d/hhvm.conf
    install -Dm644 hhvm.service "$pkgdir"/usr/lib/systemd/system/hhvm.service
    install -Dm644 hhvm@.service "$pkgdir"/usr/lib/systemd/system/hhvm@.service

    install -Dm644 php.ini "$pkgdir"/etc/hhvm/php.ini
    install -Dm644 server.ini "$pkgdir"/etc/hhvm/server.ini
}
sha256sums=('5840d7caf7f8b57e35953e98fa89fa697f810c8de784950f31953cf36f9ce987'
            'dfb15176cd84e7282ecf968eadeb9837a6cbae87ea0e0cc6b109cff6e65297dc'
            'f09a38084cc4b8c9cc2ac70daf025d7c2f1710c2eae38fd7aec2b6c29b6e70aa'
            'd58cbfc110761bd70b74b849b3eb83b3e43e066cbf1969f403d47630a22d5bef'
            '81f61f6585b04eced0d1ff2b9ab77e3adfcf4c6e90be1ad37c7ae51bdc582f7e'
            'd2bd5475aaffbd8804736f8e13fdcb8f370d99d6c20b571561f5a065f4faa73f'
            'c7ad48ff41343d1b0354c8afb6778d7c4bcfcb3d6f7264afcbcabfcfb75c47b8'
            'b61eac4705f98812b17d47dfab8ed7f0853f919eda1592c6c2863ccd2ec6aa5f'
            'c356010a6d6b976f387bb205a75ea07d5f40593a8010483f2ed0f66f112331bc'
            '8b50d1ef9f5f726e6d8d469a8c84d85ad63f8b507b97d258b4d751a0e3e221df'
            '59c640602929dac0aa34d06c668ed69361eb4b7b47a77f9aa0badb4d0b61571c'
            '3e3093f817706c238fad021483f114fd4ce0b45d84097dcb7870157fc9ec769f'
            '5b53bc57965e1c5151d720dc7f63f1b2e8ebd5e758b2ef0be3b74df38ebcbce0')
