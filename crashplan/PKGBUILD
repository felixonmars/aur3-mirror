# Maintainer: Egon Geerardyn <egon [dot] geerardyn [at] gmail [dot] com>
# Contributor: Bill Durr <billyburly [at] gmail [dot] com>
pkgname=crashplan
pkgver=3.2.1
pkgrel=2
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
  echo "You must review and agree to the EULA before installation."
  echo ""
  echo -n "Press enter to read the EULA. "
  read ENTER

  more EULA.txt

  agreed=0
  while [ "${agreed}" == "0" ] ; do
    echo ""
    echo -n "Do you accept and agree to be bound by the EULA? (yes/no) "
    read reply
    case ${reply} in
      [yY] | [yY][eE][sS])
	agreed=1
	;;
      [nN] | [nN][oO])
	echo "If you do not agree to the license then CrashPlan may not be installed. Exiting.";
	exit 1
	;;
    esac
  done

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

  install -D -m 644 $srcdir/CrashPlan-install/install.vars $pkgdir/opt/$pkgname/install.vars
  install -D -m 644 $srcdir/CrashPlan-install/EULA.txt $pkgdir/opt/$pkgname/EULA.txt
  install -D -m 644 $srcdir/CrashPlan-install/EULA.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 $srcdir/CrashPlan-install/scripts/CrashPlanDesktop $pkgdir/opt/$pkgname/bin/CrashPlanDesktop
  install -D -m 644 $srcdir/CrashPlan-install/scripts/run.conf $pkgdir/opt/$pkgname/bin/run.conf
  install -D -m 755 $srcdir/CrashPlan-install/scripts/CrashPlanEngine $pkgdir/opt/$pkgname/bin/CrashPlanEngine
  install -D -m 755 $srcdir/CrashPlan-install/scripts/CrashPlan.desktop $pkgdir/usr/share/applications/crashplan.desktop

  install -D -m 755 $srcdir/crashplan $pkgdir/etc/rc.d/crashplan
}
