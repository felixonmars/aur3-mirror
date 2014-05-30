# Contributor: Vincent Szolnoky <ippytraxx@installgentoo.com>

pkgname=zenbu
pkgver=0.0.1_214
_pkgver=214
_major=8
_minor=5
_build=13
pkgrel=1
pkgdesc="A cross-platform anime/manga management client"
arch=("i686" "x86_64")
url="https://bitbucket.org/Ippytraxx/zenbu/"
license=("GPL3")
install=$pkgname.install

_arch=x64
_arch2=amd64
if [ "${CARCH}" = 'i686' ]; then
  _arch=i586
  _arch2=i386
fi

source=("http://dl.bintray.com/ippy-traxx/generic/Zenbu-pre_beta-rev${_pkgver}.jar"
	  "http://download.oracle.com/otn-pub/java/jdk/${_major}u${_minor}-b${_build}/jre-${_major}u${_minor}-linux-${_arch}.tar.gz"
          "zenbu.sh")
md5sums=('3803321e3f10454261008135be5fb8c1'
         'SKIP'
         '4fbf8fd40c6a2257ed16a4a7f3adebeb')

noextract=("Zenbu-pre_beta-rev${_pkgver}.jar")

DLAGENTS=('http::/usr/bin/curl -LC - -b "oraclelicense=accept-securebackup-cookie" -O')


package()
{
    # Install files to /opt
    mkdir -p $pkgdir/opt/zenbu/{app,runtime}
    chmod 757 -R $pkgdir/opt/zenbu/app/

    cp $srcdir/Zenbu-pre_beta-rev${_pkgver}.jar $pkgdir/opt/zenbu/app/zenbu.jar
    cp -r $srcdir/jre1.${_major}.0_0${_minor}/* $pkgdir/opt/zenbu/runtime/

    # Install launcher
    install -m 755 -D $srcdir/zenbu.sh $pkgdir/usr/bin/zenbu

    # Copy icon
    # TODO

    # Install menu item
    # TODO
}
