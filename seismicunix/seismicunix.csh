# Make sure CWPROOT is set
if ( $?CWPROOT ) then
    exit
endif
setenv CWPROOT /opt/seismicunix
setenv PATH ${PATH}:${CWPROOT}/bin
