# Maintainer: Egon Geerardyn <egon [dot] geerardyn [at] gmail [dot] com>
# Contributor: Bill Durr <billyburly [at] gmail [dot] com>
pkgname=crashplan
pkgver=3.2.1
pkgrel=5
pkgdesc="an online/offsite backup solution"
url="http://www.crashplan.com"
arch=('i686' 'x86_64')
license=('custom')
depends=('java-runtime')
makedepends=('grep' 'cpio' 'gzip')
backup=()
install=crashplan.install
source=(http://download.crashplan.com/installs/linux/install/CrashPlan/CrashPlan_${pkgver}_Linux.tgz
        crashplan)
md5sums=('692ced7630bdcb439379cde708a1e7c2'
         '469763784eb17a8410a227706055e00c')

build() {
  cd $srcdir/CrashPlan-install

  echo ""
  echo "You must review and agree to the EULA before using Crashplan."
  echo "You can do so at:"
  echo "  - http://support.crashplan.com/doku.php/eula"
  echo "  - /usr/share/licenses/${pkgname}/LICENSE"
  echo ""

  echo "" > install.vars
  echo "JAVACOMMON=$JAVA_HOME/bin/java" >> install.vars
  echo "TARGETDIR=/opt/$pkgname" >> install.vars
  echo "BINSDIR=" >> install.vars
  echo "MANIFESTDIR=/opt/$pkgname/manifest" >> install.vars
  echo "INITDIR=" >> install.vars
  echo "RUNLVLDIR=" >> install.vars
  NOW=`date +%Y%m%d`
  echo "INSTALLDATE=$NOW" >> install.vars

  sed -imod "s|Exec=.*|Exec=/opt/$pkgname/bin/CrashPlanDesktop|" $srcdir/CrashPlan-install/scripts/CrashPlan.desktop
  sed -imod "s|Icon=.*|Icon=/opt/$pkgname/skin/icon_app_64x64.png|" $srcdir/CrashPlan-install/scripts/CrashPlan.desktop
  sed -imod "s|Categories=.*|Categories=System;|" $srcdir/CrashPlan-install/scripts/CrashPlan.desktop

}

package() {
  mkdir -p $pkgdir/opt/$pkgname
  cd $pkgdir/opt/$pkgname

  cat $srcdir/CrashPlan-install/CrashPlan_$pkgver.cpi | gzip -d -c - | cpio -i --no-preserve-owner
  chmod 777 $pkgdir/opt/$pkgname/log
  sed -i "s|<manifestPath>manifest</manifestPath>|<manifestPath>/opt/$pkgname/manifest</manifestPath>|g" $pkgdir/opt/$pkgname/conf/default.service.xml

  mkdir -p $pkgdir/usr/bin
  ln -s "/opt/$pkgname/bin/CrashPlanDesktop" $pkgdir/usr/bin/CrashPlanDesktop

  # Fix for 32 bit: 64 bit libs cannot be stripped from symbols
  # so we just remove those libs
  if [ "$CARCH" = "i686" ]; then
    rm $pkgdir/opt/$pkgname/*64.so
  fi

  # Fix for encoding troubles (CrashPlan ticket 178827)
  # Make sure the daemon is running using the same localization as
  # the (installing) user
  echo "" >> $srcdir/CrashPlan-install/scripts/run.conf
  echo "export LC_ALL=$LANG" >> $srcdir/CrashPlan-install/scripts/run.conf

  install -D -m 644 $srcdir/CrashPlan-install/install.vars $pkgdir/opt/$pkgname/install.vars
  install -D -m 644 $srcdir/CrashPlan-install/EULA.txt $pkgdir/opt/$pkgname/EULA.txt
  install -D -m 644 $srcdir/CrashPlan-install/EULA.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 $srcdir/CrashPlan-install/scripts/CrashPlanDesktop $pkgdir/opt/$pkgname/bin/CrashPlanDesktop
  install -D -m 644 $srcdir/CrashPlan-install/scripts/run.conf $pkgdir/opt/$pkgname/bin/run.conf
  install -D -m 755 $srcdir/CrashPlan-install/scripts/CrashPlanEngine $pkgdir/opt/$pkgname/bin/CrashPlanEngine
  install -D -m 755 $srcdir/CrashPlan-install/scripts/CrashPlan.desktop $pkgdir/usr/share/applications/crashplan.desktop

  install -D -m 755 $srcdir/crashplan $pkgdir/etc/rc.d/crashplan
}
