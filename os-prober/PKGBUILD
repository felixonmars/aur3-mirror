# Contributor: darkcoder <mario_vazq.hotmail.com>

pkgname=os-prober
pkgver=1.49
pkgrel=3
pkgdesc="Utility to detect other OSes on a set of drives"
url="http://joey.kitenet.net/code/os-prober/"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=('gcc' 'sed')
source=(ftp://ftp.us.debian.org/debian/pool/main/o/${pkgname}/${pkgname}_${pkgver}.tar.gz)
md5sums=('5a981493a7c16174e6454fcf6b39b1b5')
sha512sums=('473f02807bdc971d6abf976f8a708691767ba85d45b54c1c87310c62626959f30e524aca2fb08843dfc859f26bd80cbbba016235137aa87db1c4151f6e893fa4')

build() {
  cd $srcdir/${pkgname}

  # adjust lib dir to allow detection of 64-bit distros
  sed -i -e "s:/lib/ld\*\.so\*:/lib*/ld*.so*:g" os-probes/mounted/common/90linux-distro  || die "sed failed on 90linux-distro"

  make

  install -Dm755 linux-boot-prober $pkgdir/usr/bin/linux-boot-prober
  install -Dm755 os-prober $pkgdir/usr/bin/os-prober
  install -Dm755 newns $pkgdir/usr/lib/os-prober/newns

  install -Dm755 linux-boot-probes/common/50mounted-tests $pkgdir/usr/lib/linux-boot-probes/50mounted-tests
  install -Dm755 linux-boot-probes/mounted/x86/40grub $pkgdir/usr/lib/linux-boot-probes/mounted/40grub
  install -Dm755 linux-boot-probes/mounted/x86/50lilo $pkgdir/usr/lib/linux-boot-probes/mounted/50lilo
  install -Dm755 linux-boot-probes/mounted/common/40grub2 $pkgdir/usr/lib/linux-boot-probes/mounted/40grub2
  install -Dm755 linux-boot-probes/mounted/common/90fallback $pkgdir/usr/lib/linux-boot-probes/mounted/90fallback

  install -Dm755 os-probes/common/50mounted-tests $pkgdir/usr/lib/os-probes/50mounted-tests
  install -Dm755 os-probes/init/common/10filesystems $pkgdir/usr/lib/os-probes/init/10filesystems
  for f in os-probes/mounted/x86/* ; do 
    install -Dm755 $f $pkgdir/usr/lib/os-probes/mounted/`basename $f`
  done
  install -Dm755 os-probes/mounted/powerpc/20macosx $pkgdir/usr/lib/os-probes/mounted/20macosx
  install -Dm755 os-probes/mounted/common/40lsb $pkgdir/usr/lib/os-probes/mounted/40lsb
  install -Dm755 os-probes/mounted/common/90linux-distro $pkgdir/usr/lib/os-probes/mounted/90linux-distro

  install -Dm755 common.sh $pkgdir/usr/share/os-prober/common.sh  
  install -Dm644 debian/copyright $pkgdir/usr/share/doc/os-prober/copyright  
  
  # create a empty labels file, will be used by os-prober at execution
  mkdir -p $pkgdir/var/lib/os-prober
  touch $pkgdir/var/lib/os-prober/labels 
  chmod 644 $pkgdir/var/lib/os-prober/labels
}

