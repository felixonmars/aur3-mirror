# kopiersperre
pkgname=manpages-de
pkgver=1.7
pkgrel=1
pkgdesc="Deutsche Handbuchseiten (manpages)"
arch=('any')
url="http://manpages-de.alioth.debian.org"
#packages.debian.org/sid/manpages-de
license=('GPL')
depends=('man')
builddepends=('7z')
source=(http://ftp.de.debian.org/debian/pool/main/m/${pkgname}/${pkgname}_${pkgver}-1_all.deb)
md5sums=('3ec19521794f2e7ec066ecea7416d075')
option=(docs)

package() {
    cd $srcdir
    7z x data.tar.xz
    7z x data.tar

    mkdir -p $pkgdir/usr/share
    cp -r $srcdir/usr/* $pkgdir/usr/
    chmod 755 $pkgdir/usr/share/man

    # dirty hack: delete manpages, which are present in package shadow
    cd $pkgdir/usr/share/man/de/man1/
    ls
    rm -f chage.1.gz expiry.1.gz gpasswd.1.gz groups.1.gz passwd.1.gz sg.1.gz

    cd ../man3/
    rm -f getspnam.3.gz shadow.3.gz

    cd ../man5/
    rm -f faillog.5.gz gshadow.5.gz login.defs.5.gz passwd.5.gz shadow.5.gz suauth.5.gz

    cd ../man8/
    rm -f chgpasswd.8.gz chpasswd.8.gz faillog.8.gz groupadd.8.gz groupdel.8.gz groupmems.8.gz groupmod.8.gz grpck.8.gz grpconv.8.gz grpunconv.8.gz \
    lastlog.8.gz newusers.8.gz pwck.8.gz pwconv.8.gz pwunconv.8.gz useradd.8.gz userdel.8.gz usermod.8.gz
}
