#based on starfish's updated PKGBUILD and Ubuntu Documentation (https://help.ubuntu.com/community/DialupModemHowto/Conexant)
#framewrk.h and osservices.h by diaco, with Ganton's instructions : http://ubuntuforums.org/showthread.php?p=10100007#post10100007

pkgname=hsfmodem-dell
pkgver=7.80.02.06full
pkgrel=2
pkgdesc="Linux drivers for the Conexant HSF Softmodem family (kernel modules), with Dell binaries"
arch=('i686' 'x86_64')
url="http://www.linuxant.com/drivers/hsf/"
license=('GPL' 'custom')
depends=("hsfmodem-utils-dell>=$pkgver" "kernel26>=2.6.39")
install=hsfmodem.install

case "$CARCH" in
  i686)
    source=(http://www.linuxant.com/drivers/hsf/full/archive/hsfmodem-${pkgver}/hsfmodem-${pkgver}.tar.gz
            http://linux.dell.com/files/ubuntu/hardy/modem-drivers/hsf/hsfmodem-7.68.00.09oem.tar.gz
            framewrk.h
            osservices.h
            fix-deprecated-include.patch)
    md5sums=('8eb0935e86b898190bf20c08894af17e'
             '71bccfcb8caed31b91e605889e94bcc9'
             '9bb75183e6bbda5cc27c3aa3214b1659'
             'c6bb8a0ce9b373e950a12bfa0e32a965'
             '2e0b08e9186ce995f25905445782cbdc')
    ;;
  x86_64)
    source=(http://www.linuxant.com/drivers/hsf/full/archive/hsfmodem-${pkgver%full}${CARCH}full/hsfmodem-${pkgver%full}${CARCH}full.tar.gz
            http://linux.dell.com/files/ubuntu/hardy/modem-drivers/hsf/hsfmodem-7.68.00.09x86_64oem.tar.gz
            framewrk.h
            osservices.h
            fix-deprecated-include.patch)
    md5sums=('74df1a0af818a918a68b38bf9a01599b'
             '9cfa801c88f9c61cb26db786d64872c7'
             '9bb75183e6bbda5cc27c3aa3214b1659'
             'c6bb8a0ce9b373e950a12bfa0e32a965'
             '2e0b08e9186ce995f25905445782cbdc')
    ;;
esac

build() {
  cd $srcdir/hsfmodem-${pkgver%full}*full/
  patch -Np1 -i ../fix-deprecated-include.patch
  cd $srcdir/hsfmodem-${pkgver%full}*full/modules/

  rm -r imported
  cp -R $srcdir/hsfmodem-7.68.00.09x86_64oem/modules/imported ./
  cp -pr $srcdir/framewrk.h ./imported/include/framewrk.h
  cp -pr $srcdir/osservices.h ./imported/include/osservices.h
  
  #fix compilation errors, taken from http://openmamba.org/pub/openmamba/devel-kernel/patches/hsfmodem-7.80.02.06-kernel-2.6.37.patch
  sed -e 's/static DECLARE_MUTEX(cnxt_port_sem);/static DEFINE_SEMAPHORE(cnxt_port_sem);/g' -i GPL/serial_cnxt.c
  sed -e 's/.ioctl	= diag_ioctl,/.compat_ioctl = diag_ioctl,/g' -i osdiag.c
  sed -e 's/static DECLARE_MUTEX(nvmelem_writelist_sem);/static DEFINE_SEMAPHORE(nvmelem_writelist_sem);/g' -i osnvm.c
  
  #fix compilation errors for 2.6.39 (BKL removal)
  sed -e 's*#include <linux/smp_lock.h>**g' -i osservices.c
  sed -e 's/static spinlock_t atomic_lock __attribute__((unused)) = SPIN_LOCK_UNLOCKED;/static DEFINE_SPINLOCK(atomic_lock);/g' -i osservices.c
  sed -e 's/	lock_kernel();//g' -i osservices.c
  sed -e 's/	unlock_kernel();//g' -i osservices.c
  sed -e 's/static spinlock_t tqueue_lock __attribute__((unused)) = SPIN_LOCK_UNLOCKED;/static DEFINE_SPINLOCK(tqueue_lock);/g' -i GPL/oscompat.h
  sed -e 's/static spinlock_t diag_lock = SPIN_LOCK_UNLOCKED;/static DEFINE_SPINLOCK(diag_lock);/g' -i osdiag.c
  sed -e 's/static spinlock_t fpstates_lock __attribute__((unused)) = SPIN_LOCK_UNLOCKED;/static DEFINE_SPINLOCK(fpstates_lock);/g' -i osfloat.c
  sed -e 's/static spinlock_t dcp_lock = SPIN_LOCK_UNLOCKED;/static DEFINE_SPINLOCK(dcp_lock);/g' -i osdcp.c
  
  make CNXT_MODS_DIR=$pkgdir/lib/modules/$(uname -r)/extra modules_install || return 1
  make CNXTLIBDIR=$pkgdir/usr/lib/hsfmodem CNXT_MODS_DIR=$pkgdir/lib/modules/$(uname -r)/extra modules_install
}
