#Contributor: Lewis "mystax" Hulbert <mystax@wagn.me>
#Maintainer: Lewis "mystax" Hulbert <mystax@wagn.me>
pkgname=voltz-server
pkgver=1.0.11
pkgrel=10
pkgdesc="Server for the Voltz modpack."
arch=(any)
url="http://www.technicpack.net/voltz"
license=("unknown")
depends=("java-runtime")
source=('http://mirror.technicpack.net/Technic/servers/voltz/Voltz_Server_v1.0.11.zip' 'voltz.sh')
md5sums=('ddd9dc8bc8d165e3dfddca083328bb01' '09849d38661d7db779b9af47c67137fb')

package() {
  install -Dm644 "$srcdir/Voltz.jar" "$pkgdir/srv/voltz-server/Voltz.jar"
  install -Dm755 "$srcdir/voltz.sh" "$pkgdir/srv/voltz-server/voltz.sh"
  mkdir "$pkgdir/srv/voltz-server/config"
  cp -r "$srcdir/config/"{forge.cfg,forgeChunkLoading.cfg,Mekanism.cfg,mmmPowersuits.cfg,ModularForceFieldSystem.cfg,NEI.cfg,NEIServer.cfg,NEISubset.cfg} "$pkgdir/srv/voltz-server/config"
  chmod 644 "$pkgdir/srv/voltz-server/config/"{forge.cfg,forgeChunkLoading.cfg,Mekanism.cfg,mmmPowersuits.cfg,ModularForceFieldSystem.cfg,NEI.cfg,NEIServer.cfg,NEISubset.cfg}
  install -Dm644 "$srcdir/config/config/PowerTools.cfg" "$pkgdir/srv/voltz-server/config/config/PowerTools.cfg"
  mkdir "$pkgdir/srv/voltz-server/config/railcraft"
  cp -r "$srcdir/config/railcraft/"{modules.cfg,railcraft.cfg} "$pkgdir/srv/voltz-server/config/railcraft"
  mkdir "$pkgdir/srv/voltz-server/config/railcraft/lang"
  chmod 644 "$pkgdir/srv/voltz-server/config/railcraft/"{modules.cfg,railcraft.cfg}
  mkdir "$pkgdir/srv/voltz-server/config/UniversalElectricity"
  cp -r "$srcdir/config/UniversalElectricity/"{AssemblyLine.cfg,AtomicScience.cfg,BasicUtilities.cfg,BlastCraft.cfg,ElectricExpansion.cfg,ICBM.cfg,UniversalElectricity.cfg} "$pkgdir/srv/voltz-server/config/UniversalElectricity"
  chmod 644 "$pkgdir/srv/voltz-server/config/UniversalElectricity/"{AssemblyLine.cfg,AtomicScience.cfg,BasicUtilities.cfg,BlastCraft.cfg,ElectricExpansion.cfg,ICBM.cfg,UniversalElectricity.cfg}
  mkdir "$pkgdir/srv/voltz-server/coremods"
  cp -r "$srcdir/coremods/"{"CodeChickenCore 0.7.1.0.jar","NotEnoughItems 1.4.5.1.jar"} "$pkgdir/srv/voltz-server/coremods"
  chmod 644 "$pkgdir/srv/voltz-server/coremods/"{"CodeChickenCore 0.7.1.0.jar","NotEnoughItems 1.4.5.1.jar"}
  mkdir "$pkgdir/srv/voltz-server/mods"
  cp -r "$srcdir/mods/"{AssemblyLine_v0.2.4.62.jar,AtomicScience_v0.3.4.134.jar,BasicComponents_v1.2.4.335.jar,BlastCraft_v0.6.1.25.jar,ElectricExpansion_v1.3.9.jar,Fluid-Mechanics_v0.2.6.14.jar,ICBM_v1.0.3.129.jar,MekanismGenerators-v5.2.0.jar,MekanismTools-v5.2.0.jar,Mekanism-v5.2.0.jar,ModularForceFieldSystemV2.2.8.3.6.zip,ModularPowersuits-0.2.0-23.jar,Railcraft_1.4.6-6.14.0.0.zip} "$pkgdir/srv/voltz-server/mods"
  chmod 644 "$pkgdir/srv/voltz-server/mods/"{AssemblyLine_v0.2.4.62.jar,AtomicScience_v0.3.4.134.jar,BasicComponents_v1.2.4.335.jar,BlastCraft_v0.6.1.25.jar,ElectricExpansion_v1.3.9.jar,Fluid-Mechanics_v0.2.6.14.jar,ICBM_v1.0.3.129.jar,MekanismGenerators-v5.2.0.jar,MekanismTools-v5.2.0.jar,Mekanism-v5.2.0.jar,ModularForceFieldSystemV2.2.8.3.6.zip,ModularPowersuits-0.2.0-23.jar,Railcraft_1.4.6-6.14.0.0.zip}
}

# vim:set ts=2 sw=2 et:
