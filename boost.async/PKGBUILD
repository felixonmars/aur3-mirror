pkgname=boost.async
_realname=async
pkgver=0.2
pkgrel=1
provides=('boost.async' 'boost.tp' 'boost.futures')
pkgdesc="an asynchronous framework that allows the calling of functions and functors in an asynchronous manner, thereby making it easier to improve the level of concurrency and parallelism in your applications"
url="http://www.boostpro.com/vault"
license=('boost')
depends=('boost' 'gcc')
arch=('any')

source=("http://www.boostpro.com/vault/index.php?action=downloadfile&filename=$_realname.zip&directory=Concurrent%20Programming&"
        'corrections.patch')
build()
{
    cd $srcdir/$_realname || return 1   
    patch -Np1 < ../corrections.patch
    install -d $pkgdir/usr/include/
    cp -r boost $pkgdir/usr/include/
    rm -rf $pkgdir/usr/include/boost/range
}

md5sums=('b47ff34e9164201736b0e37fcfc7e75e'
         '448dfc7826714a5c2adb905668d0b5f7')
