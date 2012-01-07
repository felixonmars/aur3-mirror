# Maintainer: n3lthon
pkgname=cartaodecidadao
pkgver=1.23.0
pkgrel=2
pkgdesc="Portuguese Citizen Card Application"
arch=('i686' 'x86_64')
url="http://www.cartaodecidadao.pt/"
license=('custom')
depends=('qt>=4.5.0' 'pcsclite>=1.5.0' 'jasper' 'openssl' 'ccid' 'openssl098')

source=('https://www.portaldocidadao.pt/ccsoftware/cartao_de_cidadao_v1_23_ubuntu_10_04_i586.tar.gz'
	'cartaodecidadao.install'
	'Cartao de Cidadao.desktop'
	'cartaodecidadao.png')

md5sums=('f3524a4bac724ee94e8b50a2eb45c991'
	 '6a49a2c1d1a88e56731c37f30b2b531b'
	 '6f52674f03f58e38d93b4f4b4e67a8ec'
	 '3f795292e67a71f31872781b3a606862')

install=('cartaodecidadao.install')

package() {
  # Application Files
  install -D -m644 ${srcdir}/Cartao_de_Cidadao/install/libpteidpkcs11.so.${pkgver} ${pkgdir}/usr/lib/libpteidpkcs11.so.${pkgver}
  install -D -m644 ${srcdir}/Cartao_de_Cidadao/install/libpteidlibopensc.so.${pkgver}  ${pkgdir}/usr/lib/libpteidlibopensc.so.${pkgver}
  install -D -m644 ${srcdir}/Cartao_de_Cidadao/install/libpteid.so.${pkgver} ${pkgdir}/usr/lib/libpteid.so.${pkgver}
  install -D -m644 ${srcdir}/Cartao_de_Cidadao/install/libpteiddlg.so.${pkgver} ${pkgdir}/usr/lib/libpteiddlg.so.${pkgver}
  install -D -m644 ${srcdir}/Cartao_de_Cidadao/install/libpteidhttps.so.${pkgver} ${pkgdir}/usr/lib/libpteidhttps.so.${pkgver}

  ln -sf libpteidpkcs11.so.${pkgver} ${pkgdir}/usr/lib/libpteidpkcs11.so
  ln -sf libpteidlibopensc.so.${pkgver} ${pkgdir}/usr/lib/libpteidlibopensc.so
  ln -sf libpteid.so.${pkgver} ${pkgdir}/usr/lib/libpteid.so
  ln -sf libpteiddlg.so.${pkgver} ${pkgdir}/usr/lib/libpteiddlg.so
  ln -sf libpteidhttps.so.${pkgver} ${pkgdir}/usr/lib/libpteidhttps.so

  install -D -m755 ${srcdir}/Cartao_de_Cidadao/install/pteidgui ${pkgdir}/usr/bin/pteidgui
  install -D -m755 ${srcdir}/Cartao_de_Cidadao/install/pteidtrayapplet ${pkgdir}/usr/bin/pteidtrayapplet
  install -D -m755 ${srcdir}/Cartao_de_Cidadao/install/pteiddlgsrv ${pkgdir}/usr/bin/pteiddlgsrv

  install -D -m644 ${srcdir}/Cartao_de_Cidadao/install/libqtjp2.so ${pkgdir}/usr/bin/imageformats/libqtjp2.so

  install -D -m644 ${srcdir}/Cartao_de_Cidadao/install/pcscerrors_pt.qm ${pkgdir}/usr/bin/translations/pcscerrors_pt.qm
  install -D -m644 ${srcdir}/Cartao_de_Cidadao/install/pteiddlg_pt.qm ${pkgdir}/usr/bin/translations/pteiddlg_pt.qm
  install -D -m644 ${srcdir}/Cartao_de_Cidadao/install/pteidgui_pt.qm ${pkgdir}/usr/bin/translations/pteidgui_pt.qm
  install -D -m644 ${srcdir}/Cartao_de_Cidadao/install/pteidtrayapplet_pt.qm ${pkgdir}/usr/bin/translations/pteidtrayapplet_pt.qm

  install -D -m644 ${srcdir}/Cartao_de_Cidadao/install/pteidlib.h ${pkgdir}/usr/include/pteid/pteidlib.h
  install -D -m644 ${srcdir}/Cartao_de_Cidadao/install/pteiddefines.h ${pkgdir}/usr/include/pteid/pteiddefines.h

  install -D -m644 ${srcdir}/Cartao_de_Cidadao/install/libpteidpp1_gempc.so.${pkgver} ${pkgdir}/usr/lib/pteidpp/libpteidpp1_gempc.so.${pkgver}
  ln -sf libpteidpp1_gempc.so.${pkgver} ${pkgdir}/usr/lib/pteidpp/libpteidpp1_gempc.so

  install -D -m644 ${srcdir}/Cartao_de_Cidadao/install/pteidlibj.jar ${pkgdir}/usr/lib/pteid_jni/pteidlibj.jar
  install -D -m644 ${srcdir}/Cartao_de_Cidadao/install/libpteidlibj.so.${pkgver} ${pkgdir}/usr/lib/pteid_jni/libpteidlibj.so.${pkgver}
  install -D -m644 ${srcdir}/Cartao_de_Cidadao/install/Test.java ${pkgdir}/usr/lib/pteid_jni/Test.java
  ln -sf libpteidlibj.so.${pkgver} ${pkgdir}/usr/lib/pteid_jni/libpteidlibj.so

  install -D -m644 ${srcdir}/Cartao_de_Cidadao/install/CartaodeCidadao001.der ${pkgdir}/usr/bin/eidstore/certs/CartaodeCidadao001.der
  install -D -m644 ${srcdir}/Cartao_de_Cidadao/install/ECRaizEstado_novo_assinado_GTE.der ${pkgdir}/usr/bin/eidstore/certs/ECRaizEstado_novo_assinado_GTE.der
  install -D -m644 ${srcdir}/Cartao_de_Cidadao/install/GTEGlobalRoot.der ${pkgdir}/usr/bin/eidstore/certs/GTEGlobalRoot.der

  # Licenses
  install -D -m644 ${srcdir}/Cartao_de_Cidadao/Licenca_PT.rtf ${pkgdir}/usr/share/licenses/${pkgname}/Licenca_PT.rtf
  install -D -m644 ${srcdir}/Cartao_de_Cidadao/License_EN.rtf ${pkgdir}/usr/share/licenses/${pkgname}/License_EN.rtf
  install -D -m644 ${srcdir}/Cartao_de_Cidadao/license_lgpl ${pkgdir}/usr/share/licenses/${pkgname}/license_lgpl
  install -D -m644 ${srcdir}/Cartao_de_Cidadao/license_openssl ${pkgdir}/usr/share/licenses/${pkgname}/license_openssl
  install -D -m644 ${srcdir}/Cartao_de_Cidadao/README ${pkgdir}/usr/share/${pkgname}/README
  install -D -m644 ${srcdir}/Cartao_de_Cidadao/VERSION ${pkgdir}/usr/share/${pkgname}/VERSION

  # Icon and Desktop Files			
  install -D -m644 ${srcdir}/cartaodecidadao.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/cartaodecidadao.png
  install -D -m644 ${srcdir}/Cartao\ de\ Cidadao.desktop ${pkgdir}/usr/share/applications/Cartao\ de\ Cidadao.desktop
}
