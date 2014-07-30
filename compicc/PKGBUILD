
pkgname=compicc
pkgver=0.8.9
pkgrel=1
pkgdesc="Compiz ICC colour server" 
depends=('oyranos>=0.9.0'
         'compiz-core')
arch=('i686' 'x86_64')
license=('BSD')
url="http://sourceforge.net/projects/compicc/"
source=("http://sourceforge.net/projects/compicc/files/Compicc/compicc-$pkgver.tar.bz2"
        "configure_tests.patch"
        "configure.patch")
sha512sums=('86faaff57ed2fcf846c48f630f8500fd41a8afa5ec0d91d24d7449178079e10927c0e545f99ee289dc4090aaa19bf70c9e9b0242c237ef562e671cb3dd96555d'
            '1382a03680151e019e2ca01689cc63d34e046cc9db04b08291acafcd2ddb66f6f948569b30f93f0121e36f760b3647f7d1afaa6a6b87ed6de0732c197795fb7e'
            'b16620b5586ee5eb2232456f58adaf46c10079b72ad7851a9dc5865e2e38945a393c7c733fd2a41c0186d5797bd7aa31b4c0ea2d565830b1c2016b55ab030cee')


build() {

cd "$srcdir/$pkgname-$pkgver"

patch -p0 < ../configure_tests.patch
#patch -p0 < ../configure.patch
./configure --prefix=/usr --plugindir=/usr/lib/compiz --libdir=/usr/lib
make

}

package() {

cd "$srcdir/$pkgname-$pkgver"
make DESTDIR="$pkgdir/" install 
msg "ICC profiles: put in ~/.local/shared/color/icc/ and its subdirectories"

}
sha512sums=('ec017f3efd9f2436240f2587aa1b93ede0bc7298ed47dafaff2cf291b0b5af50d871ee01f87b9c4daa8ca9cf3f6282b2e63727bfa8a91f21421e97503f20018a'
            '1382a03680151e019e2ca01689cc63d34e046cc9db04b08291acafcd2ddb66f6f948569b30f93f0121e36f760b3647f7d1afaa6a6b87ed6de0732c197795fb7e'
            'b16620b5586ee5eb2232456f58adaf46c10079b72ad7851a9dc5865e2e38945a393c7c733fd2a41c0186d5797bd7aa31b4c0ea2d565830b1c2016b55ab030cee')
