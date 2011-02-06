# Contributor: Vitaliy Berdinskikh <skipper13@archlinux.org.ua>
pkgname=java-usb
pkgver=1.0.2
pkgrel=1
pkgdesc="Java USB Interface"
arch=('x86_64' 'i686')
url="http://javax-usb.org"
license=('CPL')
depends=('java-runtime')
makedepends=('java-environment' 'gcc' 'apache-ant')

_usb_api=javax-usb_${pkgver}
_usb_ri=javax-usb-ri_${pkgver}
_usb_linux=javax-usb-ri-linux_${pkgver}

source=(http://downloads.sourceforge.net/javax-usb/${_usb_api}.tar.bz2
	http://downloads.sourceforge.net/javax-usb/${_usb_ri}.tar.bz2
	http://downloads.sourceforge.net/javax-usb/${_usb_linux}.tar.bz2
	classpath.patch)
md5sums=('f0cc57eee22a9aa99573b6a4d54e076f'
         'e1b3583d5f7dd2ee2d6cdff83ef8d348'
         'f0152b2ba124e871c6bd69f83ebd368d'
         '08fea838f34ea2f1add468024a614a52')
sha1sums=('f4ed13617639f75223a80994f831a22d852e88e0'
          'd69cc0c61198be6e848affc3ec32b9278f1bde09'
          '6120fd2829845a18680595c6f63d6554d97fbe15'
          'a0116b5d0357b7102bc9d05599e7f9cd6ccdfea4')

build() {
    cd ${startdir}/src/
    patch -p1 < classpath.patch
    mkdir javax-usb-ri/lib

    cd javax-usb
    ant jars || return 1
    cp -a lib/*.jar ../javax-usb-ri/lib

    cd ../javax-usb-ri
    ant jars || return 1
    cp -a lib/*.jar ../javax-usb-ri-linux/lib

    cd ../javax-usb-ri-linux
    ant jars || return 1

    mkdir -p ${startdir}/pkg/usr/share/java/${pkgname} ${startdir}/pkg/usr/lib || return 1
    install -m644 lib/*.jar ${startdir}/pkg/usr/share/java/${pkgname} || return 1
    install -m644 lib/javax.usb.properties ${startdir}/pkg/usr/share/java/${pkgname}
    install -m755 lib/libJavaxUsb.so ${startdir}/pkg/usr/lib
}
