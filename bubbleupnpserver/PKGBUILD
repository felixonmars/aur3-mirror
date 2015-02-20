# Maintainer: Eric Bond <eric at ericbond dot net>
pkgname=bubbleupnpserver
pkgver=0.9
pkgver_suffix="-2_all"
pkgrel=2
pkgdesc="Stream UPnP content to Android devices over the Internet"
arch=('any')
url="http://www.bubblesoftapps.com/bubbleupnpserver/"
license=('custom:bubbleupnpserver')
depends=('java-runtime-headless>=6' 'ffmpeg' 'unzip' 'start-stop-daemon')
install=${pkgname}.install
source=("http://bubblesoftapps.com/bubbleupnpserver/BubbleUPnPServer-distrib.zip" "http://ppa.launchpad.net/bubbleguuum/${pkgname}/ubuntu/pool/main/b/${pkgname}/${pkgname}_${pkgver}${pkgver_suffix}.deb")
noextract=("BubbleUPnPServer-${pkgver}.zip")
md5sums=('52e98b77760b5fa59895c92bf96d1d59'
         '84d4573d8e4a4f95a9d9f6cb3448a858')

package() {
  cd ${srcdir}

  msg2 "Extracting files..."
  ar x "${srcdir}/${pkgname}_${pkgver}${pkgver_suffix}.deb" data.tar.gz
  tar xf ${srcdir}/data.tar.gz -C ${pkgdir} --exclude='./etc*'
  #tar xf ${srcdir}/data.tar.gz ./etc/default/${pkgname}
  tar xf ${srcdir}/data.tar.gz ./etc/init/${pkgname}.conf
  unzip -q "${srcdir}/BubbleUPnPServer-distrib.zip" -d ${pkgdir}/usr/share/${pkgname} -x launch.bat

  msg2 "Shifting some files around..."
  #install -D -m644 ${srcdir}/etc/default/${pkgname} ${pkgdir}/etc/default/${pkgname}
  install -D -m644 ${pkgdir}/usr/share/${pkgname}/LICENCE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  msg2 "Converting upstart script..."
  echo "#!/bin/sh" > ${pkgdir}/usr/share/${pkgname}/${pkgname}.sh
  cat ${srcdir}/etc/init/${pkgname}.conf \
    | grep -vE '^(description|author|start on|stop on|respawn|script|end script)' \
    | sed -r 's/^(\t|env )//' \
    | sed '/^$/N;/^\n$/D' \
    | sed "s/DATADIR=\/root/DATADIR=\/home\/$USER/g" \
    | sed "s/root/$USER/g" \
    | sed 's/DEFAULTFILE/#DEFAULTFILE/g' \
    >> ${pkgdir}/usr/share/${pkgname}/${pkgname}.sh

  msg2 "Installing systemd service unit file..."
  echo "[Unit]
Description=BubbleUPnP Server

[Service]
User=$USER
ExecStart=/usr/share/${pkgname}/${pkgname}.sh
SuccessExitStatus=1 2 SIGKILL

[Install]
WantedBy=network.target" > ${srcdir}/${pkgname}.service
  install -D -m644 ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service

  msg2 "Making startup scripts executable..."
  chmod +x ${pkgdir}/usr/share/${pkgname}/{${pkgname},launch}.sh
  sed -i 's/JAVA="java"/JAVA="\/opt\/java\/jre\/bin\/java"/g' ${pkgdir}/usr/share/${pkgname}/{${pkgname},launch}.sh
  }

# vim:set ts=2 sw=2 et:
