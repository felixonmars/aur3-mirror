# PKGBUILD by Muhammed Uluyol <muhammedu@gmail.com>
pkgname=flashplugin-lahf-fix
pkgver=0.1
pkgrel=2
pkgdesc="Workaround for some flash crashes on x86_64 machines with older machines"
arch=('x86_64')
url="http://bugs.gentoo.org/attachment.cgi?id=198604&action=edit"
license=('GPL')
source=('flashplugin-lahf-fix.c')
md5sums=('4e34681409a6123eafe4753cf08c50bb')

build() {
    cd ${srcdir}
    gcc -fPIC -shared -nostdlib -lc -oflashplugin-lahf-fix.so flashplugin-lahf-fix.c || return 1
    install -d -m755 ${pkgdir}/usr/lib/mozilla/plugins/ || return 1
    install -m755 flashplugin-lahf-fix.so ${pkgdir}/usr/lib/mozilla/plugins/ || return 1
}

